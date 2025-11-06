DROP TABLE IF EXISTS order_item;
DROP TABLE IF EXISTS customer_order;
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS client;
DROP TABLE IF EXISTS category;

CREATE TABLE IF NOT EXISTS category(
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    parent_id INT REFERENCES category(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS product (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    quantity INT CHECK (quantity >= 0),
    price REAL NOT NULL CHECK(price >= 0),
    category_id INT REFERENCES category(id)
);

CREATE TABLE IF NOT EXISTS client(
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    address TEXT
);

CREATE TABLE IF NOT EXISTS customer_order (
    id INTEGER PRIMARY KEY,
    client_id INT REFERENCES client(id),
    order_date TEXT DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS order_item (
    id INTEGER PRIMARY KEY,
    order_id INT REFERENCES customer_order(id),
    product_id INT REFERENCES product(id),
    quantity INT NOT NULL CHECK (quantity > 0)
);

