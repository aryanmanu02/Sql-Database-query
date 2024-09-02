--Simple queries:

select * from sales;
select * from product;
select * from goldusers_signup;
select * from users;
select * from salesforgold;

--add
alter table users
add mobileno int

--Update
alter table users
alter column mobileno numeric(10,0)

--drop
alter table users
drop column mobileno


SELECT * FROM product
WHERE price=300;

SELECT * FROM product
ORDER BY Price;

SELECT * FROM product
WHERE price > 300;

--Date function
SELECT * 
FROM goldusers_signup
WHERE YEAR(gold_signup_date) = 2017;

--Advance queries:
SELECT TOP 2 * FROM goldusers_signup

--String Function:
SELECT CONCAT(product_id, product_name) FROM product;


--Aggregate function

--Count
SELECT COUNT(price) as enteriesno
FROM Product;

--Sum
SELECT SUM(price) as Totalprice
FROM product;

--avg
SELECT AVG(price) as Totalprice
FROM product;

--MIN

SELECT * 
FROM product
WHERE price = (SELECT MIN(price) FROM product);

--MAX

SELECT * 
FROM product
WHERE price = (SELECT MAX(price) FROM product);

--Queries based on join & sub queries:

SELECT sales.userid, sales.product_id, product.product_name, product.price
FROM sales
JOIN product ON sales.product_id = product.product_id;

SELECT goldusers_signup.username, salesforgold.product_id, product.product_name
FROM salesforgold
JOIN goldusers_signup ON salesforgold.usergoldId = goldusers_signup.usergoldId
JOIN product ON salesforgold.product_id = product.product_id;

SELECT product.product_name
FROM product
WHERE product_id IN (SELECT product_id FROM salesforgold WHERE usergoldId = (SELECT usergoldId FROM goldusers_signup WHERE username = 'Aryan'));

SELECT goldusers_signup.username, (
  SELECT COUNT(*)
  FROM salesforgold
  WHERE usergoldId = goldusers_signup.usergoldId
) AS total_purchases
FROM goldusers_signup;

SELECT users.uname, product.product_name
FROM users
INNER JOIN sales ON users.userid = sales.userid
INNER JOIN product ON sales.product_id = product.product_id;