Create database Minidatabase

drop table if exists goldusers_signup;

CREATE TABLE goldusers_signup
(usergoldId integer primary key not null,
username varchar(20) unique Not null,
gold_signup_date date); 

INSERT INTO goldusers_signup(usergoldId,username,gold_signup_date) 
 VALUES (1,'Vikas','09-22-2017'),
(2,'Ketan','04-21-2017'),
(3,'Antara','04-21-2017'),
(4,'Aryan','08-22-2018');

drop table if exists users;
CREATE TABLE users
(userid integer Primary key not null ,
uname varchar(20) unique,
signup_date date
);

INSERT INTO users(userid,uname,signup_date) 
 VALUES (1,'Arya','09-02-2014'),
(2,'Shlok','01-15-2015'),
(3,'Adhavy','04-11-2014');


drop table if exists product;
CREATE TABLE product(product_id integer primary key not null,
product_name text not null,
price integer not null); 

INSERT INTO product(product_id,product_name,price) 
 VALUES
(1,'Pav Bhaji',980),
(2,'Misal Pav',870),
(3,'Piyush',300),
(4,'Medu Vada',450),
(5,'Burger Combo',189),
(6,'Pizza',900);

drop table if exists sales;
CREATE TABLE sales(userid integer FOREIGN KEY REFERENCES users(userid),
product_id integer FOREIGN KEY REFERENCES product(product_id)); 

INSERT INTO sales(userid,product_id) 
 VALUES (1,2),
(3,1),
(2,3),
(1,2),
(1,3),
(3,2),
(1,1),
(1,3),
(2,1),
(1,2),
(1,1),
(3,1),
(3,2),
(3,2),
(2,2),
(2,3);

drop table if exists salesforgold;
CREATE TABLE salesforgold(usergoldId integer FOREIGN KEY REFERENCES goldusers_signup(usergoldId),
product_id integer FOREIGN KEY REFERENCES product(product_id)); 
INSERT INTO salesforgold(usergoldId,product_id) 
 VALUES (1,2),
(3,1),
(2,3),
(1,2),
(1,3),
(3,2),
(1,1),
(1,3),
(2,1),
(1,2),
(1,1),
(3,1),
(3,2),
(3,2),
(2,2),
(2,3);
INSERT INTO salesforgold(usergoldId,product_id) 
VALUES (4,2),(4,3),(4,1),(4,5),(4,3);

select * from sales;
select * from product;
select * from goldusers_signup;
select * from users;
select * from salesforgold;

SELECT SUM(price) AS TotalValue
FROM product;