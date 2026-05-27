-- =============================================================================
-- Million Records MySQL Performance Benchmarking System
-- Database & Table Setup Script
-- =============================================================================
-- Run this script once before executing Notebook 02.
-- Usage:  mysql -u root -p < sql/setup.sql
-- =============================================================================

-- Step 1: Create the database
CREATE DATABASE IF NOT EXISTS performance_test
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE performance_test;

-- Step 2: Drop existing table (clean slate for benchmarking)
DROP TABLE IF EXISTS employees;

-- Step 3: Create the employees table
-- Design decisions:
--   • AUTO_INCREMENT primary key  → sequential inserts, no UUID overhead
--   • UNIQUE index on email       → enforces data integrity
--   • INDEX on city, salary       → supports analytical queries post-insert
--   • InnoDB engine               → ACID transactions, row-level locking
--   • utf8mb4 charset             → full Unicode support (emojis, intl names)
CREATE TABLE employees (
    id     INT           NOT NULL AUTO_INCREMENT,
    name   VARCHAR(120)  NOT NULL,
    email  VARCHAR(180)  NOT NULL,
    city   VARCHAR(100)  NOT NULL,
    salary DECIMAL(12,2) NOT NULL,

    PRIMARY KEY (id),
    UNIQUE  KEY uq_email  (email),
    INDEX   idx_city      (city),
    INDEX   idx_salary    (salary)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci
  ROW_FORMAT=DYNAMIC;

-- Step 4: Verify
SHOW TABLES;
DESCRIBE employees;

-- =============================================================================
-- Optional: MySQL tuning for bulk-load performance
-- Apply these ONLY in a development/benchmarking environment.
-- NEVER use innodb_flush_log_at_trx_commit=0 in production.
-- =============================================================================
-- SET GLOBAL innodb_flush_log_at_trx_commit = 2;   -- Reduce fsync overhead
-- SET GLOBAL innodb_buffer_pool_size = 512*1024*1024; -- 512 MB buffer pool
-- SET GLOBAL bulk_insert_buffer_size = 64*1024*1024;  -- 64 MB bulk buffer
-- =============================================================================
