import asyncio
import datetime
import discord
import json
import random
import requests

from db_manager import TheaterChallengeDatabaseManager
import reaction
import settings


tables = {
    'heroine_rankings': '主人公',
    'friend_rankings': '友達',
    'teacher_rankings': '先生',
    'mistress_rankings': '館の女主人',
    'maid_rankings': 'メイド',
    'girl_rankings': '少女',
    'fairy_rankings': '妖精',
    'witch_rankings': '魔法使い',
    'wolf_rankings': 'オオカミ',
    'traveler_rankings': '旅人',
    'dusk_rankings': 'ダスク',
    'buster_brade_rankings': 'バスターブレイド',
    'amaryllis_rankings': 'アマリリス',
    'velvet_rankings': 'ベルベット',
    'final_day_rankings': 'ファイナルデイ',
}


def get_ranking_str(rank, name, score) -> str:
    """
    アイドル１人の得票状況を示す行を生成します。
    ex. ' 1位：萩原雪歩　（ 12345票）'

    :param rank: 順位
    :param name: アイドル名
    :param score: 得票数
    :return: アイドル１人の得票状況
    """

    return f'{rank}'.rjust(2, ' ') + '位：' + f'{name}'.ljust(5, '　') + '（' + f'{score}'.rjust(6, ' ') + '票）'


def assemble_message(drama, role, ranking_str_list) -> str:
    """
    discordにPOSTするランキング実況メッセージのフォーマットを組み立てます。

    :param drama: ドラマ名
    :param role: 役名
    :param ranking_str_list: 得票状況の配列
    :return: 送信メッセージ
    """

    return '```' + \
        f'{drama}　【{role}】' + \
        '\n' * 2 + \
        '\n'.join(ranking_str_list) + \
        '```'


client = discord.Client()


@client.event
async def on_message(message):
    """
    Botが参加しているチャンネルで特定のワードを含むメッセージが送信された場合、
    そのチャンネルにメッセージを送信します。
    """

    reply = None

    # 誰かが /Yukivote から始まるメッセージを送信した場合、Botが反応するコマンド一覧を表示します。
    if message.content.startswith('/Yukivote'):
        reply = reaction.BOT_DESCRIPTION

    # 誰かが /dig から始まるメッセージを送信した場合、ゆきぽが鳴きます。
    if message.content.startswith('/dig'):
        reply = random.choice(reaction.YUKIPO_VOICE)

    # 誰かが /お茶 から始まるメッセージを送信した場合、お茶を淹れます。
    if message.content.startswith('/お茶'):
        reply = random.choice(reaction.MAKE_TEA) + reaction.SERVE_TEA

    # 誰かが /ranking から始まり、かつその後Theater Challengeの役名を含むメッセージを送信した場合、最新の投票状況を送信します。
    # /ranking とのその後のキーワードの間には半角スペースが１つ必要です。
    if message.content.startswith('/ranking '):
        keyword = message.content.split(' ')[1]

        if keyword in tables.values():
            # 役名からテーブルを逆引き
            table = [k for k, v in tables.items() if v == keyword][0]
            drama = TheaterChallengeDatabaseManager.get_drama_name_by_role_name(keyword)

            # 最新レコードから５人分のランキングデータを組み立て
            current_record = TheaterChallengeDatabaseManager.get_current_record(table)
            previous_record = TheaterChallengeDatabaseManager.get_previous_record(table)

            if current_record is None:
                reply = 'データの取得に失敗しました。しばらくしてから再度お試しください。'
            else:
                # 差分含めてランキングデータ組み立て
                ranking = []
                for i, data in enumerate(current_record):
                    # 同じアイドルに対するスコアの差分を取る
                    previous_score = list(filter(lambda x: x['name'] == data['name'], previous_record))
                    if len(previous_score) == 0:
                        difference = 0
                    else:
                        difference = data['score'] - previous_score[0]['score']
                    ranking.append(get_ranking_str(i+1, data['name'], data['score']) + f'（+{difference}）')

                reply = assemble_message(drama, keyword, ranking)

    if reply is not None:
        print(reply)
        try:
            await client.send_message(message.channel, reply)
        except discord.HTTPException as http_exception:
            print('Http Exception occurred: ' + http_exception.text)


@client.event
async def on_ready():
    channel = client.get_channel(settings.TC_RANKING_CHANNEL_ID)
    print('connected')

    return

    api_url = 'https://api.matsurihi.me/mltd/v1/election/current?prettyPrint=false'

    while True:
        response = requests.get(api_url)

        if response.status_code != 200:
            # 取得できなかった場合は１分待って再取得
            print('Failed with ' + str(response.status_code))
            await asyncio.sleep(60)
            continue

        parsed_body = json.loads(response.text)

        response_time = datetime.datetime.strptime(parsed_body[0]['summaryTime'], '%Y-%m-%dT%H:%M:%S+09:00')
        message = '取得日時：' + response_time.strftime("%Y年%m月%d日 %H時%M分") + '（取得元： https://api.matsurihi.me/ ）'

        print(message)
        try:
            await client.send_message(channel, message)
        except discord.HTTPException as http_exception:
            print('Http Exception occurred: ' + http_exception.text)

        for index, table in enumerate(tables.keys()):
            # 役名とドラマ名を取得
            role = tables[table]
            drama = TheaterChallengeDatabaseManager.get_drama_name_by_role_name(role)

            # 直近のレコードを取得
            prev_record = TheaterChallengeDatabaseManager.get_current_record_without_join(table)

            # APIから取得した現在のランキングを取得
            ranking = parsed_body[index]['data'][0]

            # 差分を計算
            if prev_record is None:
                differences = [0] * 10
            else:
                # TODO: 差分が完全に0の場合は再取得
                differences = []
                for i, idol in enumerate(ranking):
                    # 同じアイドルに対するスコアの差分を取る
                    previous_score = list(filter(lambda x: x['id'] == idol['idol_id'], prev_record))
                    if len(previous_score) == 0:
                        differences.append(0)
                    else:
                        differences.append(idol['score'] - previous_score[0]['score'])

            # 現在のランキング情報をDBに入れる
            TheaterChallengeDatabaseManager.insert_new_rankiing_record(table, response_time, ranking)

            # 各ランキングの上位５人の得票状況を差分含めて生成
            ranking_str = [
                get_ranking_str(idol['rank'], idol['idol_name'], idol['score']) + f'（+{differences[index]}）'
                for index, idol in enumerate(ranking[:5])
            ]
            message = assemble_message(drama, role, ranking_str)

            print(message)
            try:
                await client.send_message(channel, message)
            except discord.HTTPException as http_exception:
                print('Http Exception occurred: ' + http_exception.text)

        await asyncio.sleep(300)


client.run(settings.BOT_TOKEN)
