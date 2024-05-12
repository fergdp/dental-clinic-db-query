-- Drop database if exists to avoid errors
DROP DATABASE IF EXISTS dental_clinic;

-- Create database
CREATE DATABASE dental_clinic;

-- Use the database
USE dental_clinic;

-- Create Roles table
CREATE TABLE role (
  role_id INT PRIMARY KEY AUTO_INCREMENT,
  role_name VARCHAR(50) NOT NULL
);

-- Add Users table
CREATE TABLE user (
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(50) NOT NULL,
  password VARCHAR(255) NOT NULL, -- Password should be stored hashed
  email VARCHAR(100),
  role_id INT,
  is_enabled TINYINT DEFAULT 1, -- Use a boolean for enabled status
  FOREIGN KEY (role_id) REFERENCES role(role_id)
);

-- Create Patients table
CREATE TABLE patient (
  patient_id INT PRIMARY KEY AUTO_INCREMENT,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  date_of_birth DATE,
  address VARCHAR(100),
  phone VARCHAR(20),
  email VARCHAR(50),
  gender ENUM('male', 'female', 'other')
);

-- Create Health Insurance Plans table
CREATE TABLE health_insurance (
  insurance_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  plan_name VARCHAR(50),
  details TEXT
);

-- Create Procedures table (Treatment is a more generic term)
CREATE TABLE procedure (
  procedure_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  description TEXT,
  cost DECIMAL(10, 2)
);

-- Create Tooth table
CREATE TABLE tooth (
  tooth_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  location VARCHAR(20) -- Position can be ambiguous
);

-- Create Appointments table
CREATE TABLE appointment (
  appointment_id INT PRIMARY KEY AUTO_INCREMENT,
  patient_id INT,
  date_time DATETIME NOT NULL,
  notes TEXT, -- Observations is more descriptive
  status ENUM('pending', 'confirmed', 'cancelled'),
  FOREIGN KEY (patient_id) REFERENCES patient(patient_id)
);

-- Create Procedures Per Patient table
CREATE TABLE procedure_per_patient (
  procedure_per_patient_id INT PRIMARY KEY AUTO_INCREMENT,
  patient_id INT,
  procedure_id INT,
  start_date DATE,
  end_date DATE,
  FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
  FOREIGN KEY (procedure_id) REFERENCES procedure(procedure_id)
);

-- Create Restorations Per Tooth table (Repair is a broader term)
CREATE TABLE restoration_per_tooth (
  restoration_per_tooth_id INT PRIMARY KEY AUTO_INCREMENT,
  patient_id INT,
  tooth_id INT,
  description TEXT,
  date DATE,
  FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
  FOREIGN KEY (tooth_id) REFERENCES tooth(tooth_id)
);

-- Associate patients with health insurance plans
CREATE TABLE patient_insurance (
  patient_id INT,
  insurance_id INT,
  membership_number VARCHAR(20),
  PRIMARY KEY (patient_id, insurance_id),
  FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
  FOREIGN KEY (insurance_id) REFERENCES health_insurance(insurance_id)
);

-- Add Sessions table for user management
CREATE TABLE user_session (
  session_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  token VARCHAR(255) NOT NULL,
  start_date DATETIME NOT NULL,
  expiry_date DATETIME NOT NULL,
  FOREIGN KEY (user_id) REFERENCES user(user_id)
);

-- Add Audit Log table (ChangesHistory is less descriptive)
CREATE TABLE audit_log (
  log_id INT PRIMARY KEY AUTO_INCREMENT,
  table_name VARCHAR(50) NOT NULL,
  record_id INT,
  user_id INT,
  change_date DATETIME NOT NULL,
  details TEXT,
  FOREIGN KEY (user_id) REFERENCES user(user_id)
);

-- Add Invoice and Payment tables
CREATE TABLE invoice (
  invoice_id INT PRIMARY KEY AUTO_INCREMENT,
  patient_id INT,
  issue_date DATE NOT NULL,
  total_amount DECIMAL(10, 2) NOT NULL,
  status ENUM('pending', 'paid') DEFAULT 'pending',
  FOREIGN KEY (patient_id) REFERENCES patient(patient_id)
);

CREATE TABLE payment (
  payment_id INT PRIMARY KEY AUTO_INCREMENT,
  invoice_id INT,
  amount DECIMAL(10, 2) NOT NULL,
  payment_date DATE NOT NULL,
  payment_method VARCHAR(50),
  FOREIGN KEY (invoice_id) REFERENCES invoice(invoice_id)
);

-- Add Reminders table
CREATE TABLE reminder (
  reminder_id INT PRIMARY KEY AUTO_INCREMENT,
  patient_id INT,
  date_time DATETIME NOT NULL,
  message TEXT,
  status ENUM('pending', 'completed') DEFAULT 'pending',
  FOREIGN KEY (patient_id) REFERENCES patient(patient_id)
);

-- Add Custom Forms table
CREATE TABLE form (
  form_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  description TEXT,
  fields TEXT -- Design how to store form fields as per your needs
);

CREATE TABLE form_response (
  response_id INT PRIMARY KEY AUTO_INCREMENT,
  patient_id INT,
  form_id INT,
  responses TEXT,
  response_date DATE,
  FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
  FOREIGN KEY (form_id) REFERENCES form(form_id)
);

-- Add Patient Portal table
CREATE TABLE patient_portal (
  portal_id INT PRIMARY KEY AUTO_INCREMENT,
  patient_id INT,
  user_id INT,
  registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
  FOREIGN KEY (user_id) REFERENCES user(user_id)
);

-- Create Permissions table
CREATE TABLE permission (
  permission_id INT PRIMARY KEY AUTO_INCREMENT,
  permission_name VARCHAR(50) NOT NULL
);

-- Create roles per user table
CREATE TABLE user_role (
  user_id INT,
  role_id INT,
  PRIMARY KEY (user_id, role_id),
  FOREIGN KEY (user_id) REFERENCES user(user_id),
  FOREIGN KEY (role_id) REFERENCES role(role_id)
);

-- Create permissions per role table
CREATE TABLE permission_per_role (
  role_id INT,
  permission_id INT,
  PRIMARY KEY (role_id, permission_id),
  FOREIGN KEY (role_id) REFERENCES role(role_id),
  FOREIGN KEY (permission_id) REFERENCES permission(permission_id)
);