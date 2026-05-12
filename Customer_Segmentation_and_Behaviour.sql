-- 1. Top 5 High-Value Customers by Location
WITH top_5_customers AS(
    SELECT
        c.customer_id,
        c.first_name,
        c.last_name,
        c.address_id,
        sum(p.amount) as total_spend
    FROM customer as c
    JOIN payment as p ON c.customer_id = p.customer_id
    GROUP BY c.customer_id
    ORDER BY sum(p.amount) DESC
    LIMIT 5)
SELECT
    t5c.customer_id,
    concat(t5c.first_name, " ", t5c.last_name) as full_name,
    a.address,
    ci.city,
    t5c.total_spend
FROM address as a
JOIN top_5_customers as t5c on a.address_id = t5c.address_id
JOIN city as ci on a.city_id = ci.city_id;

-- 2. Customer Engagement Lifespan (Retention)
SELECT
    CONCAT(c.first_name, ' ', c.last_name) as Full_Name,
    MIN(r.rental_date) as First_Rental,
    MAX(r.rental_date) as Last_Rental
FROM customer as c
JOIN rental as r on c.customer_id = r.customer_id
GROUP BY c.customer_id;

-- 3. Targeted Behavioral Filtering (Action Genre Fans)
SELECT 
    cu.customer_id,
    CONCAT(cu.first_name, " ", cu.last_name) AS full_name
FROM customer AS cu
WHERE EXISTS (
    SELECT 1
    FROM rental AS re
    JOIN inventory AS inv ON re.inventory_id = inv.inventory_id
    JOIN film_category AS fc ON inv.film_id = fc.film_id
    JOIN category AS ca ON fc.category_id = ca.category_id
    WHERE ca.name = 'Action' 
    AND re.customer_id = cu.customer_id);