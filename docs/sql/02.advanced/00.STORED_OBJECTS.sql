-- stored procedure
-- functions
-- triggers
-- views

-- functions
--

-- create function

-- CREATE FUNCTION func_name (param1 type, param2 type, ...) RETURNS type
-- BEGIN
--     -- statements
-- END;
use sakila
DELIMITER $$
-- A function to calculate age
CREATE FUNCTION fnAge(p_birth_date DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_age INT;
    SET v_age = YEAR(CURDATE()) - YEAR(p_birth_date);
    RETURN v_age;
END$$
DELIMITER ;
SELECT fnAge('1990-01-01');

-- A function to calculate the area of a circle
DELIMITER $$
CREATE FUNCTION fnArea(p_radius DECIMAL(5,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE v_area DECIMAL(10,2);
    SET v_area = PI() * p_radius * p_radius;
    RETURN v_area;
END $$
DELIMITER ;

SELECT fnArea(5);


DELIMITER $$
-- we can also execute routines against existing objects
CREATE FUNCTION fn1(param_id INT) RETURNS CHAR(20)
DETERMINISTIC
BEGIN
    DECLARE fn CHAR(20);
    SET fn = (SELECT first_name FROM t1 WHERE id = param_id);
    RETURN fn;
END $$
DELIMITER ;
-- call function
SELECT fn1(3);


--
-- stored procedures
--
DROP DATABASE IF EXISTS testdb;
CREATE DATABASE IF NOT EXISTS testdb;

USE testdb;

CREATE TABLE t1 (
    id INT, 
    first_name VARCHAR(20)
    );

DESC t1;

INSERT INTO t1 VALUES (1, 'ahmed'), (2, 'aya'), (3, 'john');

SELECT * FROM t1;
DELIMITER $$
-- create stored procedure
CREATE PROCEDURE sp1()
BEGIN
    SELECT * FROM t1;
END $$
DELIMITER ;
-- call stored procedure
CALL sp1();

DELIMITER $$
-- create stored procedure with parameters
CREATE PROCEDURE sp2(IN param_id INT)
BEGIN
    SELECT * FROM t1 WHERE id = param_id;
END $$
DELIMITER ;
-- call stored procedure
CALL sp2(2);

DELIMITER $$
-- create stored procedure with parameters and return value
CREATE PROCEDURE sp3(IN param_id INT, OUT param_first_name VARCHAR(20), out param_out_id INT)
BEGIN
    SELECT first_name INTO param_first_name -- assign value to param_first_name
    FROM t1 WHERE id = param_id;
    
	SELECT id INTO param_out_id 
	FROM t1 WHERE id = param_id;
    END $$
DELIMITER ;

-- call stored procedure
CALL sp3(2, @first_name, @px_id );
SELECT @first_name ,@px_id;


-- views
-- in 01.SELECT.sql

-- triggers
-- https://www.mysqltutorial.org/mysql-triggers/ 


CREATE DATABASE IF NOT EXISTS salariesdb;

USE salariesdb;

-- drop table salary;

CREATE TABLE salary (
    id INT KEY,
    name VARCHAR(20),
    age INT,
    balance INT,
    balance_lastupdate DATETIME
);

INSERT INTO salary (id, name, age, balance) VALUES 
    (1, "Mohamed Hassan", 35, 4500),
    (2, "Khaled Ahmed", 26, 2800),
    (3, "Amr Hamed", 31, 3560),
    (4, "Ahmed Emad", 22, 2500);

SELECT * from salary;



-- Create a trigger

CREATE TRIGGER trLastBalanceUpdate BEFORE
UPDATE ON employees FOR EACH ROW
SET
    NEW.balance_lastupdate = NOW();

-- check the trigger

select
    trigger_schema,
    trigger_name,
    action_statement
from information_schema.triggers
WHERE
    trigger_schema = "salariesdb"
    AND event_object_table = "employees";

-- or 

SHOW TRIGGERS IN salariesdb WHERE `Table` = 'employees';

-- Triger the trigger 
UPDATE employees set balance = 500 WHERE id = 1;
SELECT * from employees;

UPDATE employees set age = 20 WHERE id = 2;
SELECT * from employees;


-- Better Trigger
DROP Trigger IF EXISTS salariesdb.trLastBalanceUpdate;

DELIMITER ;;
CREATE Trigger trLastBalanceUpdate BEFORE
UPDATE ON employees FOR EACH ROW
BEGIN
    IF NEW.balance <> OLD.balance THEN
        SET NEW.balance_lastupdate = NOW();
    END IF;
END ;;
DELIMITER ;


-- check the trigger
SHOW TRIGGERS IN salariesdb WHERE `Table` = 'employees';

UPDATE employees set balance = 1200 WHERE id = 1;
SELECT * from employees;

UPDATE employees set age = 20 WHERE id = 2;
SELECT * from employees;