SELECT 
    s1.customer_id, SUM(total_sales) AS sales
FROM
    (SELECT 
        customer_id,
            productName,
            price,
            quantity,
            sales.price * sales.quantity AS total_sales
    FROM
        sales
    INNER JOIN items ON sales.item_id = items.item_id
    GROUP BY customer_id , productName , price , quantity) s1
GROUP BY s1.customer_id
ORDER BY sales DESC;
