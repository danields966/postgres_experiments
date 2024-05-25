DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    birth DATE
);

DROP TABLE IF EXISTS purchases;
CREATE TABLE purchases (
    sku INT,
    price NUMERIC(10, 2) NOT NULL,
    user_id INT,
    date DATE,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS banned_users;
CREATE TABLE banned_users (
    user_id INT,
    date_from DATE,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO users (firstname, lastname, birth) VALUES
    ('Ivan', 'Ivanov', '1990-01-01'),
    ('Petr', 'Petrov', '1985-03-15'),
    ('Anna', 'Petrova', '2000-07-22');

INSERT INTO purchases (sku, price, user_id, date) VALUES
    (1, 500.00, 1, '2024-05-01'),
    (1, 150.00, 1, '2024-05-02'),
    (2, 350.00, 1, '2024-05-03'),
    (3, 200.00, 2, '2024-05-04'),
    (3, 450.00, 2, '2024-05-04'),
    (3, 100.00, 3, '2024-05-04'),
    (4, 250.00, 3, '2024-05-05');

INSERT INTO banned_users (user_id, date_from) VALUES
    (1, '2024-05-03');
