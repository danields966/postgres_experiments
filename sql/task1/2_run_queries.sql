/* 1. Display unique combinations of user and product ID for all purchases made by users before they were banned.
   Sort first by user name, then by SKU */
SELECT DISTINCT
    u.id,
    u.firstname,
    u.lastname,
    p.sku
FROM users u
JOIN purchases p ON u.id = p.user_id
LEFT JOIN banned_users b ON u.id = b.user_id
WHERE p.date < COALESCE(b.date_from, '9999-12-31')
ORDER BY u.firstname, u.lastname, p.sku;

/*2. Find users who have made purchases totaling more than 500 rubles.
   Display user ID, first name, last name, total purchase amount.*/
SELECT
    u.id,
    u.firstname,
    u.lastname,
    SUM(p.price) AS total_purchases
FROM users u
JOIN purchases p ON u.id = p.user_id
GROUP BY
    u.id,
    u.firstname,
    u.lastname
HAVING SUM(p.price) > 500
ORDER BY total_purchases DESC;
