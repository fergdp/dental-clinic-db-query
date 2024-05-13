-- Drop database if exists to avoid errors
DROP DATABASE IF EXISTS dental_clinic_db;

-- Create database
CREATE DATABASE dental_clinic_db;

-- Use the database
USE dental_clinic_db;

-- Create roles table
CREATE TABLE roles (
    role_id INT PRIMARY KEY AUTO_INCREMENT,
    role_name VARCHAR(50) NOT NULL
);

-- Add users table
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    password_hash VARCHAR(255) NOT NULL, -- Password should be stored hashed
    email VARCHAR(100) UNIQUE,
    role_id INT,
    is_enabled TINYINT DEFAULT 1,
    FOREIGN KEY (role_id) REFERENCES roles(role_id)
);

-- Create patients table
CREATE TABLE patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE,
    address VARCHAR(100),
    phone VARCHAR(20),
    email VARCHAR(50),
    gender ENUM('male', 'female', 'other'),
    CONSTRAINT CHK_gender CHECK (gender IN ('male', 'female', 'other'))
);

-- Create health_insurances table
CREATE TABLE health_insurances (
    health_insurance_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    plan VARCHAR(50),
    details TEXT
);

-- Create treatments table
CREATE TABLE treatments (
    treatment_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(255),
    cost DECIMAL(10, 2),
    CONSTRAINT CHK_cost CHECK (cost >= 0)
);

-- Create teeth table
CREATE TABLE teeth (
    tooth_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    position VARCHAR(20)
);

-- Create appointments table
CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    date_time DATETIME NOT NULL,
    observations TEXT,
    status ENUM('pending', 'confirmed', 'cancelled'),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

-- Create treatments_patient table
CREATE TABLE treatments_patient (
    treatment_patient_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    treatment_id INT,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (treatment_id) REFERENCES treatments(treatment_id),
    CONSTRAINT CHK_date_range CHECK (start_date < end_date)
);

-- Create repairs_tooth table
CREATE TABLE repairs_tooth (
    repair_tooth_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    tooth_id INT,
    description TEXT,
    repair_date DATE,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (tooth_id) REFERENCES teeth(tooth_id)
);

-- Associate patients with health insurances
CREATE TABLE patient_health_insurances (
    patient_id INT,
    health_insurance_id INT,
    membership_number VARCHAR(20),
    PRIMARY KEY (patient_id, health_insurance_id),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (health_insurance_id) REFERENCES health_insurances(health_insurance_id),
    CONSTRAINT UC_membership_number UNIQUE (membership_number)
);

-- Add sessions table for user management
CREATE TABLE sessions (
    session_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    token VARCHAR(255) NOT NULL,
    start_time DATETIME NOT NULL,
    end_time DATETIME NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Add changes history table
CREATE TABLE changes_history (
    change_id INT PRIMARY KEY AUTO_INCREMENT,
    affected_table_name VARCHAR(50) NOT NULL,
    record_id INT,
    user_id INT,
    change_date_time DATETIME NOT NULL,
    details TEXT,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Add billing and payments tables
CREATE TABLE invoices (
    invoice_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    issue_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    status ENUM('pending', 'paid') DEFAULT 'pending',
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    invoice_id INT,
    amount DECIMAL(10, 2) NOT NULL CHECK (amount > 0),
    payment_date DATE NOT NULL,
    payment_method VARCHAR(50),
    FOREIGN KEY (invoice_id) REFERENCES invoices(invoice_id)
);

-- Add agenda and reminders table
CREATE TABLE reminders (
    reminder_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    reminder_date_time DATETIME NOT NULL,
    message TEXT,
    status ENUM('pending', 'completed') DEFAULT 'pending',
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

-- Add custom forms table
CREATE TABLE forms (
    form_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    fields TEXT -- Design how to store form fields as per your needs
);

CREATE TABLE form_responses (
    response_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    form_id INT,
    responses TEXT,
    response_date DATE,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (form_id) REFERENCES forms(form_id)
);

-- Add patient portal table
CREATE TABLE patient_portal (
    portal_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    user_id INT,
    registration_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Create permissions table
CREATE TABLE permissions (
    permission_id INT PRIMARY KEY AUTO_INCREMENT,
    permission_name VARCHAR(50) NOT NULL
);

-- Create roles users table
CREATE TABLE roles_users (
    user_id INT,
    role_id INT,
    PRIMARY KEY (user_id, role_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (role_id) REFERENCES roles(role_id)
);

-- Create permissions roles table
CREATE TABLE permissions_roles (
    role_id INT,
    permission_id INT,
    PRIMARY KEY (role_id, permission_id),
    FOREIGN KEY (role_id) REFERENCES roles(role_id),
    FOREIGN KEY (permission_id) REFERENCES permissions(permission_id)
);
