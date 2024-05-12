-- Drop database if exists to avoid errors
DROP DATABASE IF EXISTS dental_clinic_db;

-- Create database
CREATE DATABASE dental_clinic_db;

-- Use the database
USE dental_clinic_db;

-- Create Roles table
CREATE TABLE Roles (
    RoleID INT PRIMARY KEY AUTO_INCREMENT,
    RoleName VARCHAR(50) NOT NULL
);

-- Add Users table
CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(50) NOT NULL,
    PasswordHash VARCHAR(255) NOT NULL, -- Password should be stored hashed
    Email VARCHAR(100),
    RoleID INT,
    IsEnabled TINYINT DEFAULT 1, -- Adding enabled column with default value 1
    FOREIGN KEY (RoleID) REFERENCES Roles(RoleID)
);

-- Create Patients table
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE,
    Address VARCHAR(100),
    Phone VARCHAR(20),
    Email VARCHAR(50),
    Gender ENUM('Male', 'Female', 'Other')
);

-- Create Health Insurances table
CREATE TABLE HealthInsurances (
    HealthInsuranceID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50) NOT NULL,
    Plan VARCHAR(50),
    Details TEXT
);

-- Create Treatments table
CREATE TABLE Treatments (
    TreatmentID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50) NOT NULL,
    Description TEXT,
    Cost DECIMAL(10, 2)
);

-- Create Teeth table
CREATE TABLE Teeth (
    ToothID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50) NOT NULL,
    Position VARCHAR(20)
);

-- Create Appointments table
CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT,
    DateTime DATETIME NOT NULL,
    Observations TEXT,
    Status ENUM('Pending', 'Confirmed', 'Cancelled'),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

-- Create TreatmentsPerPatient table
CREATE TABLE TreatmentsPerPatient (
    TreatmentPerPatientID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT,
    TreatmentID INT,
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (TreatmentID) REFERENCES Treatments(TreatmentID)
);

-- Create RepairsPerTooth table
CREATE TABLE RepairsPerTooth (
    RepairPerToothID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT,
    ToothID INT,
    Description TEXT,
    RepairDate DATE,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (ToothID) REFERENCES Teeth(ToothID)
);

-- Associate patients with health insurances
CREATE TABLE PatientHealthInsurances (
    PatientID INT,
    HealthInsuranceID INT,
    MembershipNumber VARCHAR(20),
    PRIMARY KEY (PatientID, HealthInsuranceID),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (HealthInsuranceID) REFERENCES HealthInsurances(HealthInsuranceID)
);

-- Add Sessions table for user management
CREATE TABLE Sessions (
    SessionID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    Token VARCHAR(255) NOT NULL,
    StartTime DATETIME NOT NULL,
    EndTime DATETIME NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Add Changes History table
CREATE TABLE ChangesHistory (
    ChangeID INT PRIMARY KEY AUTO_INCREMENT,
    AffectedTableName VARCHAR(50) NOT NULL,
    RecordID INT,
    UserID INT,
    ChangeDateTime DATETIME NOT NULL,
    Details TEXT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Add Billing and Payments tables
CREATE TABLE Invoices (
    InvoiceID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT,
    IssueDate DATE NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    Status ENUM('Pending', 'Paid') DEFAULT 'Pending',
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    InvoiceID INT,
    Amount DECIMAL(10, 2) NOT NULL,
    PaymentDate DATE NOT NULL,
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (InvoiceID) REFERENCES Invoices(InvoiceID)
);

-- Add Agenda and Reminders table
CREATE TABLE Reminders (
    ReminderID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT,
    ReminderDateTime DATETIME NOT NULL,
    Message TEXT,
    Status ENUM('Pending', 'Completed') DEFAULT 'Pending',
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

-- Add Custom Forms table
CREATE TABLE Forms (
    FormID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Description TEXT,
    Fields TEXT -- Design how to store form fields as per your needs
);

CREATE TABLE FormResponses (
    ResponseID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT,
    FormID INT,
    Responses TEXT,
    ResponseDate DATE,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (FormID) REFERENCES Forms(FormID)
);

-- Add Patient Portal table
CREATE TABLE PatientPortal (
    PortalID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT,
    UserID INT,
    RegistrationDateTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Create Permissions table
CREATE TABLE Permissions (
    PermissionID INT PRIMARY KEY AUTO_INCREMENT,
    PermissionName VARCHAR(50) NOT NULL
);

-- Create RolesPerUser table
CREATE TABLE RolesPerUser (
    UserID INT,
    RoleID INT,
    PRIMARY KEY (UserID, RoleID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (RoleID) REFERENCES Roles(RoleID)
);

-- Create PermissionsPerRole table
CREATE TABLE PermissionsPerRole (
    RoleID INT,
    PermissionID INT,
    PRIMARY KEY (RoleID, PermissionID),
    FOREIGN KEY (RoleID) REFERENCES Roles(RoleID),
    FOREIGN KEY (PermissionID) REFERENCES Permissions(PermissionID)
);
