-- LAB 2.6
Use sakila;
-- 1.In the table actor, which are the actors whose last names are not repeated? For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. These three actors have the same last name. So we do not want to include this last name in our output. Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.
-- Which last names appear more than once? We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last name was present more than once
SELECT * FROM sakila.actor;
SELECT last_name FROM sakila.actor GROUP BY last_name HAVING COUNT(last_name)=1;
SELECT last_name FROM sakila.actor GROUP BY last_name HAVING COUNT(last_name)>1;

-- 2.Using the rental table, find out how many rentals were processed by each employee.
SELECT * FROM rental;
SELECT staff_id, count(rental_id) FROM sakila.rental GROUP BY staff_id;

-- 3.Using the film table, find out how many films were released each year.
SELECT * FROM sakila.film;
SELECT release_year, count(title) FROM sakila.film GROUP BY release_year;

-- 4.Using the film table, find out for each rating how many films were there.
SELECT * FROM sakila.film;
SELECT rating, count(title) FROM sakila.film GROUP BY rating;

-- 5.What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
SELECT rating, round(avg(length),2) as mean_length FROM sakila.film GROUP BY rating;

-- 6.Which kind of movies (rating) have a mean duration of more than two hours?
SELECT rating FROM sakila.film GROUP BY rating HAVING avg(length)>120;

-- 7.Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.
SELECT title, length, DENSE_RANK() OVER(ORDER BY length DESC) as 'Rank' FROM sakila.film WHERE (length <> 0 AND length IS NOT NULL);
