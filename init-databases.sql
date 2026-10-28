-- EShoppingZone Complete Database Initialization & Updated Schema Script
-- Creates databases and initializes current schemas for Storefront & Microservices

CREATE DATABASE IF NOT EXISTS eshoppingzone_db;
CREATE DATABASE IF NOT EXISTS auth_db;
CREATE DATABASE IF NOT EXISTS profile_db;
CREATE DATABASE IF NOT EXISTS product_db;
CREATE DATABASE IF NOT EXISTS cart_db;
CREATE DATABASE IF NOT EXISTS order_db;
CREATE DATABASE IF NOT EXISTS inventory_db;
CREATE DATABASE IF NOT EXISTS payment_db;
CREATE DATABASE IF NOT EXISTS wallet_db;
CREATE DATABASE IF NOT EXISTS notification_db;

GRANT ALL PRIVILEGES ON *.* TO 'eshopping'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;

-- ==========================================================
-- Storefront Database: eshoppingzone_db
-- ==========================================================
USE eshoppingzone_db;

-- 1. App Users (Updated Profile Details)
CREATE TABLE IF NOT EXISTS app_users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(50),
    about TEXT,
    date_of_birth DATE,
    gender VARCHAR(50),
    house_number VARCHAR(255),
    street_name VARCHAR(255),
    colony_name VARCHAR(255),
    city VARCHAR(255),
    state VARCHAR(255),
    pincode VARCHAR(50),
    business_name VARCHAR(255),
    gst_number VARCHAR(100),
    role VARCHAR(50) DEFAULT 'CUSTOMER',
    status VARCHAR(50) DEFAULT 'ACTIVE',
    blocked BOOLEAN DEFAULT FALSE,
    wallet_balance DECIMAL(12,2) DEFAULT 0.00,
    delivery_zone VARCHAR(100) DEFAULT 'Central / Downtown',
    available_for_delivery BOOLEAN DEFAULT TRUE,
    availability_status VARCHAR(50) DEFAULT 'AVAILABLE',
    vehicle_type VARCHAR(100),
    vehicle_number VARCHAR(100),
    driving_license_number VARCHAR(100),
    document_url VARCHAR(1000),
    image VARCHAR(1000),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Clean old profile data and insert fresh updated values
DELETE FROM app_users;

INSERT INTO app_users (
    full_name, email, password, role, status, phone, about, gender, date_of_birth,
    house_number, street_name, colony_name, city, state, pincode,
    business_name, gst_number, wallet_balance, delivery_zone, available_for_delivery,
    availability_status, vehicle_type, vehicle_number, driving_license_number
) VALUES 
('Platform Administrator', 'admin@eshoppingzone.com', 'admin123', 'ADMIN', 'ACTIVE', '+91 98111 22233', 'Global Platform Administrator overseeing marketplace operations, catalogs, compliance, and user security.', 'Male', '1988-05-15', 'Suite #501, Level 5', 'Tech Park Central Blvd', 'Electronic City Phase 1', 'Bengaluru', 'Karnataka', '560100', NULL, NULL, 50000.00, 'Central / Downtown', FALSE, 'AVAILABLE', NULL, NULL, NULL),
('Rajesh Sharma', 'merchant@eshoppingzone.com', 'merchant123', 'MERCHANT', 'APPROVED', '+91 98222 33344', 'Authorized electronic and lifestyle gadgets distributor offering guaranteed manufacturer warranty.', 'Male', '1985-11-20', 'Shop #12, Commercial Hub', 'Brigade Road', 'Ashok Nagar', 'Bengaluru', 'Karnataka', '560025', 'Apex Retail Mart', '29AABCU9603R1ZM', 15000.00, 'Central / Downtown', FALSE, 'AVAILABLE', NULL, NULL, NULL),
('Aarti Verma', 'artisan@eshoppingzone.com', 'artisan123', 'MERCHANT', 'APPROVED', '+91 98333 44455', 'Curated organic personal care, artisanal daily wear, and eco-friendly sustainable lifestyle goods.', 'Female', '1992-03-10', 'Plot #45, Design Studio', 'Koramangala 4th Block', 'ST Bed Layout', 'Bengaluru', 'Karnataka', '560034', 'Urban Craft & Essentials', '27AAACA1234Q1Z5', 8500.00, 'Central / Downtown', FALSE, 'AVAILABLE', NULL, NULL, NULL),
('Ravi Kumar', 'delivery1@eshoppingzone.com', 'delivery123', 'DELIVERY_PARTNER', 'ACTIVE', '+91 98444 55566', 'Experienced delivery executive specializing in express urban delivery and route optimization.', 'Male', '1996-07-24', '#88, 2nd Cross', 'Malleswaram Main Rd', 'Malleswaram', 'Bengaluru', 'Karnataka', '560003', NULL, NULL, 1200.00, 'Central / Downtown', TRUE, 'AVAILABLE', 'Two Wheeler / Bike', 'KA-05-ES-1234', 'DL-2021-0098765'),
('Priya Singh', 'delivery2@eshoppingzone.com', 'delivery123', 'DELIVERY_PARTNER', 'ACTIVE', '+91 98555 66677', 'Certified green delivery partner operating high-efficiency electric two-wheelers.', 'Female', '1998-09-18', '#14, Sunrise Apartments', 'Hebbal Ring Road', 'Ganga Nagar', 'Bengaluru', 'Karnataka', '560024', NULL, NULL, 1500.00, 'North Zone', TRUE, 'AVAILABLE', 'Electric Scooter / EV', 'KA-04-EV-5678', 'DL-2022-0045678'),
('Arjun Verma', 'delivery3@eshoppingzone.com', 'delivery123', 'DELIVERY_PARTNER', 'ACTIVE', '+91 98666 77788', 'Heavy cargo and parcel carrier with clean driving safety record.', 'Male', '1994-01-12', '#203, Green Meadows', 'Bannerghatta Main Rd', 'J.P. Nagar 7th Phase', 'Bengaluru', 'Karnataka', '560078', NULL, NULL, 800.00, 'South Zone', FALSE, 'OFFLINE', 'Light Cargo Van', 'KA-01-CV-9988', 'DL-2019-0012345'),
('Ramesh Kumar', 'user@eshoppingzone.com', 'user123', 'CUSTOMER', 'ACTIVE', '+91 98777 88899', 'Frequent online shopper enthusiastic about tech gadgets, books, and sustainable lifestyle essentials.', 'Male', '1997-08-14', 'Flat #4B, Rosewood Towers', '100 Feet Road', 'Indiranagar', 'Bengaluru', 'Karnataka', '560038', NULL, NULL, 2500.00, 'Central / Downtown', FALSE, 'AVAILABLE', NULL, NULL, NULL);
