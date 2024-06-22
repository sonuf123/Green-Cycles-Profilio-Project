# JOINS 

`Challenge 1 INNER JOIN `

**The airline company wants to understand in which category they sell most tickets.
How many people choose seats in the category
-Business
-Economy or
-Comfort?
You need to work on the seats table and the boarding_passes table.**

```sql
select fare_conditions,
count(*)
FROM boarding_passes b
   INNER JOIN seats s
ON s.seat_no = b.seat_no
GROUP BY fare_conditions
```
-----------------------------------------------------------------------------------------

`challenge 2`

**The flight company is trying to find out what their most popular seats are.Try to find out which seat has been chosen most frequently.Make sure all seats are included even if they have never been booked.Are there seats that have never been booked?**


**1.Try to find out which line (A, B, …, H) has been chosen most
frequently.**

```sql
SELECT RIGHT (s.seat_no,1), COUNT(*) FROM seats s
INNER JOIN boarding_passes b
ON s.seat_no = b.seat_no
GROUP BY RIGHT(s.seat_no,1)
ORDER BY COUNT(*) DESC	
```

------

```sql
SELECT fare_conditions, COUNT(*) FROM seats s
INNER JOIN boarding_passes b
ON s.seat_no = b.seat_no
GROUP BY fare_conditions
ORDER BY COUNT(*) DESC
```




------------------------------------------------------------------------------------------------
**The company wants to run a phone call campaing on all customers in
Texas (=district).**

```sql
SELECT * FROM address a
LEFT JOIN customer c
ON c.address_id = a.address_id
WHERE c.customer_id is null
```


```sql
SELECT * FROM address a
LEFT JOIN customer a
ON c.address_id = a.address_id
WHERE district ='Texas'
```
----------------------------------------------------------------------------------------------

**The company wants customize their campaigns to customers depending on
the country they are from.
Which customers are from Brazil?
Write a query to get first_name, last_name, email and the country from all
customers from Brazil.**

```sql
SELECT first_name, last_name, email, co.country
FROM customer cu
LEFT JOIN address ad
ON cu.address_id= ad.address_id
LEFT JOIN city ci
ON ci.city_id=ad.city_id
LEFT JOIN country co
ON co.country_id = ci.country_id
WHERE country='Brazil'
```
----------------------
`Question 1:`

**Which passenger (passenger_name) has spent most amount in their bookings (total_amount)?**

Answer: ALEKSANDR IVANOV with 80964000.

```sql
SELECT passenger_name,SUM(total_amount) FROM tickets t
INNER JOIN bookings b
ON t.book_ref=b.book_ref
GROUP BY passenger_name
ORDER BY SUM(total_amount) DESC
```

---------------------------------------
`Question 2:`

**Which fare_condition has ALEKSANDR IVANOV used the most?**

Answer: Economy 2131 times.

```sql
SELECT passenger_name, fare_conditions, COUNT(*) FROM tickets t
INNER JOIN bookings b
ON t.book_ref=b.book_ref
INNER JOIN ticket_flights tf
ON t.ticket_no=tf.ticket_no
WHERE passenger_name = 'ALEKSANDR IVANOV'
GROUP BY fare_conditions, passenger_name
```

----------------------------------------------------
`Question 3:`

**Which title has GEORGE LINTON rented the most often?**

Answer: CADDYSHACK JEDI - 3 times.



```sql
SELECT first_name, last_name, title, COUNT(*)
FROM customer cu
INNER JOIN rental re
ON cu.customer_id = re.customer_id
INNER JOIN inventory inv
ON inv.inventory_id=re.inventory_id
INNER JOIN film fi
ON fi.film_id = inv.film_id
WHERE first_name='GEORGE' and last_name='LINTON'
GROUP BY title, first_name, last_name
ORDER BY 4 DESC
```
------------------------------------------------------------------------
