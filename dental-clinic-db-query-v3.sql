-- Drop database if exists to avoid errors
DROP DATABASE IF EXISTS dental_clinic_db_v3;

-- Create database
CREATE DATABASE dental_clinic_db_v3;

-- Use the database
USE dental_clinic_db_v3;

-- Create clinics table
CREATE TABLE clinics (
    clinic_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    clinic_name VARCHAR(100) NOT NULL,
    owner_user_id BIGINT UNIQUE, -- The ID of the user who is owner/admin of the clinic
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create roles table
CREATE TABLE roles (
    role_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    role_name VARCHAR(50) NOT NULL UNIQUE
);

-- Create users table
CREATE TABLE users (
    user_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    clinic_id BIGINT NOT NULL,
    username VARCHAR(50) NOT NULL,
    password_hash VARCHAR(60) NOT NULL, -- bcrypt hashes are typically 60 characters long
    email VARCHAR(100),
    is_enabled TINYINT DEFAULT 1,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE,
    street VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50),
    postal_code VARCHAR(6),
    phone VARCHAR(20),
    gender ENUM('MALE', 'FEMALE', 'OTHER'),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT CHK_gender CHECK (gender IN ('MALE', 'FEMALE', 'OTHER')),
    FOREIGN KEY (clinic_id) REFERENCES clinics(clinic_id),
    UNIQUE (clinic_id, username),
    UNIQUE (clinic_id, email)
);

-- Create users_roles table with composite key
CREATE TABLE users_roles (
    user_id BIGINT NOT NULL,
    role_id BIGINT NOT NULL,
    PRIMARY KEY (user_id, role_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (role_id) REFERENCES roles(role_id) ON DELETE CASCADE
);

-- Create health_insurances table
CREATE TABLE health_insurances (
    health_insurance_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    clinic_id BIGINT NOT NULL,
    name VARCHAR(50) NOT NULL,
    plan VARCHAR(50),
    details TEXT,
    FOREIGN KEY (clinic_id) REFERENCES clinics(clinic_id)
);

-- Associate users (patients) with health insurances
CREATE TABLE user_health_insurances (
    user_id BIGINT,
    health_insurance_id BIGINT,
    membership_number VARCHAR(20),
    clinic_id BIGINT NOT NULL,
    PRIMARY KEY (user_id, health_insurance_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (health_insurance_id) REFERENCES health_insurances(health_insurance_id),
    FOREIGN KEY (clinic_id) REFERENCES clinics(clinic_id),
    CONSTRAINT UC_membership_number UNIQUE (clinic_id, membership_number)
);

-- Create treatments table
CREATE TABLE treatments (
    treatment_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    clinic_id BIGINT NOT NULL,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(255),
    cost DECIMAL(10, 2),
    CONSTRAINT CHK_cost CHECK (cost >= 0),
    FOREIGN KEY (clinic_id) REFERENCES clinics(clinic_id)
);

-- Create teeth table
CREATE TABLE teeth (
    tooth_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    position VARCHAR(20)
);

-- Create appointments table
CREATE TABLE appointments (
    appointment_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT,
    clinic_id BIGINT NOT NULL,
    date_time DATETIME NOT NULL,
    timezone VARCHAR(50) DEFAULT 'UTC', -- Assuming UTC as default, adjust as needed
    observations TEXT,
    status ENUM('pending', 'confirmed', 'cancelled'),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (clinic_id) REFERENCES clinics(clinic_id)
);

-- Create treatments_user table
CREATE TABLE treatments_user (
    treatment_user_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT,
    treatment_id BIGINT,
    clinic_id BIGINT NOT NULL,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (treatment_id) REFERENCES treatments(treatment_id),
    FOREIGN KEY (clinic_id) REFERENCES clinics(clinic_id),
    CONSTRAINT CHK_date_range CHECK (start_date < end_date)
);

-- Create repairs_tooth table
CREATE TABLE repairs_tooth (
    repair_tooth_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT,
    tooth_id BIGINT,
    clinic_id BIGINT NOT NULL,
    description TEXT,
    repair_date DATE,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (tooth_id) REFERENCES teeth(tooth_id),
    FOREIGN KEY (clinic_id) REFERENCES clinics(clinic_id)
);

-- Add sessions table for user management
CREATE TABLE sessions (
    session_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT,
    clinic_id BIGINT NOT NULL,
    token VARCHAR(255) NOT NULL,
    start_time DATETIME NOT NULL,
    end_time DATETIME NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (clinic_id) REFERENCES clinics(clinic_id)
);

-- Add changes history table
CREATE TABLE changes_history (
    change_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    affected_table_name VARCHAR(50) NOT NULL,
    record_id BIGINT,
    user_id BIGINT,
    clinic_id BIGINT NOT NULL,
    change_date_time DATETIME NOT NULL,
    details TEXT,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (clinic_id) REFERENCES clinics(clinic_id)
);

-- Add billing and payments tables
CREATE TABLE invoices (
    invoice_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT,
    clinic_id BIGINT NOT NULL,
    issue_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    status ENUM('pending', 'paid') DEFAULT 'pending',
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (clinic_id) REFERENCES clinics(clinic_id)
);

CREATE TABLE payments (
    payment_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    invoice_id BIGINT,
    clinic_id BIGINT NOT NULL,
    amount DECIMAL(10, 2) NOT NULL CHECK (amount > 0),
    payment_date DATE NOT NULL,
    payment_method VARCHAR(50),
    FOREIGN KEY (invoice_id) REFERENCES invoices(invoice_id),
    FOREIGN KEY (clinic_id) REFERENCES clinics(clinic_id)
);

-- Add agenda and reminders table
CREATE TABLE reminders (
    reminder_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT,
    clinic_id BIGINT NOT NULL,
    reminder_date_time DATETIME NOT NULL,
    timezone VARCHAR(50) DEFAULT 'UTC', -- Assuming UTC as default, adjust as needed
    message TEXT,
    status ENUM('pending', 'completed') DEFAULT 'pending',
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (clinic_id) REFERENCES clinics(clinic_id)
);

-- Add custom forms table
CREATE TABLE forms (
    form_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    clinic_id BIGINT NOT NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    fields TEXT, -- Design how to store form fields as per your needs
    FOREIGN KEY (clinic_id) REFERENCES clinics(clinic_id)
);

CREATE TABLE form_responses (
    response_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT,
    form_id BIGINT,
    clinic_id BIGINT NOT NULL,
    responses TEXT,
    response_date DATE,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (form_id) REFERENCES forms(form_id),
    FOREIGN KEY (clinic_id) REFERENCES clinics(clinic_id)
);

-- Add user portal table
CREATE TABLE user_portal (
    portal_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT,
    clinic_id BIGINT NOT NULL,
    registration_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (clinic_id) REFERENCES clinics(clinic_id)
);

-- Create permissions table
CREATE TABLE permissions (
    permission_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    permission_name VARCHAR(50) NOT NULL
);

-- Create permissions_roles table
CREATE TABLE permissions_roles (
    role_id BIGINT,
    permission_id BIGINT,
    PRIMARY KEY (role_id, permission_id),
    FOREIGN KEY (role_id) REFERENCES roles(role_id),
    FOREIGN KEY (permission_id) REFERENCES permissions(permission_id)
);

-- Create indices to improve query performance
CREATE INDEX idx_user_email ON users(email);
CREATE INDEX idx_user_phone ON users(phone);
CREATE INDEX idx_appointment_datetime ON appointments(date_time);
CREATE INDEX idx_invoice_date ON invoices(issue_date);
