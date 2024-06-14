CREATE TABLE owners
(
    id           INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name         VARCHAR(50) NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    address      VARCHAR(50)
);

CREATE TABLE animal_types
(
    id          INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    animal_type VARCHAR(30) NOT NULL
);

CREATE TABLE cages
(
    id             INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    animal_type_id INT NOT NULL
);

CREATE TABLE animals
(
    id             INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name           VARCHAR(30) NOT NULL,
    birthdate      DATE        NOT NULL,
    owner_id       INT,
    animal_type_id INT         NOT NULL
);

CREATE TABLE volunteers_departments
(
    id              INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    department_name VARCHAR(30) NOT NULL
);

CREATE TABLE volunteers
(
    id            INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name          VARCHAR(50) NOT NULL,
    phone_number  VARCHAR(15) NOT NULL,
    address       VARCHAR(50),
    animal_id     INT,
    department_id INT         NOT NULL
);

CREATE TABLE animals_cages
(
    cage_id   INT NOT NULL,
    animal_id INT NOT NULL
);

ALTER TABLE cages
    ADD CONSTRAINT fk_animal_type_id
        FOREIGN KEY (animal_type_id)
            REFERENCES animal_types (id)
            ON DELETE CASCADE
            ON UPDATE CASCADE;

ALTER TABLE animals
    ADD CONSTRAINT fk_animal_owner_id
        FOREIGN KEY (owner_id)
            REFERENCES owners (id)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    ADD CONSTRAINT fk_animal_type_id_type
        FOREIGN KEY (animal_type_id)
            REFERENCES animal_types (id)
            ON DELETE CASCADE
            ON UPDATE CASCADE;

ALTER TABLE volunteers
    ADD CONSTRAINT fk_volunteer_animal_id_
        FOREIGN KEY (animal_id)
            REFERENCES animals (id)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    ADD CONSTRAINT fk_volunteer_department_id
        FOREIGN KEY (department_id)
            REFERENCES volunteers_departments (id)
            ON DELETE CASCADE
            ON UPDATE CASCADE;

ALTER TABLE animals_cages
    --ADD PRIMARY KEY (cage_id, animal_id), -- its not supposed to be pk even though its a junction table wtf
    ADD CONSTRAINT fk_animal_cage_id
        FOREIGN KEY (cage_id)
            REFERENCES cages (id)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    ADD CONSTRAINT fk_caged_ani_id
        FOREIGN KEY (animal_id)
            REFERENCES animals (id)
            ON DELETE CASCADE
            ON UPDATE CASCADE;