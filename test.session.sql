-- Table Creation ---------------------------------------
-- @block
CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(255) NOT NULL,
    phone VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(255)
);
-- ------------------------------------------------------


-- Table Insertion --------------------------------------
-- @block
INSERT INTO users (full_name, email, phone)
VALUES
    ("Anass Sadiq", "soso123@gmail.com", "+212606070606"),
    ("Ahmed Lfkkak", "rori159@gmail.com", "+212788675626"),
    ("Hamid Alami", "lfkkak666@gmail.com", "+212666777686"),
    ("Adil Said", "hicha008@gmail.com", "+212688877700");
-- ------------------------------------------------------


-- Table Read -------------------------------------------
-- @block
SELECT * FROM users ORDER BY id ASC LIMIT 1;
-- * for reading all columns
-- id or name (etc) for reading specific column(s)
-- order by to order values asc or desc
-- limit to limit results to your taste
-- ------------------------------------------------------


-- Table Read2 ------------------------------------------
-- @block
SELECT * FROM users WHERE full_name = "Adil Said" AND id > 1 AND email LIKE "h%";
-- where to show just the entered value
-- AND/OR used to have more accuracy in results. It can be used with "where" and also with Math Operators (</>/>=/<=) to filter the results.
-- LIKE used to show the results with specific starting values alongside with "%" mark
-- ------------------------------------------------------


-- Index Creation For Faster Results --------------------
-- @block
CREATE INDEX email_index ON users(email);
-- ------------------------------------------------------


-- Relational Table Creation ----------------------------
-- @block
CREATE TABLE phones (
    id INT AUTO_INCREMENT, -- phone id
    brand VARCHAR(50), -- phone brand
    model VARCHAR(50), -- phone model
    price INT,
    owner_id INT NOT NULL, -- we do that to make a relation between users table id and phones id to relate the owner to his phone
    PRIMARY KEY (id), -- we set the id to be a primary key
    CONSTRAINT FOREIGN KEY (owner_id) REFERENCES users(id) -- we set the owner_id to be a foreign key from users table
);
-- ------------------------------------------------------


-- Relational Table Insertion ---------------------------
-- @block
INSERT INTO phones (owner_id, brand, model, price) -- we set the owner id to call user based on his id in users table
VALUES
    (1, "Samsung", "Galaxy J1", 200),
    (1, "Samsung", "Galaxy S10+", 2000),
    (4, "Iphone", "13 Pro", 8000),
    (4, "Iphone", "X", 3000);
-- ------------------------------------------------------


-- Join Tables ------------------------------------------
-- @block
SELECT * FROM users -- we select all columns in users table
LEFT JOIN phones ON phones.owner_id = users.id; -- we join users table with phones table to get results of owners who have a phone. We used the ON condition to compare users' id with phones' users id, and if they are the same, those will be shown in the table that they have a phone.
-- ------------------------------------------------------


-- Update Tables Content -------------------------------
-- @block
UPDATE users SET email = "MoulatLkhnona123@gmail.com" WHERE id = 4;
-- SET will update the Email Of Users Who Has an id equal to 4
-- ------------------------------------------------------


-- Operational Functions ---------------------------------
-- Count -----------------------------------------------
-- @block
SELECT COUNT(full_name) FROM users WHERE full_name LIKE "A%";
-- The Count Operation will count, in this case, all the users from the table who have a name starting with "A"

-- Sum -------------------------------------------------
-- @block
SELECT SUM(price) FROM phones WHERE price > 200;
-- The Sum Operation will calculate the price sum of all phones over 200

-- Max -------------------------------------------------
-- @block
SELECT MAX(price) FROM phones;
-- The Max Operation will show the biggest price

-- Min -------------------------------------------------
-- @block
SELECT MIN(price) FROM phones;
-- The Min Operation will show the lowest price

-- Group By --------------------------------------------
-- @block
SELECT owner_id, SUM(price)
FROM phones
GROUP BY owner_id;
-- The Group By Operation will calculate the sum of each owner's phones and give the results for each one
-- ------------------------------------------------------
