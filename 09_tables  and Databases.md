
`create table director`

```sql
CREATE TABLE director
director_id SERIAL PRIMARY KEY,
director_account_name VARCHAR(20) UNIQUE,
first_name VARCHAR(50),
last_name VARCHAR(50) DEFAULT 'Not specified',
date_of_birth DATE,
address_id INT REFERENCES address(address_id))
```

`select * from director`

**Step 2 **
`ALTER TABLE steps`

1. director_account_name to VARCHAR(30)
2. drop the default on last_name
3. add the constraint not null to last name
4. add the column email of data type VARCHAR(40)
5. rename the director_account_name to account_name
6. rename the table from director to directors
----
```sql
ALTER TABLE director
ALTER COLUMN director_account_name TYPE VARCHAR (30)
ALTER COLUMN last_name DROP DEFAULT ,
ALTER COLUMN last_name SET NOT_NULL  ,
ADD COLUMN email VARCHAR(40),
```

`select * from director`

```sql
ALTER TABLE director
RENAME director_account_name TO account_name
```

`select * from director`

`ALTER TABLE director`

**RENAME to directors**
---------------------------------
**Create a table called
songs with the following columns:
1. During creation add the DEFAULT 'Not defined' to the genre.
2. Add the not null constraint to the
song_name column
3. Add the constraint with default name
to ensure the price is at least 1.99.
4. Add the constraint
date_check to ensure the release date is between today and
01 01 1950.
5. Try to insert a row like this:
6. Modify the constraint to be able to have 0.99 allowed as the lowest possible price.
7. Try again to insert the row.**



```sql
CREATE TABLE songs (
song_id SERIAL PRIMARY KEY,
song _name VARCHAR(30) NOT NULL,
genre VARCHAR(30) DEFAULT 'Not defined',
price numeric(4,2) CHECK(price>=1.99),
release_date DATE CONSTRAINT date_check CHECk(release_date BETWEEN '01-01-1950'  AND 'CURRENT_DATE'))
```

`SELECT * FROM SONGS`

```sql
INSERT INTO songs (song_name, price, release_date)
VALUES( 'SQL song', 0.99,'01-07-2022')
```


`this will give constrain error
modify the constrain `

```sql
ALTER table songs 
DROP constraint songs_price_check;
```


```sql
ALTER TABLE SONGS
ADD constraint check(price>=1.99)
```
