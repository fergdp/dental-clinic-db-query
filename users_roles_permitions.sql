-- Use the database
USE dental_clinic_db;

-- Insert roles into the Roles table
INSERT INTO roles (role_name)
VALUES ('admin'), ('receptionist'), ('dentist'), ('dentist_assistant'), ('patient'), ('user');

INSERT INTO users (username, password_hash, email, is_enabled) VALUES ('admin', 'unpass', 'admin@example.com', true);

-- Obtener el ID del usuario y el ID del rol
SET @userId = (SELECT user_id FROM users WHERE username = 'admin');
SET @roleId = (SELECT role_id FROM roles WHERE role_name = 'ROLE_ADMINISTRATOR');

INSERT INTO users_roles (user_id, role_id) VALUES (@userId, @roleId);


INSERT INTO users (username, password_hash, email, is_enabled)
VALUES ('admin', 'unpass', 'admin@example.com', 1);




-- Use the database
USE dental_clinic_db;

-- Insertar usuarios con contraseñas encriptadas
INSERT INTO users (username, password_hash, email, is_enabled) VALUES 
('fernando', '$2a$10$7Q0aD9gZRhiE1h4IbLTAOOj1v34ezw/NzFQR5BxQe/tdHDgDIf2Iy', 'fernando@dentalclinic.com', 1),
('receptionist_user', '$2a$10$DOWSDTg6z4fQZcZjsh1EaOqQjiZ6I1mP1eXcMQD0/2sJl5/JkH.CG', 'receptionist_user@dentalclinic.com', 1),
('analia', '$2a$10$DOWSDTg6z4fQZcZjsh1EaOqQjiZ6I1mP1eXcMQD0/2sJl5/JkH.CG', 'analia@dentalclinic.com', 1),
('assistant_user', '$2a$10$DOWSDTg6z4fQZcZjsh1EaOqQjiZ6I1mP1eXcMQD0/2sJl5/JkH.CG', 'assistant_user@dentalclinic.com', 1),
('leonardo', '$2a$10$DOWSDTg6z4fQZcZjsh1EaOqQjiZ6I1mP1eXcMQD0/2sJl5/JkH.CG', 'leonardo@dentalclinic.com', 1),
('generic_user', '$2a$10$DOWSDTg6z4fQZcZjsh1EaOqQjiZ6I1mP1eXcMQD0/2sJl5/JkH.CG', 'generic_user@dentalclinic.com', 1);

-- Asignar roles a los usuarios
INSERT INTO users_roles (user_id, role_id) VALUES
((SELECT user_id FROM users WHERE username = 'fernando'), (SELECT role_id FROM roles WHERE role_name = 'admin')),
((SELECT user_id FROM users WHERE username = 'receptionist_user'), (SELECT role_id FROM roles WHERE role_name = 'receptionist')),
((SELECT user_id FROM users WHERE username = 'analia'), (SELECT role_id FROM roles WHERE role_name = 'dentist')),
((SELECT user_id FROM users WHERE username = 'assistant_user'), (SELECT role_id FROM roles WHERE role_name = 'dentist_assistant')),
((SELECT user_id FROM users WHERE username = 'leonardo'), (SELECT role_id FROM roles WHERE role_name = 'patient')),
((SELECT user_id FROM users WHERE username = 'generic_user'), (SELECT role_id FROM roles WHERE role_name = 'user'));

