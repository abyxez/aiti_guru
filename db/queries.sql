-- 2.1 Сумма товаров по каждому клиенту
SELECT
    c.name AS client_name,
    SUM(p.price * oi.quantity) AS total_sum
FROM client c
JOIN customer_order o ON o.client_id = c.id
JOIN order_item oi ON oi.order_id = o.id
JOIN product p ON p.id = oi.product_id
GROUP by c.name
ORDER BY total_sum DESC;

-- 2.2 Количество дочерних категорий первого уровня
SELECT
    parent.name AS category_name,
    COUNT(child.id) AS children_count
FROM category AS parent
LEFT JOIN category AS child ON child.parent_id = parent.id
GROUP BY parent.name
ORDER BY children_count DESC;