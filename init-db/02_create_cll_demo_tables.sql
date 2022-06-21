-- CREATE DEMO SCHEMA

CREATE SCHEMA cll;

CREATE TABLE cll.customers (
  customer_id BIGINT GENERATED ALWAYS AS IDENTITY 
  , first_name VARCHAR(120)
  , last_name VARCHAR(120)
  , address_line_1 VARCHAR(120)
  , address_line_2 VARCHAR(120)
  , post_code VARCHAR(10)
  , city VARCHAR(70)
  , country VARCHAR(70)
  , PRIMARY KEY(customer_id)
);

INSERT INTO cll.customers 
(
  first_name
  , last_name
  , address_line_1
  , address_line_2
  , post_code
  , city
  , country
)
VALUES
('John', 'Rocker', '1 Legend Drive', '', 'W4 58L', 'London', 'United Kingdom')
;

CREATE TABLE cll.orders (
  order_id BIGINT GENERATED ALWAYS AS IDENTITY
  , customer_id BIGINT
  , order_timestamp TIMESTAMP
  , PRIMARY KEY(order_id)
  , CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES cll.customers(customer_id)
);

INSERT INTO cll.orders (
  customer_id
  , order_timestamp
)
VALUES 
(1, CURRENT_TIMESTAMP)
;

CREATE TABLE cll.items (
  item_id BIGINT GENERATED ALWAYS AS IDENTITY
  , item_name VARCHAR(120)
  , PRIMARY KEY(item_id)
)
;

INSERT INTO cll.items (
  item_name
)
VALUES 
('Cambridge Audio CXA81')
;

CREATE TABLE cll.order_items (
  order_id BIGINT
  , item_id BIGINT
  , quantity BIGINT
  , CONSTRAINT fk_order FOREIGN KEY (order_id) REFERENCES cll.orders(order_id)
  , CONSTRAINT fk_item FOREIGN KEY (item_id) REFERENCES cll.items(item_id)
);

INSERT INTO cll.order_items (
  order_id
  , item_id
  , quantity
)
VALUES
(1, 1, 1)
;

CREATE VIEW cll.orders_extended AS
SELECT
  o.*
  , CONCAT(c.first_name, ' ', c.last_name) AS customer_full_name
  , c.address_line_1
  , c.address_line_2
  , c.post_code
  , c.city
  , c.country
FROM cll.orders o
LEFT JOIN cll.customers c
  ON o.customer_id = c.customer_id
;