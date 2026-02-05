-- ============================
-- Healthcare Claims Analytics
-- Database Schema
-- ============================

-- Patients dimension
CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    age INT,
    gender TEXT,
    address TEXT,
    city TEXT,
    state TEXT,
    zip_code TEXT,
    phone TEXT
);

-- Providers dimension
CREATE TABLE providers (
    provider_id INT PRIMARY KEY,
    provider_name TEXT,
    specialty TEXT,
    city TEXT,
    state TEXT,
    zip_code TEXT,
    phone TEXT
);

-- Claims fact table
CREATE TABLE claims (
    claim_id INT PRIMARY KEY,
    patient_id INT,
    provider_id INT,
    claim_date DATE,
    claim_amount NUMERIC(12,2),
    status TEXT
);

-- Payments fact table
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    claim_id INT,
    payment_date DATE,
    payment_amount NUMERIC(12,2)
);

-- Notes:
-- Foreign key constraints are intentionally omitted
-- to allow flexible ingestion of synthetic data.
-- Referential integrity is enforced at the reporting layer
-- using SQL views.
-- Table schemas for healthcare claims project
