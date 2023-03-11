-- LAB 2.5

USE sakila;

-- Select all the actors with the first name ‘Scarlett’.
SELECT * FROM sakila.actor;
SELECT * FROM sakila.actor WHERE first_name = "SCARLETT";

-- How many films (movies) are available for rent and how many films have been rented?
SELECT * FROM sakila.inventory;
SELECT count(inventory_id) FROM sakila.inventory;

-- What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT * FROM sakila.film;
SELECT max(length), min(length) FROM sakila.film;

-- What's the average movie duration expressed in format (hours, minutes)?
SELECT avg(length)/60 FROM sakila.film;

-- How many distinct (different) actors' last names are there?
SELECT count(distinct(last_name)) FROM actor;

-- Since how many days has the company been operating (check DATEDIFF() function)?
SELECT (DATEDIFF("max(rental_date)", "min(rental_date)")) FROM rental;

-- Show rental info with additional columns month and weekday. Get 20 results.
SELECT * FROM sakila.rental;
SELECT DATE_FORMAT(rental_date,'%M') AS 'month', DATE_FORMAT(rental_date,'%a') AS 'day'FROM rental
LIMIT 20;

-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT * , CASE
WHEN DATE_FORMAT(rental_date,'%a') = 'Sat' then 'weekend'
WHEN DATE_FORMAT(rental_date,'%a') = 'Sun' then 'weekend'
ELSE 'weekday' END as day_type FROM sakila.rental;

-- Get release years.
SELECT release_year from sakila.film;

-- Get all films with ARMAGEDDON in the title.
SELECT * FROM sakila.film WHERE title LIKE '%ARMAGEDDON%';

-- Get all films which title ends with APOLLO.
SELECT * FROM sakila.film WHERE title LIKE '%APOLLO';

-- Get 10 the longest films.
SELECT title from sakila.film ORDER BY length DESC LIMIT 10;

-- How many films include Behind the Scenes content?
SELECT * from sakila.film;
SELECT COUNT(title) FROM sakila.film WHERE special_features LIKE '%Behind the Scenes%';