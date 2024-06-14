CREATE TABLE addresses(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE categories(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(10) NOT NULL
);

CREATE TABLE clients(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name VARCHAR(50) NOT NULL,
    phone_number VARCHAR(20) NOT NULL
);

CREATE TABLE drivers(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    age INT NOT NULL CHECK ( age > 0 ),
    rating NUMERIC(2) DEFAULT 5.5
);

CREATE TABLE cars(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    make VARCHAR(20) NOT NULL,
    model VARCHAR(20),
    year INT DEFAULT 0 CHECK ( year > 0 ) NOT NULL,
    mileage INT DEFAULT 0 CHECK ( mileage > 0 ),
    condition CHAR(1) NOT NULL,
    category_id INT NOT NULL
);

CREATE TABLE courses(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    from_address_id INT NOT NULL,
    start TIMESTAMP NOT NULL,
    bill NUMERIC(10, 2) DEFAULT 10 CHECK (bill > 0),
    car_id INT NOT NULL,
    client_id INT NOT NULL
);

CREATE TABLE cars_drivers(
    car_id INT NOT NULL,
    driver_id INT NOT NULL
);

ALTER TABLE cars
ADD CONSTRAINT fk_car_category_id
    FOREIGN KEY (category_id)
    REFERENCES categories(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

ALTER TABLE courses
ADD CONSTRAINT fk_course_address_id
    FOREIGN KEY (from_address_id)
    REFERENCES addresses(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,

ADD CONSTRAINT fk_course_car_id
    FOREIGN KEY (car_id)
    REFERENCES cars(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,

ADD CONSTRAINT fk_course_client_id
    FOREIGN KEY (client_id)
    REFERENCES clients(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

ALTER TABLE cars_drivers
ADD CONSTRAINT fk_driver_car_id
    FOREIGN KEY (car_id)
    REFERENCES cars(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
ADD CONSTRAINT fk_driver_id
    FOREIGN KEY (driver_id)
    REFERENCES drivers(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE;