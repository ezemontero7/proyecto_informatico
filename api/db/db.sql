CREATE DATABASE IF NOT EXISTS db_proyecto_api;
USE db_proyecto_api_;

CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS clients (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    surname VARCHAR(255) NOT NULL,
    id_user INT,
    email VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_user) REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    stock INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE IF NOT EXISTS services (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE IF NOT EXISTS invoices (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_user INT,
    id_client INT,
    invoice_date DATE NOT NULL,
    FOREIGN KEY (id_user) REFERENCES users(id),
    FOREIGN KEY (id_client) REFERENCES clients(id)
);

CREATE TABLE IF NOT EXISTS invoice_details (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_invoice INT,
    id_product INT,
    quantity INT,
    total_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_invoice) REFERENCES invoices(id),
    FOREIGN KEY (id_product) REFERENCES products(id)
);