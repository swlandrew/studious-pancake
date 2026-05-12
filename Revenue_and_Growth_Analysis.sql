-- 1. Monthly Sales Performance
SELECT
    DATE_FORMAT(payment_date, '%Y - %m') as Month_Key,
    SUM(amount) as Total_Sale
FROM payment
GROUP BY Month_Key
ORDER BY Month_Key;

-- 2. Daily Rental Demand Trends
SELECT
    date_format(rental_date, '%W') as Day,
    count(rental_id) as Total_Rental
FROM rental
GROUP BY Day
ORDER BY Total_Rental DESC;

-- 3. Revenue Running Total
SELECT
    payment_id,
    payment_date,
    amount,
    sum(amount) OVER(ORDER BY payment_date) as running_total
FROM payment;

-- 4. Month-over-Month (MoM) Revenue Growth
WITH MonthlySales AS(
    SELECT
        DATE_FORMAT(payment_date, '%Y - %m') as Month_Key,
        SUM(amount) as Total_Sale
    FROM payment
    GROUP BY Month_Key)
SELECT
    Month_Key,
    Total_Sale,
    LAG(Total_Sale, 1) OVER(ORDER BY Month_Key) as Previous_Month_Sale
FROM MonthlySales;