CREATE TABLE item_types (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    item_type_name VARCHAR(50)
);

CREATE TABLE items (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    item_name VARCHAR(50),
    item_type_id INT,

    CONSTRAINT fk_item_item_type
        FOREIGN KEY (item_type_id)
        REFERENCES item_types(id)
);

CREATE TABLE cities (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    city_name VARCHAR(50)
);

CREATE TABLE customers (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_name VARCHAR(50),
    birthday DATE,
    city_id INT,

    CONSTRAINT fk_city_id_cities
        FOREIGN KEY (city_id)
        REFERENCES cities(id)
);

CREATE TABLE orders (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_id INT,

    CONSTRAINT fk_customer_id_customers
        FOREIGN KEY (customer_id)
        REFERENCES customers(id)
);

CREATE TABLE order_items ( -- junction table between items and orders
    order_id INT,
    item_id INT,

    CONSTRAINT pk_orders_items
        PRIMARY KEY (order_id, item_id),

    CONSTRAINT fk_order_id_orders
        FOREIGN KEY (order_id)
        REFERENCES orders(id),

    CONSTRAINT fk_item_id_items
        FOREIGN KEY (item_id)
        REFERENCES items(id)
);