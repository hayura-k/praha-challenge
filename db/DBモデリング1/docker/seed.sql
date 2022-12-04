CREATE DATABASE IF NOT EXISTS sample_db;
USE sample_db;

-- テーブル作成部分
CREATE TABLE IF NOT EXISTS customers
(
  id int NOT NULL AUTO_INCREMENT,
  name varchar(255),
  is_paid boolean,
  phone_number varchar(15),
  PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS food_prices
(
  id int NOT NULL AUTO_INCREMENT,
  price int,
  PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS set_food_categories
(
  id int NOT NULL AUTO_INCREMENT,
  name varchar(255),
  PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS foods
(
  id int NOT NULL AUTO_INCREMENT,
  price_id int,
  name varchar(255),
  PRIMARY KEY (id),
  foreign key fk_price_id (price_id) references food_prices(id)
);

CREATE TABLE IF NOT EXISTS set_foods
(
  id int NOT NULL AUTO_INCREMENT,
  set_food_category_id int,
  name varchar(255),
  price int,
  PRIMARY KEY (id),
  foreign key fk_set_food_category_id (set_food_category_id) references set_food_categories(id)
);

CREATE TABLE IF NOT EXISTS orders
(
  id int NOT NULL AUTO_INCREMENT,
  customer_id int,
  total_price int,
  total_amount int,
  PRIMARY KEY (id),
  foreign key fk_customer_id (customer_id) references customers(id)
);

CREATE TABLE IF NOT EXISTS order_details
(
  id int NOT NULL AUTO_INCREMENT,
  order_id int,
  food_id int,
  set_food_id int,
  has_wasabi boolean,
  quantity int,
  PRIMARY KEY (id),
  foreign key fk_order_id (order_id) references orders(id),
  foreign key fk_food_id (food_id) references foods(id),
  foreign key fk_set_food_id (set_food_id) references set_foods(id)
);
