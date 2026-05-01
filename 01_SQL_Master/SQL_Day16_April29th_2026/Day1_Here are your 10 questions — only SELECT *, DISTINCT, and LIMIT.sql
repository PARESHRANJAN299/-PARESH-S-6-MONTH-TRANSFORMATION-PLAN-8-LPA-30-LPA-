use unilever_db
SELECT * — 3 questions
Q1. See everything in the customers table.
select * from customers;
Q2. See everything in the customers table but only first 3 rows.
select * from customers
limit 3;
Q3. See everything in the customers table but only first 1 row.
select * from customers limit 1
DISTINCT — 4 questions
Q4. Show all unique city values from customers.
select distinct city from customers;
Q5. Show all unique segment values from customers.
select distinct segment from customers;
Q6. Show all unique region values from customers.
select distinct region from customers;
Q7. Show all unique city and region together from customers.
select distinct city, region from customers;

LIMIT — 3 questions
Q8. Show only first 7 rows from customers.
select * from customers limit 7;
Q9. Show only first 2 rows from customers.
select * from customers limit 2;
Q10. Show only customer_name and city — but first 4 rows only.
select customer_name, city from customers limit 4
