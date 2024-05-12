-- Drop database if exists to avoid errors
DROP DATABASE IF EXISTS dental_clinic;  -- Use dental_clinic for a more generic name

-- Create database
CREATE DATABASE dental_clinic;

-- Use the database
USE dental_clinic;

-- Create Roles table
CREATE TABLE Roles (
  role_id INT PRIMARY KEY AUTO_INCREMENT,
  role_name VARCHAR(50) NOT NULL UNIQUE -- Enforce unique role names
);

-- Create Users table
CREATE TABLE Users (
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(50) NOT NULL UNIQUE, -- Enforce unique usernames
  password_hash VARCHAR(255) NOT NULL, -- Store password securely using a hash function
  email VARCHAR(100) UNIQUE, -- Enforce unique email addresses
  role_id INT NOT NULL,
  is_enabled TINYINT(1) NOT NULL DEFAULT 1, -- Use a more descriptive column name
  FOREIGN KEY (role_id) REFERENCES Roles(role_id)
);

-- Create Patients table
CREATE TABLE Patients (
  patient_id INT PRIMARY KEY AUTO_INCREMENT,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  date_of_birth DATE NOT NULL,
  address VARCHAR(100),
  phone_number VARCHAR(20),
  email VARCHAR(50) UNIQUE, -- Enforce unique email addresses
  gender ENUM('Male', 'Female', 'Other')
);

-- Create Health Insurance Providers table (changed name for clarity)
CREATE TABLE Health_Insurance_Providers (
  provider_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  plan_name VARCHAR(50),
  details TEXT
);

-- Create Treatments table
CREATE TABLE Treatments (
  treatment_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  description TEXT,
  cost DECIMAL(10, 2) NOT NULL
);

-- Create Teeth table
CREATE TABLE Teeth (
  tooth_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  position VARCHAR(20)
);

-- Create Appointments table
CREATE TABLE Appointments (
  appointment_id INT PRIMARY KEY AUTO_INCREMENT,
  patient_id INT NOT NULL,
  date_time DATETIME NOT NULL,
  observations TEXT,
  status ENUM('Pending', 'Confirmed', 'Cancelled'),
  FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

-- Create Treatment Plans table (changed name for clarity)
CREATE TABLE Treatment_Plans (
  plan_id INT PRIMARY KEY AUTO_INCREMENT,
  patient_id INT NOT NULL,
  treatment_id INT NOT NULL,
  start_date DATE,
  end_date DATE,
  FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
  FOREIGN KEY (treatment_id) REFERENCES Treatments(treatment_id)
);

-- Create Procedures Per Tooth table (changed name for clarity)
CREATE TABLE Procedures_Per_Tooth (
  procedure_id INT PRIMARY KEY AUTO_INCREMENT,
  patient_id INT NOT NULL,
  tooth_id INT NOT NULL,
  description TEXT,
  procedure_date DATE,
  FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
  FOREIGN KEY (tooth_id) REFERENCES Teeth(tooth_id)
);

-- Associate patients with health insurance providers
CREATE TABLE Patient_Insurance (
  patient_id INT NOT NULL,
  provider_id INT NOT NULL,
  membership_number VARCHAR(20),
  PRIMARY KEY (patient_id, provider_id),
  FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
  FOREIGN KEY (provider_id) REFERENCES Health_Insurance_Providers(provider_id)
);

-- Add Sessions table for user management
CREATE TABLE Sessions (
  session_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  token VARCHAR(255) NOT NULL,
  start_date DATETIME NOT NULL,
  expiry_date DATETIME NOT NULL,
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Add Audit Log table (changed name for clarity)
CREATE TABLE Audit_Log (
  log_id INT PRIMARY KEY AUTO_INCREMENT,
  table_name VARCHAR(50) NOT NULL,
