CREATE DATABASE IF NOT EXISTS ecom_db;
USE ecom_db;

CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    price DECIMAL(10,2)
);

INSERT INTO products (name, price) VALUES ('Laptop', 999.99), ('Phone', 699.99);
