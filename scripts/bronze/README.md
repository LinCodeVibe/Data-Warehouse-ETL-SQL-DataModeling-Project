# 🪙 Bronze Layer — Data Warehouse ETL (Source → Bronze)

## Overview
It contains SQL scripts for building and loading the **Bronze Layer** of a modern data warehouse.  
The Bronze Layer serves as the **raw ingestion zone**, where external CSV source data (from CRM and ERP systems) is first landed in SQL Server tables for further transformation.

---

## 
![Data Flow Diagram](./scripts/bronze/BronzeLayer.png)
----


## 📂 Repository Structure
| File | Description |
|------|--------------|
| `DDL_create_table_bronze.sql` | Creates all Bronze tables (CRM & ERP) under the `bronze` schema. Drops existing tables if they already exist. |
| `Procedure_Load_Bronze_Layer.sql` | Defines a stored procedure `bronze.load_bronze` that truncates and reloads Bronze tables from external CSV files using `BULK INSERT`. |

---

## Bronze Schema Tables
### CRM Tables
- **bronze.crm_cust_info** — Customer information  
- **bronze.crm_prd_info** — Product information  
- **bronze.crm_sales_details** — Sales transactions  

### ERP Tables
- **bronze.erp_loc_a101** — Location data  
- **bronze.erp_cust_az12** — Customer demographics  
- **bronze.erp_px_cat_g1v2** — Product category metadata  

---

## Stored Procedure: `bronze.load_bronze`

### Purpose
The stored procedure **loads data from external CSV files** into the Bronze schema.  
It performs the following steps:
1. Truncates each Bronze table to clear existing data.  
2. Loads data from local CSV files using the SQL Server `BULK INSERT` command.  
3. Prints detailed logs with start and end timestamps for each table load.  

### Example Usage
```sql
EXEC bronze.load_bronze;
```

### Key Features
- Automatic data refresh from external source files  
- Row-by-row timing output for monitoring ETL duration  
- Exception handling with `TRY…CATCH` and descriptive error logging  

---

## Execution Flow
1. Run `DDL_create_table_bronze.sql` to **create or re-initialize** the Bronze tables.  
2. Run `Procedure_Load_Bronze_Layer.sql` to **create the stored procedure**.  
3. Execute the procedure to **load CSV data**:
   ```sql
   EXEC bronze.load_bronze;
   ```

---


## Prerequisites
- **SQL Server** (or Azure SQL Database)
- Proper **file path permissions** for `BULK INSERT`
- Local CSV data in correct format and location  
  *(update file paths inside the stored procedure as needed)*

---

## 🚀 Next Steps
After loading the Bronze layer:
- Create **Silver layer** scripts to clean and standardize data.  

---
