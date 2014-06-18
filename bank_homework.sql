-- In case there is already a bank_homework database, drop it
DROP DATABASE IF EXISTS bank_homework;

-- Create a bank_homework database
CREATE DATABASE bank_homework;

-- Connect to the bank_homework databases
\c bank_homework

-- Create a payments table
--  The table should have columns of id, created_at, amount, payer_name,
--  recipient_name, and description with the appropriate datatypes
CREATE TABLE payments (
  id SERIAL PRIMARY KEY,
  created_at TIMESTAMP,
  amount NUMERIC,
  payer_name TEXT,
  recipient_name TEXT,
  description TEXT
);

-- Alter the payments table, add the column of `zipcode`
-- to specify where the transaction was made
ALTER TABLE payments ADD zipcode TEXT;


-- Insert 20 rows into the payments table
-- The first of these payments should be deposits
-- try to keep the accounts positive and have at least three different payers.
INSERT INTO payments (created_at, amount, payer_name, recipient_name, description, zipcode) VALUES
  ('2014-05-18 08:00:00', 1.00, 'Devin', 'Wells Fargo', 'deposit', '02093'),
  ('2014-05-18 08:10:00', 2000.00, 'Devin', 'Wells Fargo', 'deposit', '02093'),
  ('2014-06-18 08:20:00', 3000.00, 'Devin', 'Wells Fargo', 'deposit', '02093'),
  ('2014-06-18 08:30:00', 4000.00, 'Devin', 'Wells Fargo', 'deposit', '02093'),
  ('2014-06-18 08:40:00', 5000.00, 'Devin', 'Wells Fargo', 'deposit', '02093'),
  ('2014-06-18 09:00:00', 1000.00, 'David', 'Chase', 'deposit', '02093'),
  ('2014-06-18 09:10:00', 2000.00, 'David', 'Chase', 'deposit', '02093'),
  ('2014-06-18 09:20:00', 3000.00, 'David', 'Chase', 'deposit', '02093'),
  ('2014-06-18 09:30:00', 4000.00, 'David', 'Chase', 'deposit', '02093'),
  ('2014-06-18 09:40:00', 5000.00, 'David', 'Chase', 'deposit', '02093'),
  ('2014-06-18 10:00:00', 1000.00, 'Bill', 'Wells Fargo', 'deposit', '02093'),
  ('2014-06-18 10:10:00', 2000.00, 'Bill', 'Wells Fargo', 'deposit', '02093'),
  ('2014-06-18 10:20:00', 3000.00, 'Bill', 'Wells Fargo', 'deposit', '02093'),
  ('2014-06-18 10:30:00', 4000.00, 'Bill', 'Wells Fargo', 'deposit', '02093'),
  ('2014-06-18 10:40:00', 5000.00, 'Bill', 'Wells Fargo', 'deposit', '02093'),
  ('2014-06-18 11:00:00', 1000.00, 'Chase', 'Devin', 'deposit', '02093'),
  ('2014-06-18 11:10:00', 2000.00, 'Chase', 'Devin', 'deposit', '02093'),
  ('2014-06-18 11:20:00', 3000.00, 'Chase', 'Devin', 'deposit', '02093'),
  ('2014-06-18 11:30:00', 4000.00, 'Chase', 'Devin', null, '94117'),
  ('2014-06-18 11:40:00', 5000.00, 'Chase', 'Devin', null, '94117');

-- You receive notice that the payment with id of 9 is $10 too low.
-- Alter that row so that it is corrected
UPDATE payments SET amount = amount + 10 WHERE id = 9;

-- Delete all payments with an amount under $2
DELETE FROM payments WHERE amount < 2;

-- Select all entries from the payments table
SELECT * FROM payments;

-- In a single query, output all payments ordered from the largest to the smallest
SELECT * FROM payments ORDER BY amount DESC;

-- In a single query, output the names of all distinct recipients
SELECT DISTINCT(recipient_name) FROM payments;

-- In a single query, select all payments created in the past week (may need to look up date function or two)
SELECT * FROM payments WHERE created_at > (CURRENT_TIMESTAMP - interval '7 days');

-- In a single query, select all payments with a blank description
SELECT * FROM payments WHERE description is null;

-- In a single query, select all payments matching the name of one of the payers (choose any single one)
SELECT * FROM payments WHERE payer_name = 'Devin';
