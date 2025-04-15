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

SELECT * FROM category ca
INNER JOIN film_category fc 
on ca.category_id = fc.category_id
INNER JOIN film f ON f.film_id = fc.film_id
INNER JOIN language l 
on f.language_id = l.language_id
INNER JOIN film_actor fa 
on  fa.film_id = fa.film_id
INNER JOIN actor a 
on  fa.actor_id = a.actor_id
INNER JOIN inventory i 
on f.film_id = i.film_id
INNER JOIN film_text ft 
on i.film_id = ft.film_id
INNER JOIN rental r 
on i.inventory_id = r.inventory_id
INNER JOIN payment p 
on r.rental_id = p.rental_id
INNER JOIN staff s 
on p.staff_id = s.staff_id
INNER JOIN store st 
on s.store_id = st.store_id
INNER JOIN customer cu 
on st.customer_id = cu.customer_id
INNER JOIN address a 
on s.address_id = a.address_id
INNER JOIN city c 
on a.city_id = c.city_id
INNER JOIN country cy 
on c.country_id = cy.country_id


--ACTIVIDAD 6

SELECT COUNT(*), rating FROM film
GROUP BY rating

--ACTIVIDAD 7

SELECT COUNT(*) as cant_pelis,ca.name FROM film f
INNER JOIN film_category fc 
on f.film_id = fc.film_id
INNER JOIN category ca 
on ca.category_id = fc.category_id
GROUP BY ca.category_id

--ACTIVIDAD 8

SELECT COUNT(*) AS cant_actores, a.first_name, a.last_name FROM film f
INNER JOIN film_actor fa 
on f.film_id = fa.film_id
INNER JOIN actor a 
on a.actor_id = fa.actor_id
GROUP BY a.actor_id
ORDER BY cant_actores DESC LIMIT 10;

--ACTIVIDAD 9

SELECT COUNT(i.inventory_id) AS total_inventory,  a.address, c.city, co.country
FROM store s
INNER JOIN address a 
ON s.address_id = a.address_id
INNER JOIN city c 
ON a.city_id = c.city_id
INNER JOIN country co 
ON c.country_id = co.country_id
INNER JOIN inventory i 
ON s.store_id = i.store_id
GROUP BY s.store_id;

--ACTIVIDAD 10

SELECT COUNT(*) AS total_inventory,  a.address, c.city, co.country
FROM film f
INNER JOIN inventory i 
N f.film_id = i.film_id
INNER JOIN store s 
on s.store_id = i.store_id
INNER JOIN address a 
ON s.address_id = a.address_id
INNER JOIN city c 
ON a.city_id = c.city_id
INNER JOIN country co 
ON c.country_id = co.country_id
GROUP BY s.store_id;

--ACTIVIDAD 11

SELECT c.name AS categoria, AVG(f.rental_rate * f.rental_duration)
FROM category c
INNER JOIN film_category fc 
ON c.category_id = fc.category_id
INNER JOIN film f 
ON fc.film_id = f.film_id
GROUP BY  c.name
ORDER BY f.rental_rate DESC;

--ACTIVIDAD 12

SELECT (f.rental_duration * f.rental_rate), f.rental_rate, r.return_date
FROM film f
INNER JOIN inventory i 
on f.film_id = i.film_id
INNER JOIN rental r 
ON i.inventory_id = r.inventory_id
WHERE f.title = "ALABAMA DEVIL"

--ACTIVIDAD 13

SELECT f.title, f.rental_duration, ca.name
FROM category ca
INNER JOIN film_category fc 
on ca.category_id = fc.category_id
INNER JOIN film f 
ON f.film_id = fc.film_id
ORDER BY rental_duration DESC;

--ACTIVIDAD 14

SELECT f.title,COUNT(a.actor_id) AS actores FROM film f
INNER JOIN film_actor fa 
ON f.film_id = fa.film_id
INNER JOIN actor a 
ON fa.actor_id = a.actor_id
WHERE title like "w%"
GROUP BY f.film_id
HAVING actores > 5

--ACTIVIDAD 15

SELECT SUM(p.amount), c.first_name
FROM customer c
INNER JOIN payment p 
on c.customer_id = p.customer_id
group by p.customer_id

--ACTIVIDAD 16

SELECT f.title, f.rental_duration, a.first_name, ca.name
FROM category ca
INNER JOIN film_category fc 
on ca.category_id = fc.category_id
INNER JOIN film f 
ON f.film_id = fc.film_id
INNER JOIN film_actor fa 
ON f.film_id = fa.film_id
inner join actor a 
on a.actor_id = fa.actor_id
ORDER BY rental_duration ASC;


kpo44


