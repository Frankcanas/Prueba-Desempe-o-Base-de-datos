CREATE TABLE riwi_cities (
    riwi_id_city INT PRIMARY KEY,
    riwi_name_city VARCHAR(50)
);

CREATE TABLE riwi_categories (
    riwi_id_category INT PRIMARY KEY,
    riwi_name_category VARCHAR(50)
);

CREATE TABLE riwi_suppliers (
    riwi_id_supplier INT PRIMARY KEY,
    riwi_name_supplier VARCHAR(100),
    riwi_id_city INT,
    FOREIGN KEY (riwi_id_city) REFERENCES riwi_cities(riwi_id_city)
);

CREATE TABLE riwi_warehouses (
    riwi_id_warehouse INT PRIMARY KEY,
    riwi_name_warehouse VARCHAR(100),
    riwi_id_city INT,
    FOREIGN KEY (riwi_id_city) REFERENCES riwi_cities(riwi_id_city)
);

CREATE TABLE riwi_products (
    riwi_id_product INT PRIMARY KEY,
    riwi_name_product VARCHAR(100),
    riwi_id_category INT,
    FOREIGN KEY (riwi_id_category) REFERENCES riwi_categories(riwi_id_category)
);

CREATE TABLE riwi_inventory_movements (
    riwi_id_movement INT PRIMARY KEY,
    riwi_movement_date DATE,
    riwi_id_supplier INT,
    riwi_id_warehouse INT,
    riwi_id_product INT,
    riwi_quantity INT,
    riwi_unit_price DECIMAL(12,2),
    riwi_movement_type VARCHAR(3),
    riwi_purchase_order VARCHAR(50),
    FOREIGN KEY (riwi_id_supplier) REFERENCES riwi_suppliers(riwi_id_supplier),
    FOREIGN KEY (riwi_id_warehouse) REFERENCES riwi_warehouses(riwi_id_warehouse),
    FOREIGN KEY (riwi_id_product) REFERENCES riwi_products(riwi_id_product)
);
