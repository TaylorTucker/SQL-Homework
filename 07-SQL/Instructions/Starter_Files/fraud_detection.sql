DROP TABLE IF EXISTS card_holder CASCADE;
DROP TABLE IF EXISTS credit_card CASCADE;
DROP TABLE IF EXISTS merchant_categories CASCADE;
DROP TABLE IF EXISTS merchant CASCADE;
DROP TABLE IF EXISTS transactions CASCADE;
--Create first table
CREATE TABLE card_holder(
	id INT,
	name VARCHAR(50),
	PRIMARY KEY(id)
);
--Create second table
CREATE TABLE credit_card(
	card VARCHAR(20),
	id INTEGER NOT NULL,
	PRIMARY KEY(card),
	FOREIGN KEY (id) REFERENCES card_holder(id)
);
--create third table
CREATE TABLE merchant_categories(
	id INT,
	name CHAR(100),
	PRIMARY KEY (id)
);
--create fourth table
CREATE TABLE merchant(
	id INT,
	name CHAR(100),
	id_merchant_category INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (id_merchant_category) REFERENCES merchant_categories(id)
);
--create last table to sum them all together
CREATE TABLE transactions(
	tranid INT,
	date TIMESTAMP,
	amount FLOAT,
	card VARCHAR(20),
	id_merchant INT,
	PRIMARY KEY (tranid),
	FOREIGN KEY (id_merchant) REFERENCES merchant(id),
	FOREIGN KEY (card) REFERENCES credit_card(card)
);