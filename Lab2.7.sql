USE sakila;

-- 1.How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT * FROM sakila.film;
SELECT 
    c.name, COUNT(f.title) AS count
FROM
    sakila.film f
        JOIN
    sakila.film_category fc ON f.film_id = fc.film_id
        JOIN
    sakila.category c ON fc.category_id = c.category_id
GROUP BY c.name;

-- 2.Display the total amount rung up by each staff member in August of 2005.
SELECT 
    s.first_name, SUM(p.amount) AS 'total_payment'
FROM
    sakila.staff s
        JOIN
    sakila.payment p ON s.staff_id = p.staff_id
GROUP BY s.first_name;

-- 3.Which actor has appeared in the most films?
SELECT 
    CONCAT(a.first_name, ' ', a.last_name)
FROM
    film f
        JOIN
    film_actor fa ON f.film_id = fa.film_id
        JOIN
    actor a ON fa.actor_id = a.actor_id
GROUP BY a.first_name , a.last_name
HAVING COUNT(f.film_id)
ORDER BY COUNT(f.film_id) DESC
LIMIT 1;

-- 4.Most active customer (the customer that has rented the most number of films)
SELECT 
    c.first_name, c.last_name, COUNT(rental_id)
FROM
    sakila.rental r
        JOIN
    sakila.customer c ON r.customer_id = c.customer_id
GROUP BY c.first_name , c.last_name
ORDER BY COUNT(rental_id) DESC;


-- 5.Display the first and last names, as well as the address, of each staff member.
SELECT 
    s.first_name, s.last_name, a.address
FROM
    sakila.staff s
        JOIN
    sakila.address a ON s.address_id = a.address_id;

-- 6.List each film and the number of actors who are listed for that film.
SELECT 
    f.title, COUNT(fa.actor_id) AS actors_count
FROM
    sakila.film f
        JOIN
    film_actor fa ON f.film_id = fa.film_id
GROUP BY fa.film_id;

-- 7.Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT 
    c.first_name, c.last_name, SUM(p.amount) AS total_amount
FROM
    sakila.customer c
        JOIN
    sakila.payment p ON c.customer_id = p.customer_id
GROUP BY p.customer_id
ORDER BY c.last_name ASC;

-- 8.List number of films per category.
SELECT * FROM sakila.film;
SELECT 
    c.name, COUNT(f.title) AS count
FROM
    sakila.film f
        JOIN
    sakila.film_category fc ON f.film_id = fc.film_id
        JOIN
    sakila.category c ON fc.category_id = c.category_id
GROUP BY c.name;