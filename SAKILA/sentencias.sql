--ACTIVIDAD 1

SELECT f.title, a.address, c.city, co.country
FROM film f
INNER JOIN inventory i 
ON f.film_id = i.film_id
INNER JOIN store s
ON i.store_id = s.store_id
INNER JOIN address a
ON s.address_id = a.address_id
INNER JOIN city c
ON a.city_id = c.city_id
INNER JOIN country co
ON c.country_id = co.country_id
WHERE f.title = "ALONE TRIP"

--ACTIVIDAD 2

SELECT f.title, c.name, l.name, f.rating, f.length
FROM film f
INNER JOIN film_category fc
ON f.film_id = fc.film_id
INNER JOIN category c
ON fc.category_id = c.category_id
INNER JOIN language l
ON f.language_id = l.language_id
WHERE f.length BETWEEN 60 AND 120;

--ACTIVIDAD 3

SELECT st.first_name, st.last_name, a.address, c.city, co.country
FROM staff st
INNER JOIN  address a
ON a.address_id = st.address_id
INNER JOIN city c
ON c.city_id = a.city_id
INNER JOIN country co
ON co.country_id = c.country_id

--ACTIVIDAD 4

SELECT f.title, MAX(rental_duration), MIN(rental_duration)
FROM film f

--ACTIVIDAD 5

no

--ACTIVIDAD 6

SELECT COUNT(*), rating FROM film
GROUP BY rating

--ACTIVIDAD 7

kpo44


