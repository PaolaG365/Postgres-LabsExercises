CREATE TABLE categories(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE addresses(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    street_name VARCHAR(100) NOT NULL,
    street_number INT NOT NULL,
    town VARCHAR(30) NOT NULL,
    country VARCHAR(50) NOT NULL,
    zip_code INT NOT NULL,

    CONSTRAINT ck_pos_st_num
        CHECK ( street_number > 0 ),

    CONSTRAINT ck_pos_zip
        CHECK ( zip_code > 0 )
);

CREATE TABLE publishers(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    address_id INT NOT NULL,
    website VARCHAR(40),
    phone VARCHAR(20),

    CONSTRAINT fk_publisher_add_id
        FOREIGN KEY (address_id)
        REFERENCES addresses(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE players_ranges(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    min_players INT NOT NULL,
    max_players INT NOT NULL,

    CONSTRAINT ch_min_pl_positive
        CHECK ( min_players > 0 ),
    CONSTRAINT ch_max_pl_pos
        CHECK ( max_players > 0 )
);

CREATE TABLE creators(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    email VARCHAR(30) NOT NULL
);

CREATE TABLE board_games(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    release_year INT NOT NULL,
    rating NUMERIC(2) NOT NULL,
    category_id INT NOT NULL,
    publisher_id INT NOT NULL,
    players_range_id INT NOT NULL,

    CONSTRAINT ch_positive_year
        CHECK ( release_year > 0 ),

    CONSTRAINT fk_game_category
        FOREIGN KEY (category_id)
        REFERENCES categories(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_game_publisher
        FOREIGN KEY (publisher_id)
        REFERENCES publishers(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_game_pl_range
        FOREIGN KEY (players_range_id)
        REFERENCES players_ranges(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE creators_board_games(
    creator_id INT NOT NULL,
    board_game_id INT NOT NULL,

    CONSTRAINT fk_game_creator_id
        FOREIGN KEY (creator_id)
        REFERENCES creators(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_creator_game_id
        FOREIGN KEY (board_game_id)
        REFERENCES board_games(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);