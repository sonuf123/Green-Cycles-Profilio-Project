INTERMIDIATE FUNCTIONS


In the email system there was a problem with names where
either the first name or the last name is more than 10 characters
long.
Find these customers and output the list of these first and last
names in all lower case.


SELECT
LOWER (first_name),
LOWER (last_name),
LOWER (email)
FROM customer
WHERE LENGTH(first_name) > 10
OR LENGTH(last_name) > 10
FROM customer
------------------------------------------------------------------------------
Extract the last 5 characters of the email address first.
The email address always ends with '.org'.
How can you extract just the dot '.' from the email address?

SELECT
email,
LEFT(RIGHT(email,4),1)
FROM customer
----
You need to create an anonymized form of the email addresses
in the following way:
m**.s**@saikiran.org

In a second query create an anonymized form of the email
addresses in the following way:
Write
***y.s***@saikiran.org


SELECT
LEFT(email, 1) | | '***' | |RIGHT (email, 19) AS anonymized_email
FROM customer
----------------------------

In this challenge you have only the email address and the last
name of the customers.
You need to extract the first name from the email address and
concatenate it with the last name. It should be in the form:
"Last name, First name".

SELECT
last_name || ', ' || LEFT (email, POSITION('.' IN email)-1),
last_name
FROM customer
--------------------

You need to create an anonymized form of the email addresses
in the following way:




SELECT

LEFT(email,1) || ' *** ' ||SUBSTRING (email from POSITION('.' in email) for 2)
||'***'||SUBSTRING (email from POSITION('@' in email))
FROM customer

SELECT
'***'
||SUBSTRING(email from POSITION('.' in email)-1 for 3)
||'***'
SUBSTRING(email from POSITION('@' in email))
FROM customer
--------------------------------------------------------------
You need to analyze the payments and find out the following:

/*What's the month with the highest total payment amount?

What's the day of week with the highest total payment amount?
(0 is

What's the highest amount one customer has spent in a week?*/

SELECT
customer_id,
EXTRACT (week from payment_date) as week,
SUM(amount) as total_payment_amount
FROM payment
GROUP BY week, customer_id
ORDER BY total_payment_amount DESC
------------------------------------
/*You need to sum payments and group in the following formats:

1.day   Fri, 24/01/2020

2 746.62 May, 2020

3 Thu, 02:44   */

SELECT
SUM (amount) as total_payment,
TO_CHAR (payment_date, 'Mon) YYYY') as mon_year
FROM payment
GROUP BY mon_year
ORDER BY total_payment ASC

SELECT
SUM(amount) as total_payment,
TO_CHAR (payment_date, 'Dy, HH:MI') as Day_time
FROM payment
GROUP BY Day_time
ORDER BY total_payment ASC

SELECT
SUM(amount) as total_payment,
TO_CHAR(payment_date, 'Dy, DD/MM/YYYY') as day
FROM payment
GROUP BY day
-------------------
--TIME INTERVAL
You need to create a list for the support team of all rental
durations of customer with customer_id 35.

Also you need to find out for the support team
which customer has the longest average rental duration?

SELECT
customer_id,
AVG(return_date-rental_date) as rental_duration
FROM rental
GROUP BY customer_id
ORDER BY rental_duration DESC





