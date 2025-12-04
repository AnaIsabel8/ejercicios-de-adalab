/* EJERCICIO 2 */
use sakila;

/* 1.Selecciona todos los nombres de las películas sin que aparezcan duplicados */
SELECT DISTINCT title
FROM film;

/* 2.Muestra los nombres de todas las películas que tengan una clasificación de "PG-13" */
SELECT title
FROM film
WHERE rating = "PG-13";

/* 3.Encuentra el título y la descripción de todas las películas que contengan la palabra "amazing" en su
 descripción */
 SELECT title, description
 FROM film
 WHERE description LIKE "%amazing%";
 
 /* 4.Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos */
 SELECT title
 FROM film
 WHERE length > 120;
 
 /* 5.Recupera los nombres de todos los actores */
 SELECT first_name
 FROM actor;
 
 /* 6.Encuentra el nombre y apellido de los actores que tengan "Gibson" en su apellido */
 SELECT first_name, last_name
 FROM actor
 WHERE last_name LIKE '%gibson%';
 
 /* 7.Encuentra los nombres de los actores que tengan un actor_id entre 10 y 20 */
 SELECT first_name, last_name
 FROM actor
 WHERE actor_id BETWEEN 10 AND 20;
 
 /* 8. Encuentra el título de las películas en la tabla film que no sean ni "R" ni "PG-13" en cuanto a su clasificación */
 SELECT title
 FROM film
 WHERE rating <> "R" AND rating <> "PG-13";
 
SELECT title
FROM film
WHERE rating NOT IN ('R', 'PG-13');
 
 /* 9.Encuentra la cantidad total de películas en cada clasificación de la tabla film y muestra la clasificación junto con el recuento */
 SELECT rating, COUNT(*)
 FROM film
 GROUP BY rating;
 
 /* 10.Encuentra la CANTIDAD TOTAL de PELÍCULAS ALQUILADAS por cada cliente 
 y muestra el ID del cliente, su NOMBRE y APELLIDO junto con la CANTIDAD de películas alquiladas */
 
SELECT c.customer_id, c.first_name, c.last_name, COUNT(r.rental_id) AS total_peliculasAlquiladas /* columnas que queremos mostrar */
FROM customer AS c
JOIN rental AS r ON c.customer_id = r.customer_id  /* combinamos la tabla CUSTOMER vs RENTAL cuando customer_id coincida en ambas tablas*/
GROUP BY c.customer_id, c.first_name, c.last_name; /* agrupamos por cliente para que COUNT cuente el nº total de peliculas por cliente */

/* 11.Encuentra la cantidad TOTAL de películas ALQUILADAS por CATEGORÍA y 
muestra el nombre de la CATEGORÍA junto con el recuento de alquileres */

SELECT c.name, COUNT(r.rental_id) 
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY c.name;

/* 12.Encuentra el PROMEDIO de DURACIÓN de las PELÍCULAS para cada clasificación de la tabla film y 
muestra la CLASIFICACIÓN (rating) junto con el PROMEDIO de duración (AVG(length)) */

SELECT rating, AVG(length) AS duracion_promedio_peliculas /* con SELECT muestro lo que me pide */
FROM film
GROUP BY rating;

/* 13.Encuentra el NOMBRE y APELLIDO de los ACTORES que aparecen en la película con TITLE "Indian Love" */

SELECT a.first_name, a.last_name
FROM actor AS a
JOIN film_actor AS fa ON a.actor_id = fa.actor_id
JOIN film AS f ON fa.film_id = f.film_id
WHERE f.title = "Indian love";

/* 14.Muestra el TÍTULO de todas las PELÍCULAS que contengan la palabra "dog" o "cat" en su DESCRIPCIÓN */

SELECT title
FROM film
WHERE description LIKE '%dog%' 
	OR description LIKE '%cat%';

/* 15.Encuentra el TÍTULO de todas las PELÍCULAS que fueron lanzadas ENTRE el año 2005 y 2010. */

SELECT title
FROM film
WHERE release_year BETWEEN 2005 AND 2010;

 