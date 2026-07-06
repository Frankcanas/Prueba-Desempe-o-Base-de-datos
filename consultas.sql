
SELECT p.riwi_name_product, 
       COALESCE(SUM(CASE WHEN m.riwi_movement_type = 'IN' THEN m.riwi_quantity ELSE -m.riwi_quantity END), 0) as riwi_available_stock
FROM riwi_products p
LEFT JOIN riwi_inventory_movements m ON p.riwi_id_product = m.riwi_id_product
GROUP BY p.riwi_id_product, p.riwi_name_product;



SELECT m.riwi_movement_date, 
       m.riwi_movement_type, 
       m.riwi_quantity, 
       p.riwi_name_product, 
       w.riwi_name_warehouse
FROM riwi_inventory_movements m
JOIN riwi_products p ON m.riwi_id_product = p.riwi_id_product
JOIN riwi_warehouses w ON m.riwi_id_warehouse = w.riwi_id_warehouse
ORDER BY m.riwi_movement_date DESC;



SELECT s.riwi_name_supplier, 
       COALESCE(SUM(m.riwi_quantity * m.riwi_unit_price), 0) as riwi_total_purchased
FROM riwi_suppliers s
JOIN riwi_inventory_movements m ON s.riwi_id_supplier = m.riwi_id_supplier 
WHERE m.riwi_movement_type = 'IN'
GROUP BY s.riwi_id_supplier, s.riwi_name_supplier;



SELECT w.riwi_name_warehouse, 
       COUNT(m.riwi_id_movement) as riwi_total_movements
FROM riwi_warehouses w
LEFT JOIN riwi_inventory_movements m ON w.riwi_id_warehouse = m.riwi_id_warehouse
GROUP BY w.riwi_id_warehouse, w.riwi_name_warehouse
ORDER BY riwi_total_movements DESC;



SELECT p.riwi_name_product, 
       SUM(m.riwi_quantity) as riwi_total_volume
FROM riwi_products p
JOIN riwi_inventory_movements m ON p.riwi_id_product = m.riwi_id_product
WHERE m.riwi_movement_type = 'IN'
GROUP BY p.riwi_id_product, p.riwi_name_product
ORDER BY riwi_total_volume DESC
LIMIT 1;



SELECT w.riwi_name_warehouse, 
       COALESCE(SUM(CASE WHEN m.riwi_movement_type = 'IN' THEN m.riwi_quantity * m.riwi_unit_price 
                         ELSE -m.riwi_quantity * m.riwi_unit_price END), 0) as riwi_total_value
FROM riwi_warehouses w
LEFT JOIN riwi_inventory_movements m ON w.riwi_id_warehouse = m.riwi_id_warehouse
GROUP BY w.riwi_id_warehouse, w.riwi_name_warehouse;
