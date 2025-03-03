WITH total_cost AS (
SELECT 
    p.item_id,
    i.productName,
    v.vendorName,
    SUM(cost * quantity) AS total_cost
FROM
    purchases p
        INNER JOIN
    items i ON p.item_id = i.item_id
        INNER JOIN
    vendors v ON p.vendorName = v.vendorName
GROUP BY p.item_id , i.productName , v.vendorName),
revenue AS (
SELECT 
    s.item_id, i.productName, SUM(price * quantity) AS revenue
FROM
    sales s
        INNER JOIN
    items i ON s.item_id = i.item_id
GROUP BY s.item_id , i.productName
),
total_inventory AS (
	SELECT inv.item_id, inv.productName, inv.quantity_on_hand, sum(cost*quantity_on_hand) as total_inventory
    from inventory inv
    INNER JOIN purchases p ON inv.item_id = p.item_id
    GROUP BY inv.item_id, inv.productName, inv.quantity_on_hand
    )
SELECT 
    tc.item_id,
    tc.productName,
    tc.vendorName,
    ti.total_inventory,
    tc.total_cost,
    r.revenue,
    r.revenue - tc.total_cost AS profit
FROM
    total_cost tc
        INNER JOIN
    revenue r ON tc.item_id = r.item_id
        INNER JOIN
    total_inventory ti ON tc.item_id = ti.item_id
ORDER BY profit DESC;
