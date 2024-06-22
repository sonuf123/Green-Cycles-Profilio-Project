# **BASIC filtering**

`-- COMMENT AND ALIAS`

`-- AND `

` /* 
  */`

 `Challenge 1 WHERE OPERATORS`

***How many payment were made by the customer with customer_id = 100? Write a SQL query to get the answers Result
What is the last name of our customer withfirst name 'ERICA'? ***

```sql
SELECT
COUNT(*) FROM payment
where customer_id = 100 ;

```
```sql
select 
first_name,last_name 
from customer
WHERE first_name ='ERICA';
```


------------------------------------------------------------------------
`Challenge 2 WHERE OPERATORS`
**The inventory manager asks you how many rentals have not been returned yet (return_date is null).Write a SQL query to get the answers! **

`Result`


```sql

select count(*) from rental
where return_date is null
```


**The sales manager asks you for a list of all the payment_ids with an amount less than or equal to $2.Include payment_id and the amount.**


```sql
select payment_id ,amount
from payment
where amount <= 2
order by amount desc
```
---------------------------------------------------------------
`challenge 3  WITH AND/OR`
**The support manager asks you about a list of all the payment of the customer 322, 346 and 354 where the amount is either less than $2 or greater than $10.
It should be ordered by the customer first (ascending) and then
as second condition order by amount in a descending order.**

sol 1 
```sql
select * from payment
where (customer_id = 322 or customer_id = 346 OR customer_id = 354)
AND 
(amount < 2 OR amount > 10)
ORDER BY customer_id ASC,amount DESC
```


sol2

```sql
select * from payment
where customer_id IN (322,346,354)
AND ( amount < 2 OR amount > 10 )
ORDER BY customer_id ASC,amount DESC
```



-----------------------------------------------------------------------
`Challenge 4`

**There have been some faulty payments and you need to help to find out how many payments have been affected ?
How many payments have been made on
January 26th and 27th
2020 ( including entire 27th ) with an amount between 1.99 and 3.99 ?**


```sql
select count(*) from payment
where amount between  1.99 AND 3.99
AND payment_date  between '2020-01-26'  AND '2020-01-28'
```
----------------------------------------------
`CHALLENGE 5`

**There have been 6 complaints of customers about their payments.Write a SQL query to get a list of the concerned payments! Result**
--It should be 7 payments!
customer_id: 12,25,67,93,124,234
The concerned payments are all the payments of these
customers with amounts 4.99, 7.99 and 9.99 in January 2020.



```sql
SELECT * FROM PAYMENT
WHERE customer_id IN (12,25,67,93,124,234)
AND amount IN (4.99,7.99,9.99)
AND payment_date between '2020-01-01' and '2020-02-01'
ORDER BY amount DESC

```
------------------------------------------
`Challenge 6 LIKE`

**How many customers are there with a first name that is 3 letters long and either an 'X' or a 'Y' as the last letter in the last name?**



```sql
select * from customer
where first_name  LIKE '___'
AND last_name LIKE '%X'
OR
last_name LIKE '%Y'
```





------------------------------------------

`Challenge 7 `
 **How many movies are there that contain 'Saga'
in the description and where the title starts either
with 'A' or ends with 'R'?
Use the alias 'no_of_movies'.**

```sql
SELECT
COUNT (*) AS number_of_movie
FROM film
WHERE description LIKE '%Saga%'
AND ( title LIKE 'A%'
OR title LIKE '%R' )
```

-----------------------------------------------------------------------
`challenge 8`
 
 **2. Create a list of all customers where the first name contains
'ER' and has an 'A' as the second letter.
Order the results by the last name descendingly.**

```sql
SELECT *
FROM customer
WHERE first_name LIKE  '%ER% ' AND 
First_name LIKE '_A%'
ORDER BY last_name DESC

```
------------------------------------------------------------
`challenge 9`
**3. How many payments are there where the amount is either 0
or is between 3.99 and 7.99 and in the same time has
happened on 2020-05-01.**

```sql
SELECT
COUNT (*)
FROM payment
WHERE (amount = 0
OR amount BETWEEN 3.99 AND 7.99)
AND payment_date BETWEEN '2020-05-01' AND '2020-05-02'
```
