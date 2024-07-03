CREATE TABLE accounts(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    username VARCHAR(30) NOT NULL UNIQUE,
    password VARCHAR(30) NOT NULL,
    email VARCHAR(50) NOT NULL,
    gender CHAR(1) NOT NULL,
    age INT NOT NULL,
    job_title VARCHAR(40) NOT NULL,
    ip VARCHAR(30) NOT NULL,

    CONSTRAINT ch_male_or_female_no_other_genders_allowed
        CHECK ( gender = 'M' OR gender = 'F' )
);

CREATE TABLE addresses(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    street VARCHAR(30) NOT NULL,
    town VARCHAR(30) NOT NULL,
    country VARCHAR(30) NOT NULL,
    account_id INT NOT NULL,

    CONSTRAINT fk_address_account_id
        FOREIGN KEY (account_id)
        REFERENCES accounts(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE photos(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    description TEXT,
    capture_date TIMESTAMP NOT NULL,
    views INT DEFAULT 0 NOT NULL,

    CONSTRAINT ch_positive_views
        CHECK (views >= 0)
);

CREATE TABLE comments(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    content VARCHAR NOT NULL,
    published_on TIMESTAMP NOT NULL,
    photo_id INT NOT NULL,

    CONSTRAINT fk_comment_photo_id
        FOREIGN KEY (photo_id)
        REFERENCES photos(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE accounts_photos(
    account_id INT NOT NULL,
    photo_id INT NOT NULL,

    CONSTRAINT pk_acc_photos_junction
        PRIMARY KEY (account_id, photo_id),

    CONSTRAINT fk_photo_account_id
        FOREIGN KEY (account_id)
        REFERENCES accounts(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_acc_photo_id
        FOREIGN KEY (photo_id)
        REFERENCES photos(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE likes(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    photo_id INT NOT NULL,
    account_id INT NOT NULL,

    CONSTRAINT fk_likes_acc_id
        FOREIGN KEY (account_id)
        REFERENCES accounts(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_likes_photo_id
        FOREIGN KEY (photo_id)
        REFERENCES photos(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);