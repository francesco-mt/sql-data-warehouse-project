-- QUALITY TESTS AND CHECKS


-- Returns duplicates. Expactation : no result.
SELECT 
sls_ord_num, 
COUNT(*)
FROM silver.crm_sales_details 
GROUP BY sls_ord_num
HAVING COUNT(*) > 1 OR sls_ord_num IS NULL;

-- Returns strings with unwanted spaces. Expactation: no result.
SELECT 
subcat
FROM bronze.erp_px_cat_g1v2 
WHERE subcat  != TRIM(subcat) OR subcat IS NULL;

-- Returns negative numbers or null
SELECT 
	sls_price
FROM silver.crm_sales_details
WHERE sls_quantity < 0 OR sls_quantity IS NULL;

--
SELECT 
	DISTINCT prd_line
FROM bronze.crm_prd_info

-- Returns rows with impossible dates combination. Expectation : no result
SELECT 
	 *
FROM silver.crm_sales_details
WHERE sls_order_dt > sls_ship_dt OR sls_order_dt > sls_due_dt




SELECT 
COUNT(*) cnt
FROM silver.erp_loc_a101
WHERE CAST(cid AS VARCHAR) NOT IN (
SELECT CAST(cst_id AS VARCHAR) FROM silver.crm_cust_info)

-- Returns values that are not in another column or that are null. Expactation: no result
SELECT 
	cid	
FROM silver.erp_cust_az12 s
WHERE NOT EXISTS (
	SELECT 1 
	FROM silver.crm_cust_info c 
	WHERE c.cst_id = s.cid
)
OR cid IS NULL;

-- Returns invalid dates (INT data type). Expectation: no result
SELECT NULLIF(sls_ship_dt, 0) sls_ship_dt
FROM silver.crm_sales_details
WHERE sls_ship_dt <= 0
OR LEN(sls_ship_dt) != 8
OR sls_ship_dt > 20500101
OR sls_ship_dt < 19000101 

-- Returns rows in which sales, quantity and price are not coherent with one another
SELECT
* 
FROM silver.crm_sales_details
WHERE sls_sales != sls_quantity * sls_price
OR sls_sales IS NULL OR sls_quantity IS NULL OR sls_price IS NULL
OR sls_sales <= 0 OR sls_quantity <= 0 OR sls_price <= 0
ORDER BY sls_sales DESC

-- Returns rows with future dates

SELECT bdate
FROM silver.erp_cust_az12
WHERE bdate > GETDATE()

SELECT cntry FROM silver.erp_loc_a101
WHERE LEN(cntry) < 7 AND cntry != 'n/a'
