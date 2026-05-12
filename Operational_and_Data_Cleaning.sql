-- 1. Data Standardization (Mailing List Format)
SELECT
    CONCAT(last_name, ', ', left(first_name, 1), '.') as mail_name
FROM customer;

-- 2. Unique Product ID Generation
SELECT
    CONCAT(upper(left(title,3)), '-', film_id) as unique_id
FROM film;

-- 3. Duplicate Record Audit (Self-Join)
SELECT
    a.first_name,
    b.last_name
FROM actor as a
JOIN actor as b ON a.first_name = b.first_name
WHERE a.actor_id < b.actor_id;

-- 4. Store Performance (Revenue & Unique Film Density)
SELECT
    inv.store_id,
    sum(pa.amount) as total_revenue,
    count(distinct inv.film_id) as total_unique_film
FROM inventory as inv
JOIN rental as r on inv.inventory_id = r.inventory_id
JOIN payment as pa on r.rental_id = pa.rental_id
GROUP BY inv.store_id;