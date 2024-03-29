--A marketing team member asks you about the different prices that have been paid.
--Write a SQL query to get the different prices!

SELECT DISTINCT amount
from payment
ORDER BY amount DESC
--------------------
SELECT
COUNT
DISTINCT (first_name)
FROM
actor
o/p - 128 
---------------------------
Create a list of all the distinct districts
customers are from.

SELECT DISTINCT
district
FROM
address

-----------------------------------------
What is the latest rental date ?

SELECT
rental_date
FROM
rental
ORDER BY
rental_date DESC
LIMIT
1
--------------------------------------------
How many films does the company have?
SELECT
COUNT
FROM
film
-------------------
How many distinct last names of the
customers are there?

SELECT
COUNT(DISTINCT
last_name)
FROM
customer
--------------------
You need to help the Marketing team to work more easily.
The Marketing Manager asks you to order the customer list
by the last name
The want to start from "Z" and work towards "A".
Write a SQL query to get that list!
-------------------------------
EXERCISE SOL
SELECT
*
FROM
payment
WHERE
amount != 10.99

SELECT
*
FROM
payment
WHERE
amount <> 10.99
------------------------------------
How many payment were made by the customer
with customer_id = 100?
Write a SQL query to get the answers
Result
What is the last name of our customer with
first name 'ERICA'?

SELECT
COUNT(*) FROM payment
where customer_id = 100 ;

select 
first_name,last_name 
from customer
WHERE first_name ='ERICA';

--------------------------------------------
--The inventory manager asks you how many rentals have not been returned yet (return_date is null).
Write a SQL query to get the answers!
Result

select count(*) from rental
where return_date is null


--The sales manager asks you for a list of all the payment_ids with an amount less than or equal to $2.Include payment_id and the amount.


select payment_id ,amount
from payment
where amount <= 2
order by amount desc

------------------------------------------------
--The support manager asks you about a list of all the payment of the customer 322, 346 and 354 where the amount is either less than $2 or greater than $10.
It should be ordered by the customer first (ascending) and then
as second condition order by amount in a descending order.


sol 1 
select * from payment
where (customer_id = 322 or customer_id = 346 OR customer_id = 354)
AND 
(amount < 2 OR amount > 10)
ORDER BY customer_id ASC,amount DESC


sol2

select * from payment
where customer_id IN (322,346,354)
AND ( amount < 2 OR amount > 10 )
ORDER BY customer_id ASC,amount DESC
-----------------------------
There have been 6 complaints of customers about their
payments.
Write a SQL query to get a list of the concerned payments!
Result
It should be 7 payments!
customer_id: 12,25,67,93,124,234
The concerned payments are all the payments of these
customers with amounts 4.99, 7.99 and 9.99 in January 2020.

SELECT * FROM PAYMENT
WHERE customer_id IN (12,25,67,93,124,234)
AND amount IN (4.99,7.99,9.99)
AND payment_date between '2020-01-01' and '2020-02-01'
ORDER BY amount DESC
-------------------------
There have been some faulty payments and you need to help to
found out how many payments have been affected.
How many payments have been made on
January 26th and 27th
2020 ( including entire 27th ) with an amount between 1.99 and 3.99 ?
------------------------

--You need to help the inventory manager to find out:
--How many movies are there that contain the "Documentary" in
---the description?

SELECT count(*) from film
where description like '%Documentary%'

---------------------------------
-----How many customers are there with a first name that is
--3 letters long and either an 'X' or a 'Y' as the last letter
--in the last name?



select * from customer
where first_name  LIKE '___'
AND last_name LIKE '%X'
OR
last_name LIKE '%Y'

------------------------------------------------------------------------

Create a list of all customers where the first name
contains 'ER' and has an 'A' as the second letter.
Order the results by the last name descendingly.

SELECT
*
FROM
customer
WHERE
first_name LIKE '%
AND
first_name LIKE '_
ORDER BY
last_name DESC
----------------------------------------------
How many payments are there where the amount
is either 0 or between 3.99 and 7.99 and in the
same time have happened on 2020 05 01.

SELECT
COUNT
FROM
payment
WHERE
(amount 0
OR
amount BETWEEN 3.99 AND 7.99
AND
payment_date BETWEEN '2020 05 01' AND '2020 05 02'
--------------------------------------------------------------------
----Your manager wants to which of the two employees (staff_id)
--is responsible for more payments?
--Which of the two is responsible for a higher overall payment
--amount?
--How do these amounts change if we don't consider amounts
--equal to 0?

SELECT staff_id,SUM(amount),count(*)
from payment
GROUP BY staff_id



SELECT staff_id,SUM(amount),count(*)
from payment
WHERE amount != 0
GROUP BY staff_id
--------------------------------------------------------------------
There are two competitions between the two employees.
Which employee had the highest sales amount in a single day?
Which employee had the most sales in a single day (not
counting payments with amount = 0?

---------------------

Your manager wants to get a better understanding of the
films.
That's why you are asked to write a query to see the
•Minimum
•Maximum
•Average (rounded)
•Sum of the replacement cost of the films.
---------------------------------------------------------------------------------
In 2020, April 28, 29 and 30 were days with very high revenue.
That's why we want to focus in this task only on these days
(filter
Find out what is the
average payment amount grouped by
customer and day consider only the days/customers with
more than 1 payment (per customer and day).
Order by the average amount in a descending order.
-------------------------------------
Pending DAY 4
----------------------------------
Task: Write a query that gives an overview of how many films have replacements costs in the following cost ranges

low: 9.99 - 19.99

medium: 20.00 - 24.99

high: 25.00 - 29.99

Question: How many films have a replacement cost in the "low" group?


SELECT 
CASE 
WHEN replacement_cost BETWEEN 9.99 AND 19.99
THEN 'low'
WHEN replacement_cost BETWEEN 20 AND 24.99
THEN 'medium'
ELSE 'high'
END as cost_range,
COUNT(*)
FROM film
GROUP BY cost_range
------------------------------------------------------------------------------------------------------------------
Task: Create a list of the film titles including their title, length, and category name ordered descendingly by length. Filter the results to only the movies in the category 'Drama' or 'Sports'.

Question: In which category is the longest film and how long is it?

Answer: Sports and 184
--------------------------------------

