-- Use the database
USE dental_clinic_db;

-- Insert roles into the Roles table
INSERT INTO Roles (role_name)
VALUES ('ROLE_ADMINISTRATOR'), ('ROLE_RECEPTIONIST'), ('ROLE_DENTIST'), ('ROLE_DENTAL_ASSISTANT'), ('ROLE_PATIENT'), ('ROLE_USER');

INSERT INTO users (username, password_hash, email, is_enabled) VALUES ('admin', 'unpass', 'admin@example.com', true);

-- Obtener el ID del usuario y el ID del rol
SET @userId = (SELECT user_id FROM users WHERE username = 'admin');
SET @roleId = (SELECT role_id FROM roles WHERE role_name = 'ROLE_ADMINISTRATOR');

INSERT INTO users_roles (user_id, role_id) VALUES (@userId, @roleId);


INSERT INTO users (username, password_hash, email, is_enabled)
VALUES ('admin', 'unpass', 'admin@example.com', 1);
