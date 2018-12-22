import datetime
import sqlite3

import settings


columns = ['first_idol_id', 'first_score', 'second_idol_id', 'second_score', 'third_idol_id', 'third_score',
           'forth_idol_id', 'forth_score', 'fifth_idol_id', 'fifth_score', 'sixth_idol_id', 'sixth_score',
           'seventh_idol_id', 'seventh_score', 'eighth_idol_id', 'eighth_score', 'ninth_idol_id', 'ninth_score',
           'tenth_idol_id', 'tenth_score', 'time']
joined_columns = ','.join(columns)


class DatabaseManager:
    """
    データベース接続クラス
    """

    def __init__(self, database):
        self.connection = sqlite3.connect(database)
        self.cursor = self.connection.cursor()

    def execute(self, sql):
        """
        引数として与えられたSQLを実行する
        """

        return self.cursor.execute(sql)

    def find(self, sql):
        """
        １件SELECTする
        """

        return self.execute(sql).fetchone()

    def get(self, sql):
        """
        複数件SELECTする
        """

        return self.execute(sql).fetchall()

    def insert(self, sql):
        """
        レコードをINSERTする
        """

        self.execute(sql)
        self.commit()

    def commit(self):
        """
        変更をDBに反映する
        """

        self.connection.commit()

    def close(self):
        """
        コネクションを閉じる
        """

        self.connection.close()

    def __enter__(self):
        """
        withブロック開始時にコネクションが開いた状態のDatabaseManagerインスタンスを渡す
        """

        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        """
        withブロック終了時にコネクションを閉じる
        """

        self.close()


class TheaterChallengeDatabaseManager():
    """
    Theater Challenge関連でDBに触るためのクラス
    """

    def __init__(self):
        pass

    @staticmethod
    def get_current_record(table: str) -> list or None:
        """
        指定されたランキングテーブルの最新レコードを取得する
        """

        with DatabaseManager(settings.TC_DATABASE) as manager:
            query = '''
                SELECT
                    i1.name, t.first_score
                    FROM
                ''' + table + ''' AS t
                        JOIN idols as i1 ON i1.id = t.first_idol_id
                    ORDER BY
                        t.time
                        DESC
                    LIMIT
                        1
                ;'''
            record = manager.find(query)

        if record is None:
            return None

        return [{'name': record[i*2], 'score': record[i*2+1]} for i in range(10)]

    @staticmethod
    def get_current_record_without_join(table: str) -> list or None:
        """
        指定されたテーブルの最新レコードを、JOINしていない状態で取得する
        アイドルの名前でなくIDが入る
        """

        with DatabaseManager(settings.TC_DATABASE) as manager:
            query = f'SELECT {joined_columns} FROM {table} ORDER BY time DESC LIMIT 1;'
            record = manager.find(query)

        if record is None:
            return None

        return [{'id': record[i*2], 'score': record[i*2+1]} for i in range(10)]

    @staticmethod
    def insert_new_rankiing_record(table: str, response_time: datetime.datetime, ranking_data: list) -> None:
        """
        最新のランキングデータをINSERTする
        """

        values = [f'{idol["idol_id"]},\'{idol["score"]}\'' for idol in ranking_data]
        values.append(f'\'{response_time.strftime("%Y-%m-%d %H:%M:%S")}\'')

        with DatabaseManager(settings.TC_DATABASE) as manager:
            query = f'INSERT INTO {table} ({joined_columns}) VALUES ({",".join(values)});'
            manager.insert(query)

    @staticmethod
    def get_drama_name_by_role_name(role: str) -> str:
        """
        役名からドラマ名を取得する
        """

        with DatabaseManager(settings.TC_DATABASE) as manager:
            query = '''
                SELECT
                    dramas.name
                    FROM
                        dramas
                        JOIN
                            drama_roles
                            ON
                                dramas.id = drama_roles.drama_id
                        JOIN
                            roles
                            ON
                                roles.id = drama_roles.role_id
                    WHERE
                        roles.name = \'''' + role + '''\'
                ;'''
            record = manager.find(query)

        return record[0]
