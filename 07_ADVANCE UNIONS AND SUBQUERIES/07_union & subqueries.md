## union & subqueries


**Select all of the films where the length is longer than the average of all films.
Return all the films that are available in the inventory in store 2 more than 3
times.**

```sql
SELECT * FROM film
WHERE length > (SELECT AVG(length) FROM film)
```

----------------------------
```sql
SELECT * FROM film
WHERE film_id IN
(SELECT film_id FROM inventory
WHERE store_id=2
GROUP BY film_id
HAVING COUNT(*) >3)
```
------------------------------------------------------------------------------------------

**Return all customers' first names and last names that have made a payment
on '2020-01-25'.**

**Return all the customers' first and last names that are from California and
have spent more than 100 in total.**


```sql
SELECT first_name, last_name
FROM customer
WHERE customer_id IN (SELECT customer_id
FROM payment
WHERE DATE (payment_date)='2020-01-25' )
```

------------------------------------------
```sql
SELECT first_name, last_name
FROM customer
WHERE customer_id IN (SELECT customer_id
FROM payment
GROUP BY customer_id
HAVING SUM(amount)>30)
```

-------------------------
**Q2 -**

```sql
SELECT first_name, last_name
FROM customer
WHERE customer_id IN (SELECT customer_id
FROM payment
GROUP BY customer_id
HAVING SUM(amount) >100)
AND customer_id IN (SELECT customer_id
FROM customer
INNER JOIN address
ON address.address_id = customer.address_id
where district = 'california' )
```
------------------------------------------------------------------------------------
**What is the average total amount spent per day (average daily revenue)?**

```sql
SELECT
ROUND(AVG (amount_per_day),2) AS daily_rev_avg
FROM
(SELECT
SUM (amount) as amount_per_day,
DATE (payment_date)
FROM payment
GROUP BY DATE (payment_date)) A
```


------------------------------------

**Show all the payments together with how much the payment amount is below
the maximum payment amount.**

```sql
select *,
(MAX(amount) from payment from payment ) - amount  as difference 
```

----------------------------
**Show only those movie titles, their associated film_id and replacement_cost
with the lowest replacement_costs for in each rating category - also show the
rating.**

```sql
SELECT title, film_id, replacement_cost, rating
FROM film f1
WHERE replacement_cost =
(SELECT MIN(replacement_cost) FROM film f2I
WHERE f1.rating=f2.rating)
```


-------------------------
```sql
SELECT title, film_id, replacement_cost, rating  ----length not there
FROM film f1
WHERE length =
(SELECT MAX (length) from film fe
WHERE f1.rating=f2.rating)
```
-------------
```sql
SELECT title, film_id,length, replacement_cost, rating  ----length 
FROM film f1
WHERE length =
(SELECT MAX (length) from film f2
WHERE f1.rating=f2.rating)
```
--------------------------------
**Show all the payments plus the total amount for every customer as well as the
number of payments of each customer.**


SOL1

```sql
SELECT
payment_id,
customer_id,
staff_id,amount,
(SELECT SUM(amount) as sum_amount
FROM payment p2
where p1.customer_id =p2.customer_id),
(select count(amount) as count_payments
from payment p2
where p1.customer_id =p2.customer_id)
from payment p1
ORDER BY customer_id,amount DESC
```
------------------------------------
**Show only those films with the highest replacement costs in their rating
category plus show the average replacement cost in their rating category.
Result**

```sql
SELECT title, replacement_cost, rating,
(SELECT AVG(rep lacement_cost) 
FROM film f2
WHERE f1.rating=f2.rating)
from film f1
WHERE replacement_cost = (SELECT MAX(replacement_cost) FROM film f3
WHERE f1.rating=f3.rating)

```

-----------------------------------------------------------------------------
**Show only those payments with the highest payment for each customer's first
name including the payment_id of that payment.
How would you solve it if you would not need to see the payment_id?
Result**

--
--corellated subquery mit join
--show payments for each cust inc.


```sql
SELECT first_name,MAX( amount), payment_id
FROM payment p1
INNER JOIN customer c
ON p1. customer_id=c.customer_id
WHERE amount = (SELECT MAX(amount) FROM payment p2
WHERE p1.customer_id=p2.customer_id)
GROUP BY first_name
```



-----------------




















