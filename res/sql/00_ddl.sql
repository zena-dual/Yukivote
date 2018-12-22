-- アイドルマスタテーブル
CREATE TABLE idols (
    id int NOT NULL,
    name text NOT NULL
);

-- ドラママスタテーブル
CREATE TABLE dramas (
    id int NOT NULL,
    name text NOT NULL
);

-- 役マスタテーブル
CREATE TABLE roles (
    id int NOT NULL,
    name text NOT NULL,
    name_en text NOT NULL
);

-- ドラマ-役リレーションテーブル
CREATE TABLE drama_roles (
    drama_id NOT NULL,
    role_id NOT NULL
);

-- 役ごとのランキングヒストリテーブル
CREATE TABLE heroine_rankings (
    first_idol_id int NOT NULL,
    first_score int NOT NULL,
    second_idol_id int NOT NULL,
    second_score int NOT NULL,
    third_idol_id int NOT NULL,
    third_score int NOT NULL,
    forth_idol_id int NOT NULL,
    forth_score int NOT NULL,
    fifth_idol_id int NOT NULL,
    fifth_score int NOT NULL,
    sixth_idol_id int NOT NULL,
    sixth_score int NOT NULL,
    seventh_idol_id int NOT NULL,
    seventh_score int NOT NULL,
    eighth_idol_id int NOT NULL,
    eighth_score int NOT NULL,
    ninth_idol_id int NOT NULL,
    ninth_score int NOT NULL,
    tenth_idol_id int NOT NULL,
    tenth_score int NOT NULL,
    time TEXT NOT NULL default CURRENT_TIMESTAMP
);

CREATE TABLE final_day_rankings (
    first_idol_id int NOT NULL,
    first_score int NOT NULL,
    second_idol_id int NOT NULL,
    second_score int NOT NULL,
    third_idol_id int NOT NULL,
    third_score int NOT NULL,
    forth_idol_id int NOT NULL,
    forth_score int NOT NULL,
    fifth_idol_id int NOT NULL,
    fifth_score int NOT NULL,
    sixth_idol_id int NOT NULL,
    sixth_score int NOT NULL,
    seventh_idol_id int NOT NULL,
    seventh_score int NOT NULL,
    eighth_idol_id int NOT NULL,
    eighth_score int NOT NULL,
    ninth_idol_id int NOT NULL,
    ninth_score int NOT NULL,
    tenth_idol_id int NOT NULL,
    tenth_score int NOT NULL,
    time TEXT NOT NULL default CURRENT_TIMESTAMP
);

CREATE TABLE witch_rankings (
    first_idol_id int NOT NULL,
    first_score int NOT NULL,
    second_idol_id int NOT NULL,
    second_score int NOT NULL,
    third_idol_id int NOT NULL,
    third_score int NOT NULL,
    forth_idol_id int NOT NULL,
    forth_score int NOT NULL,
    fifth_idol_id int NOT NULL,
    fifth_score int NOT NULL,
    sixth_idol_id int NOT NULL,
    sixth_score int NOT NULL,
    seventh_idol_id int NOT NULL,
    seventh_score int NOT NULL,
    eighth_idol_id int NOT NULL,
    eighth_score int NOT NULL,
    ninth_idol_id int NOT NULL,
    ninth_score int NOT NULL,
    tenth_idol_id int NOT NULL,
    tenth_score int NOT NULL,
    time TEXT NOT NULL default CURRENT_TIMESTAMP
);

CREATE TABLE traveler_rankings (
    first_idol_id int NOT NULL,
    first_score int NOT NULL,
    second_idol_id int NOT NULL,
    second_score int NOT NULL,
    third_idol_id int NOT NULL,
    third_score int NOT NULL,
    forth_idol_id int NOT NULL,
    forth_score int NOT NULL,
    fifth_idol_id int NOT NULL,
    fifth_score int NOT NULL,
    sixth_idol_id int NOT NULL,
    sixth_score int NOT NULL,
    seventh_idol_id int NOT NULL,
    seventh_score int NOT NULL,
    eighth_idol_id int NOT NULL,
    eighth_score int NOT NULL,
    ninth_idol_id int NOT NULL,
    ninth_score int NOT NULL,
    tenth_idol_id int NOT NULL,
    tenth_score int NOT NULL,
    time TEXT NOT NULL default CURRENT_TIMESTAMP
);

CREATE TABLE friend_rankings (
    first_idol_id int NOT NULL,
    first_score int NOT NULL,
    second_idol_id int NOT NULL,
    second_score int NOT NULL,
    third_idol_id int NOT NULL,
    third_score int NOT NULL,
    forth_idol_id int NOT NULL,
    forth_score int NOT NULL,
    fifth_idol_id int NOT NULL,
    fifth_score int NOT NULL,
    sixth_idol_id int NOT NULL,
    sixth_score int NOT NULL,
    seventh_idol_id int NOT NULL,
    seventh_score int NOT NULL,
    eighth_idol_id int NOT NULL,
    eighth_score int NOT NULL,
    ninth_idol_id int NOT NULL,
    ninth_score int NOT NULL,
    tenth_idol_id int NOT NULL,
    tenth_score int NOT NULL,
    time TEXT NOT NULL default CURRENT_TIMESTAMP
);

CREATE TABLE velvet_rankings (
    first_idol_id int NOT NULL,
    first_score int NOT NULL,
    second_idol_id int NOT NULL,
    second_score int NOT NULL,
    third_idol_id int NOT NULL,
    third_score int NOT NULL,
    forth_idol_id int NOT NULL,
    forth_score int NOT NULL,
    fifth_idol_id int NOT NULL,
    fifth_score int NOT NULL,
    sixth_idol_id int NOT NULL,
    sixth_score int NOT NULL,
    seventh_idol_id int NOT NULL,
    seventh_score int NOT NULL,
    eighth_idol_id int NOT NULL,
    eighth_score int NOT NULL,
    ninth_idol_id int NOT NULL,
    ninth_score int NOT NULL,
    tenth_idol_id int NOT NULL,
    tenth_score int NOT NULL,
    time TEXT NOT NULL default CURRENT_TIMESTAMP
);

CREATE TABLE wolf_rankings (
    first_idol_id int NOT NULL,
    first_score int NOT NULL,
    second_idol_id int NOT NULL,
    second_score int NOT NULL,
    third_idol_id int NOT NULL,
    third_score int NOT NULL,
    forth_idol_id int NOT NULL,
    forth_score int NOT NULL,
    fifth_idol_id int NOT NULL,
    fifth_score int NOT NULL,
    sixth_idol_id int NOT NULL,
    sixth_score int NOT NULL,
    seventh_idol_id int NOT NULL,
    seventh_score int NOT NULL,
    eighth_idol_id int NOT NULL,
    eighth_score int NOT NULL,
    ninth_idol_id int NOT NULL,
    ninth_score int NOT NULL,
    tenth_idol_id int NOT NULL,
    tenth_score int NOT NULL,
    time TEXT NOT NULL default CURRENT_TIMESTAMP
);

CREATE TABLE teacher_rankings (
    first_idol_id int NOT NULL,
    first_score int NOT NULL,
    second_idol_id int NOT NULL,
    second_score int NOT NULL,
    third_idol_id int NOT NULL,
    third_score int NOT NULL,
    forth_idol_id int NOT NULL,
    forth_score int NOT NULL,
    fifth_idol_id int NOT NULL,
    fifth_score int NOT NULL,
    sixth_idol_id int NOT NULL,
    sixth_score int NOT NULL,
    seventh_idol_id int NOT NULL,
    seventh_score int NOT NULL,
    eighth_idol_id int NOT NULL,
    eighth_score int NOT NULL,
    ninth_idol_id int NOT NULL,
    ninth_score int NOT NULL,
    tenth_idol_id int NOT NULL,
    tenth_score int NOT NULL,
    time TEXT NOT NULL default CURRENT_TIMESTAMP
);

CREATE TABLE amaryllis_rankings (
    first_idol_id int NOT NULL,
    first_score int NOT NULL,
    second_idol_id int NOT NULL,
    second_score int NOT NULL,
    third_idol_id int NOT NULL,
    third_score int NOT NULL,
    forth_idol_id int NOT NULL,
    forth_score int NOT NULL,
    fifth_idol_id int NOT NULL,
    fifth_score int NOT NULL,
    sixth_idol_id int NOT NULL,
    sixth_score int NOT NULL,
    seventh_idol_id int NOT NULL,
    seventh_score int NOT NULL,
    eighth_idol_id int NOT NULL,
    eighth_score int NOT NULL,
    ninth_idol_id int NOT NULL,
    ninth_score int NOT NULL,
    tenth_idol_id int NOT NULL,
    tenth_score int NOT NULL,
    time TEXT NOT NULL default CURRENT_TIMESTAMP
);

CREATE TABLE fairy_rankings (
    first_idol_id int NOT NULL,
    first_score int NOT NULL,
    second_idol_id int NOT NULL,
    second_score int NOT NULL,
    third_idol_id int NOT NULL,
    third_score int NOT NULL,
    forth_idol_id int NOT NULL,
    forth_score int NOT NULL,
    fifth_idol_id int NOT NULL,
    fifth_score int NOT NULL,
    sixth_idol_id int NOT NULL,
    sixth_score int NOT NULL,
    seventh_idol_id int NOT NULL,
    seventh_score int NOT NULL,
    eighth_idol_id int NOT NULL,
    eighth_score int NOT NULL,
    ninth_idol_id int NOT NULL,
    ninth_score int NOT NULL,
    tenth_idol_id int NOT NULL,
    tenth_score int NOT NULL,
    time TEXT NOT NULL default CURRENT_TIMESTAMP
);

CREATE TABLE maid_rankings (
    first_idol_id int NOT NULL,
    first_score int NOT NULL,
    second_idol_id int NOT NULL,
    second_score int NOT NULL,
    third_idol_id int NOT NULL,
    third_score int NOT NULL,
    forth_idol_id int NOT NULL,
    forth_score int NOT NULL,
    fifth_idol_id int NOT NULL,
    fifth_score int NOT NULL,
    sixth_idol_id int NOT NULL,
    sixth_score int NOT NULL,
    seventh_idol_id int NOT NULL,
    seventh_score int NOT NULL,
    eighth_idol_id int NOT NULL,
    eighth_score int NOT NULL,
    ninth_idol_id int NOT NULL,
    ninth_score int NOT NULL,
    tenth_idol_id int NOT NULL,
    tenth_score int NOT NULL,
    time TEXT NOT NULL default CURRENT_TIMESTAMP
);

CREATE TABLE buster_brade_rankings (
    first_idol_id int NOT NULL,
    first_score int NOT NULL,
    second_idol_id int NOT NULL,
    second_score int NOT NULL,
    third_idol_id int NOT NULL,
    third_score int NOT NULL,
    forth_idol_id int NOT NULL,
    forth_score int NOT NULL,
    fifth_idol_id int NOT NULL,
    fifth_score int NOT NULL,
    sixth_idol_id int NOT NULL,
    sixth_score int NOT NULL,
    seventh_idol_id int NOT NULL,
    seventh_score int NOT NULL,
    eighth_idol_id int NOT NULL,
    eighth_score int NOT NULL,
    ninth_idol_id int NOT NULL,
    ninth_score int NOT NULL,
    tenth_idol_id int NOT NULL,
    tenth_score int NOT NULL,
    time TEXT NOT NULL default CURRENT_TIMESTAMP
);

CREATE TABLE girl_rankings (
    first_idol_id int NOT NULL,
    first_score int NOT NULL,
    second_idol_id int NOT NULL,
    second_score int NOT NULL,
    third_idol_id int NOT NULL,
    third_score int NOT NULL,
    forth_idol_id int NOT NULL,
    forth_score int NOT NULL,
    fifth_idol_id int NOT NULL,
    fifth_score int NOT NULL,
    sixth_idol_id int NOT NULL,
    sixth_score int NOT NULL,
    seventh_idol_id int NOT NULL,
    seventh_score int NOT NULL,
    eighth_idol_id int NOT NULL,
    eighth_score int NOT NULL,
    ninth_idol_id int NOT NULL,
    ninth_score int NOT NULL,
    tenth_idol_id int NOT NULL,
    tenth_score int NOT NULL,
    time TEXT NOT NULL default CURRENT_TIMESTAMP
);

CREATE TABLE dusk_rankings (
    first_idol_id int NOT NULL,
    first_score int NOT NULL,
    second_idol_id int NOT NULL,
    second_score int NOT NULL,
    third_idol_id int NOT NULL,
    third_score int NOT NULL,
    forth_idol_id int NOT NULL,
    forth_score int NOT NULL,
    fifth_idol_id int NOT NULL,
    fifth_score int NOT NULL,
    sixth_idol_id int NOT NULL,
    sixth_score int NOT NULL,
    seventh_idol_id int NOT NULL,
    seventh_score int NOT NULL,
    eighth_idol_id int NOT NULL,
    eighth_score int NOT NULL,
    ninth_idol_id int NOT NULL,
    ninth_score int NOT NULL,
    tenth_idol_id int NOT NULL,
    tenth_score int NOT NULL,
    time TEXT NOT NULL default CURRENT_TIMESTAMP
);

CREATE TABLE mistress_rankings (
    first_idol_id int NOT NULL,
    first_score int NOT NULL,
    second_idol_id int NOT NULL,
    second_score int NOT NULL,
    third_idol_id int NOT NULL,
    third_score int NOT NULL,
    forth_idol_id int NOT NULL,
    forth_score int NOT NULL,
    fifth_idol_id int NOT NULL,
    fifth_score int NOT NULL,
    sixth_idol_id int NOT NULL,
    sixth_score int NOT NULL,
    seventh_idol_id int NOT NULL,
    seventh_score int NOT NULL,
    eighth_idol_id int NOT NULL,
    eighth_score int NOT NULL,
    ninth_idol_id int NOT NULL,
    ninth_score int NOT NULL,
    tenth_idol_id int NOT NULL,
    tenth_score int NOT NULL,
    time TEXT NOT NULL default CURRENT_TIMESTAMP
);
