-- 1. Get release years.
SELECT DISTINCT release_year FROM film;

-- 2. Get all films with ARMAGEDDON in the title.
SELECT title FROM film
WHERE title LIKE "%ARMAGEDDON";

-- 3. Get all films which title ends with APOLLO.
SELECT title FROM film 
WHERE title LIKE'%APOLLO';

-- 4. Get 10 the longest films.
SELECT title, length FROM film
ORDER BY length DESC
LIMIT 10;

-- 5. How many films include Behind the Scenes content?
SELECT count(film_id) AS number_of_films FROM film
WHERE special_features LIKE "%Behind the Scenes";

-- 6. Drop column picture from staff.
ALTER TABLE staff
DROP COLUMN picture;

-- 7. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
select address_id from customer 
where first_name = 'TAMMY' and last_name = 'SANDERS' 
limit 1;
select *
from staff
where first_name = 'jon';

insert into staff 
values(3, 'Tammy', 'Sanders', 79, 2 , 1, 'Tammy');

-- 8. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for the rental_date column in the rental table. Hint: Check the columns in the table rental and see what information you would need to add there. You can query those pieces of information. For eg., you would notice that you need customer_id information as well. To get that you can use the following query:
select * from rental
order by rental_id desc
limit 1; 

-- 9. Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date for the users that would be deleted. Follow these steps:
select * from customer
where active = 0;

create table deleted_users as
select customer_id, email, create_date from customer
where active = 0;

delete from customer
where active = 0;
