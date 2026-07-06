# Project Documentation: RiwiSupply

**Project description:** Design and implementation of a normalized relational database to centralize the purchase, inventory, and movement information for RiwiSupply S.A.S.

**Technologies used:** MySQL / SQL, DBeaver.

**Database engine used:** MySQL / MariaDB (The script is 100% compatible).

**Developer information:**
- **Full name:** Frank
- **Clan:** [Enter your clan here]

## Explanation of normalization process

**Initial structure:** The provided CSV file contained 11 columns mixing data for suppliers, cities, warehouses, products, and inventory movements in every row. This caused severe data redundancy and anomalies.

**Identified problems:**
- Suppliers were duplicated with different naming formats (e.g., Aceros del Norte S.A.S, ACEROS NORTE, Aceros del Norte).
- Cities were spelled incorrectly or differently (e.g., Barranquila, B/quilla, Barranquilla, Sta Marta).
- Duplicate products due to syntax errors (e.g., Disco Corte 4.5, Disco de Corte 4.5).
- Heavy data redundancy (categories and cities were repeated on every movement record).

**Transformations performed (1NF, 2NF, 3NF):**
- **1NF:** Ensured atomicity of data. Separated values and ensured there are no repeating groups.
- **2NF:** Removed partial dependencies. Supplier names and warehouse cities did not depend on the movement transaction, so they were separated into master tables like `riwi_cities` and `riwi_categories`.
- **3NF:** Removed transitive dependencies. We built isolated tables for `riwi_suppliers`, `riwi_warehouses`, and `riwi_products`, keeping the transactional fact data centralized inside `riwi_inventory_movements`.

## Database structure

- `riwi_cities`: Stores cities (PK: riwi_id_city).
- `riwi_categories`: Stores product categories (PK: riwi_id_category).
- `riwi_suppliers`: Stores suppliers (PK: riwi_id_supplier, FK: riwi_id_city).
- `riwi_warehouses`: Stores operational warehouses (PK: riwi_id_warehouse, FK: riwi_id_city).
- `riwi_products`: Stores products (PK: riwi_id_product, FK: riwi_id_category).
- `riwi_inventory_movements`: Registers all movements (PK: riwi_id_movement, FKs: supplier, warehouse, product).

## Entity Relationship Model (ERM)

The model consists of a central fact table (`riwi_inventory_movements`) connected to three dimension tables: Suppliers, Products, and Warehouses. Furthermore, Suppliers and Warehouses are connected to a Cities table, and Products are connected to a Categories table.

## Instructions to create the database

1. Open DBeaver or your preferred SQL client.
2. Copy the contents of the `script_dbeaver.sql` file.
3. Execute section **1. Script DDL** to create the `bd_frank_apellido_clan` database and its relational structure.

## Instructions to load data

1. In the same script, run section **2. Carga de datos (DML)**.
2. We manually cleansed and normalized the 20 records from the original CSV to maintain referential integrity. Executing these `INSERT INTO` statements will populate the database perfectly.

## Explanation of each SQL query

- **Query 1 (Stock by product):** Uses `LEFT JOIN` and `SUM(CASE...)` to determine current stock by adding 'IN' quantities and subtracting 'OUT' quantities.
- **Query 2 (Movement details):** Uses multiple `JOIN` statements to provide a detailed view replacing IDs with actual names.
- **Query 3 (Total bought by supplier):** Sums the cost (`quantity * unit_price`) for all 'IN' (purchase) movements grouped by supplier.
- **Query 4 (Movements by warehouse):** Uses `COUNT` grouped by warehouse ID to find which location has more activity.
- **Query 5 (Highest volume product):** Groups by product and sums the volume (`quantity`), using `LIMIT 1` and descending order to get the highest rotation product.
- **Query 6 (Total inventory value by warehouse):** Calculates the economic value of inventory (quantity * price), taking positive values for entries and negative for exits, grouped by warehouse.
