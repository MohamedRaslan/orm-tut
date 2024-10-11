-- Check how to test some of the table structure
-- If classicmodels database is not created, create it using the below commands using mysql cli
-- SOURCE /usr/samples/sakila-db/classicmodels-db.sql;


-- Checklist
    -- Check table presence in database schema
    -- Check table name convetions
    -- Check number of columns in "customers" table
    -- Check column names in "customers" table 
    -- Check data type of columns "customers" table
    -- Check size of columns "customers" table
    -- Check nulls in "customers" table
    -- Check column keys in "customers" table
show databases;

use information_schema;
show tables;

USE classicmodels;
show tables;


describe information_schema.columns;
SELECT * FROM information_schema.columns WHERE table_name="customers"



-- Testing


-- Check table presence in database schema
-- Check table name convetions
USE classicmodels;
SHOW tables;

-- Check number of columns in "customers" table
SELECT count(*) AS NumberOfColumns FROM information_schema.columns WHERE table_name="customers"

-- Check column names in "customers" table
SELECT column_name FROM information_schema.columns WHERE table_name="customers"

-- Check data type of columns "customers" table
SELECT column_name, data_type FROM information_schema.columns WHERE table_name="customers"

-- Check size of columns "customers" table
SELECT column_name, column_type FROM information_schema.columns WHERE table_name="customers"


-- Check nulls in "customers" table
SELECT column_name, is_nullable FROM information_schema.columns WHERE table_name="customers"

-- Check column keys in "customers" table
SELECT column_name, column_key FROM information_schema.columns WHERE table_name="customers"
