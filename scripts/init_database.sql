/*
 Purpose: This script initializes a new SQL Server database named 'DataWarehouse'.
          It performs the following actions:
             1. Drops the existing 'DataWarehouse' database if it already exists.
             2. Recreates the database from scratch.
             3. Sets up three schemas: Bronze, Silver, and Gold — representing
                different stages of the data pipeline (staging, cleansing, and analytics).

 Note:
    The script is destructive. It will:
       - Drop the existing 'DataWarehouse' database (all data will be permanently lost).
       - Recreate a new, empty database.
*/

-- Switch to the 'master' database.
-- "GO" separate batches when working with multiple SQL statements.
USE master;
GO

-- 1. Drop and Recreate the 'DataWarehouse' Database (if exists)
-- Permanently delete the existing database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE; 
    DROP DATABASE DataWarehouse;  
END;
GO

-- 2. Create a new 'DataWarehouse' database to store all project schemas and objects.
CREATE DATABASE DataWarehouse;
GO

-- Switch context to the newly created database
USE DataWarehouse;
GO

-- 3. Create Layered Schemas for Data Organization
-- Bronze Layer (Raw or ingested data directly from source systems).
CREATE SCHEMA bronze;
GO

-- Silver Layer (Cleaned, standardized, and validated data for downstream use).
CREATE SCHEMA silver;
GO

-- Gold Layer (Curated, analytics-ready, and aggregated data for reporting and BI).
CREATE SCHEMA gold;
GO
