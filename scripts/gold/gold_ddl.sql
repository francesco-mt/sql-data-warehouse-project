/*
===============================================================================
DDL Script: Create Gold Views
===============================================================================
Script Purpose:
    This script creates views for the Gold layer in the data warehouse. 
    The Gold layer represents the final dimension and fact tables (Star Schema)

    Each view performs transformations and combines data from the Silver layer 
    to produce a clean, enriched, and business-ready dataset.

Usage:
    - These views can be queried directly for analytics and reporting.
===============================================================================
*/

-- =============================================================================
-- Create Dimension: gold.dim_customers
-- =============================================================================
IF OBJECT_ID('gold.dim_customers', 'V') IS NOT NULL
    DROP VIEW gold.dim_customers;
GO

CREATE VIEW gold.dim_customers AS
SELECT
	ROW_NUMBER() OVER(ORDER BY ci.cst_id) AS customer_key,
	ci.cst_id AS customer_id, 
	ci.cst_key AS customer_number, 
	ci.cst_firstname AS first_name, 
	ci.cst_lastname AS last_name,
	la.cntry AS country,
	ci.cst_marital_status AS marital_status,
	CASE
		WHEN ISNULL(ci.cst_gndr, 'n/a') != 'n/a' THEN ci.cst_gndr
		ELSE ISNULL(ca.gen, 'n/a')
	END AS gender,
	ca.bdate AS birthdate,
	ci.cst_create_date AS create_date
FROM silver.crm_cust_info ci
LEFT JOIN silver.erp_cust_az12 ca ON ci.cst_id = ca.cid
LEFT JOIN silver.erp_loc_a101 la ON ci.cst_id = la.cid

GO

IF OBJECT_ID('gold.dim_products', 'V') IS NOT NULL
    DROP VIEW gold.dim_products;
GO

-- =============================================================================
-- Create Dimension: gold.dim_products
-- =============================================================================

CREATE VIEW gold.dim_products AS
SELECT
ROW_NUMBER() OVER(ORDER BY pin.prd_start_dt, pin.prd_id) AS product_key,
	pin.prd_id AS product_id,
	pin.prd_key AS product_number,
	pin.prd_nm AS product_name,
	pin.cat_id AS category_id,
	pcg.cat AS category,
	pcg.subcat AS subcategory,
	pcg.maintenance AS maintenance,
	pin.prd_cost AS cost,
	pin.prd_line AS product_line,
	pin.prd_start_dt AS start_date		
FROM silver.crm_prd_info pin
LEFT JOIN silver.erp_px_cat_g1v2 pcg ON cat_id = pcg.id
WHERE pin.prd_end_dt IS NULL

GO

-- =============================================================================
-- Create Fact Table: gold.fact_sales
-- =============================================================================

IF OBJECT_ID('gold.fact_sales', 'V') IS NOT NULL
    DROP VIEW gold.fact_sales;
GO
  
CREATE VIEW gold.fact_sales AS
SELECT 
	sd.sls_ord_num AS order_name,
	pr.product_key,
	cu.customer_key,
	sd.sls_order_dt AS order_date,
	sd.sls_ship_dt AS shipping_date,
	sd.sls_due_dt AS due_date,
	sd.sls_sales AS sales_amount,
	sd.sls_quantity AS quantity,
	sd.sls_price AS price
FROM silver.crm_sales_details sd
LEFT JOIN gold.dim_products pr ON sd.sls_prd_key = pr.product_number
LEFT JOIN gold.dim_customers cu ON sd.sls_cust_id = cu.customer_id

GO
