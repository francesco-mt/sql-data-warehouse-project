sql-- ============================================
-- Master Execution Script
-- Run this file to build the full warehouse
-- ============================================

-- Step 1: Initialize database
:r init_database.sql

-- Step 2: Bronze Layer
:r bronze/bronze_ddl.sql
:r bronze/bronze_load_procedure.sql

-- Step 3: Silver Layer
:r silver/silver_ddl.sql
:r silver/silver_load_procedure.sql
:r silver/silver_data_quality_checks.sql

-- Step 4: Gold Layer
:r gold/gold_ddl.sql
:r gold/gold_quality_checks.sql
