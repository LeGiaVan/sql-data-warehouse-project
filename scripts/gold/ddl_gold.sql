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



IF OBJECT_ID('gold.dim_customers', 'V') IS NOT NULL
    DROP VIEW gold.dim_customers;
GO
CREATE VIEW gold.dim_customers AS (
	SELECT
		ROW_NUMBER() OVER(ORDER BY [cst_id]) AS customer_key -- surrogate key - khóa nhân tạo dùng để định danh duy nhất một bản ghi trong bảng
		,ci.[cst_id] customer_id
		,ci.[cst_key] customer_number
		,ci.[cst_firstname] first_name
		,ci.[cst_lastname] last_name
		,ci.[cst_marital_status] marital_status
		,CASE
			WHEN ci.[cst_gndr] != 'n/a' THEN ci.[cst_gndr]
			ELSE COALESCE(ca.gen, 'n/a')
		END AS gender
		,ca.bdate birthdate
		,la.cntry country
		,ci.[cst_create_date]  create_date 
	FROM silver.crm_cust_info ci
	LEFT JOIN silver.erp_cust_az12 ca
	ON ca.cid = ci.cst_key
	LEFT JOIN silver.erp_loc_a101 la
	ON la.cid = ci.cst_key
)

IF OBJECT_ID('gold.dim_products', 'V') IS NOT NULL
    DROP VIEW gold.dim_products;
GO
CREATE VIEW gold.dim_products AS (
	SELECT
		ROW_NUMBER() OVER (ORDER BY cpi.[prd_start_dt], [prd_key]) AS product_key
		,cpi.[prd_id] product_id
		,cpi.[prd_key] product_number
		,cpi.[prd_nm] product_name
		,cpi.[cat_id] category_id
		,cg.cat category_name
		,cg.subcat subcategory
		,cg.maintenance
		,cpi.[prd_cost] cost
		,cpi.[prd_line] product_line
		,cpi.[prd_start_dt] start_date
	FROM silver.crm_prd_info cpi
	LEFT JOIN silver.erp_px_cat_g1v2 cg
	ON cpi.cat_id = cg.id
	WHERE prd_end_dt IS NULL -- NHỮNG PRODUCT NÀO CÒN HẠN SẼ CÓ NGÀY KẾT THÚC LÀ NULL
)

IF OBJECT_ID('gold.fact_sales', 'V') IS NOT NULL
    DROP VIEW gold.fact_sales;
GO
CREATE VIEW gold.fact_sales AS (
	SELECT
		csd.[sls_ord_num] order_number
		,dp.product_number 
		,dc.customer_id
		 ,csd.[sls_order_dt] order_date
		,csd.[sls_ship_dt] shipping_date
		,csd.[sls_due_dt] due_date
		,csd.[sls_sales] sales_amount
		,csd.[sls_quantity] quantity
		,csd.[sls_price] price
	FROM [silver].[crm_sales_details] csd
	LEFT JOIN gold.dim_products dp
	ON csd.sls_prd_key = dp.product_number
	LEFT JOIN gold.dim_customers dc
	ON csd.sls_cust_id = dc.customer_id
 )
