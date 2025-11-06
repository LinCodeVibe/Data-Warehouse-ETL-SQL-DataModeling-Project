/*
===============================================================================
DDL Script: Create Tables for Bronze Layer
===============================================================================
    This script defines the table structures within the bronze schema.
It first drops any existing tables (if present) and then recreates them 
to ensure the schema is properly initialized.

Run this script to reset and re-establish the DDL structure for all bronze tables.
===============================================================================
*/

-- To ensure the target table is dropped (deleted) 
-- only if it already exists before recreating it.
IF OBJECT_ID ('bronze.crm_cust_info' , 'U') IS NOT NULL
	DROP TABLE bronze.crm_cust_info;

-- CREATE the table for cust_info.csv
CREATE TABLE bronze.crm_cust_info (
	cst_id INT,
	cst_key NVARCHAR(50),
	cst_firstname NVARCHAR(50),
	cst_lastname NVARCHAR(50),
	cst_marital_status NVARCHAR(50),
	cst_gndr NVARCHAR(50),
	cst_create_date DATE
);

IF OBJECT_ID ('bronze.crm_prd_info' , 'U') IS NOT NULL
	DROP TABLE bronze.crm_prd_info;
-- CREATE the table for prd_info.csv
CREATE TABLE bronze.crm_prd_info (
	prd_id INT,
	prd_key NVARCHAR(50),
	prd_nm NVARCHAR(50),
	prd_cost INT,
	prd_line NVARCHAR(50),
	prd_start_dt NVARCHAR(50),
	prd_end_dt NVARCHAR(50)
);

IF OBJECT_ID ('bronze.crm_sales_details' , 'U') IS NOT NULL
	DROP TABLE bronze.crm_sales_details;
-- CREATE the table for sales_details.csv
CREATE TABLE bronze.crm_sales_details (
	sls_ord_num NVARCHAR(50),
	sls_prd_key NVARCHAR(50),
	sls_cust_id INT,
	sls_order_dt INT,
	sls_ship_dt INT,
	sls_due_dt INT,
	sls_sales INT,
	sls_quantity INT,
	sls_price INT
);


IF OBJECT_ID ('bronze.erp_loc_a101' , 'U') IS NOT NULL
	DROP TABLE bronze.erp_loc_a101;
-- CREATE the table for LOC_A101.csv
CREATE TABLE bronze.erp_loc_a101 (
	CID NVARCHAR(50),
	CNTRY NVARCHAR(50)
);


IF OBJECT_ID ('bronze.erp_cust_az12' , 'U') IS NOT NULL
	DROP TABLE bronze.erp_cust_az12;
-- CREATE the table for CUST_AZ12.csv
CREATE TABLE bronze.erp_cust_az12 (
	CID NVARCHAR(50),
	BDATE DATE,
	GEN NVARCHAR(50)
);


IF OBJECT_ID ('bronze.erp_px_cat_g1v2' , 'U') IS NOT NULL
	DROP TABLE bronze.erp_px_cat_g1v2;
--CREATE the table for PX_CAT_G1V2.csv
CREATE TABLE bronze.erp_px_cat_g1v2 (
	ID	NVARCHAR(50),
	CAT NVARCHAR(50),
	SUBCAT NVARCHAR(50),
	MAINTENANCE NVARCHAR(50)
)

