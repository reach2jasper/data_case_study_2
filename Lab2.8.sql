-- LAB2.8
USE sakila;

-- 1.Write a query to display for each store its store ID, city, and country.
SELECT 
    s.store_id, c.city, co.country
FROM
    sakila.store s
        JOIN
    sakila.address a ON s.address_id = a.address_id
        JOIN
    sakila.city c ON a.city_id = c.city_id
        JOIN
    sakila.country co ON c.country_id = co.country_id;


-- 2.Write a query to display how much business, in dollars, each store brought in.
SELECT 
    c.store_id, SUM(p.amount) AS total
FROM
    sakila.payment p
        JOIN
    sakila.customer c ON p.customer_id = c.customer_id
GROUP BY c.store_id;

-- 3.Which film categories are longest?
SELECT 
    c.name, AVG(f.length)
FROM
    sakila.film f
        JOIN
    sakila.film_category fc ON f.film_id = fc.film_id
        JOIN
    sakila.category c ON fc.category_id = c.category_id
GROUP BY c.category_id
ORDER BY AVG(f.length) DESC;

-- 4.Display the most frequently rented movies in descending order.
SELECT 
    f.title, COUNT(r.rental_id) AS rental_times
FROM
    sakila.rental r
        JOIN
    sakila.inventory i ON r.inventory_id = i.inventory_id
        JOIN
    sakila.film f USING (film_id)
GROUP BY f.title
ORDER BY COUNT(r.rental_id) DESC;

-- 5.List the top five genres in gross revenue in descending order.
SELECT 
    c.name, SUM(amount) AS 'revenue'
FROM
    sakila.category c
        JOIN
    sakila.film_category fc USING (category_id)
        JOIN
    sakila.inventory i ON i.film_id = fc.film_id
        JOIN
    sakila.rental r ON i.inventory_id = r.inventory_id
        JOIN
    sakila.payment p ON r.rental_id = p.rental_id
GROUP BY c.name
ORDER BY gross_revenue DESC;

-- 6.Is "Academy Dinosaur" available for rent from Store 1?
SELECT 
    title, store_id
FROM
    sakila.film f
        JOIN
    sakila.inventory USING (film_id)
WHERE
    (TITLE = 'Academy Dinosaur'
        AND store_id = 1);

-- 7.Get all pairs of actors that worked together.
SELECT 
    fa.film_id, f.title, a.first_name, a.last_name
FROM
    sakila.actor a
        JOIN
    sakila.film_actor fa USING (actor_id)
        JOIN
    sakila.film f USING (film_id);