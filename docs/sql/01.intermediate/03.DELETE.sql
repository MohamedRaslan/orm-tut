-- delete all rows from the t1
USE testdb;

DELETE FROM t1;
-- Edit > Preferences > Sql editor , disable the safe updates
DELETE * FROM t1;
-- delete rows from t1 where id = 1
DELETE FROM t1 WHERE id = 1;

-- delete rows from t1 using LIMIT
DELETE FROM t1 LIMIT 1;

-- you can also use the TRUNCATE statement, its the same without condation and rest the table
-- The TRUNCATE Command deletes all the rows from the existing table, leaving the row with the column names.

TRUNCATE TABLE t2;

-- Drop table
-- The DROP Command drops the complete table from the database.

DROP TABLE t2