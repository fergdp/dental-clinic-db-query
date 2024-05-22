-- Use the database
USE dental_clinic_db;

-- Insert roles into the Roles table
INSERT INTO Roles (role_name)
VALUES ('admin'), ('receptionist'), ('dentist'), ('dentist_assistant'), ('patient'), ('user');

INSERT INTO users (username, password_hash, email, is_enabled) VALUES ('admin', 'unpass', 'admin@example.com', true);

-- Obtener el ID del usuario y el ID del rol
SET @userId = (SELECT user_id FROM users WHERE username = 'admin');
SET @roleId = (SELECT role_id FROM roles WHERE role_name = 'ROLE_ADMINISTRATOR');

INSERT INTO users_roles (user_id, role_id) VALUES (@userId, @roleId);


INSERT INTO users (username, password_hash, email, is_enabled)
VALUES ('admin', 'unpass', 'admin@example.com', 1);
