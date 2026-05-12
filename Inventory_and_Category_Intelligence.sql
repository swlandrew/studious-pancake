-- 1. Category Revenue Ranking and Competitive Gap
WITH CategoryRevenue AS (
    SELECT 
        c.name AS category_name,
        SUM(p.amount) AS total_revenue
    FROM category c
    JOIN film_category fc ON c.category_id = fc.category_id
    JOIN film f ON fc.film_id = f.film_id
    JOIN inventory i ON f.film_id = i.film_id
    JOIN rental r ON i.inventory_id = r.inventory_id
    JOIN payment p ON r.rental_id = p.rental_id
    GROUP BY c.name
)
SELECT 
    category_name,
    total_revenue,
    RANK() OVER (ORDER BY total_revenue DESC) AS revenue_rank,
    total_revenue - LAG(total_revenue) OVER (ORDER BY total_revenue DESC) AS gap_to_next
FROM CategoryRevenue;

-- 2. "Dead Stock" Audit (Titles with Zero Inventory)
SELECT
    f.title,
    count(i.inventory_id) as current_inventory
FROM film as f
LEFT JOIN inventory as i on f.film_id = i.film_id
GROUP BY f.film_id
HAVING current_inventory = 0;

-- 3. Dynamic Pricing Tiers (Budget vs Premium)
SELECT
    rental_rate,
    CASE
        WHEN rental_rate < 1.00 THEN 'Budget'
        WHEN rental_rate > 3.00 THEN 'Premium'
        ELSE 'Regular'
    END AS film_label
FROM film;

-- 4. In-Stock vs Out-of-Stock Status
SELECT
    f.film_id,
    f.title,
    CASE
        WHEN COUNT(i.film_id) > 0 THEN 'In Stock'
        ELSE 'Out of Stock'
    END AS stock_status
FROM film as f
LEFT JOIN inventory AS i ON f.film_id = i.film_id
GROUP BY f.film_id;