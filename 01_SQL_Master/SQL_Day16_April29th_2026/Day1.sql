show databases

-- Step 1: Create your practice database
CREATE DATABASE unilever_db;

-- Step 2: Switch into it
USE unilever_db;

-- Step 3: Confirm you are in it
SELECT DATABASE();
select database();
select database ();

# Q1. Write a query to see everything in the customers table.
select * from unilever_db
Q2. Write a query to see only the product_name column from the products table.
Q3. Write a query to see only name and salary from the employees table.
Q4. Write a query to see all data from orders table but only first 5 rows.
Q5. Write a query to see all unique region values from the customers table.