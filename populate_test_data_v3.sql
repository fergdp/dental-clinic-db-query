USE dental_clinic_db_v3;

-- Insert roles if they don't exist
INSERT IGNORE INTO roles (role_name)
VALUES ('ROLE_ADMIN'), ('ROLE_RECEPTIONIST'), ('ROLE_DENTIST'), ('ROLE_DENTIST_ASSISTANT'), ('ROLE_PATIENT'), ('ROLE_USER');

-- Create Clinics
INSERT INTO clinics (clinic_name) VALUES ('Analia Baigorria Clinic');
SET @analia_clinic_id = LAST_INSERT_ID();

INSERT INTO clinics (clinic_name) VALUES ('Juan Perez Clinic');
SET @juan_clinic_id = LAST_INSERT_ID();

-- Users for Analia Baigorria Clinic
-- Admin User
INSERT INTO users (username, password_hash, email, first_name, last_name, date_of_birth, street, city, state, postal_code, country, phone, gender, is_enabled, clinic_id)
VALUES ('analia_admin', 'admin123', 'analia.admin@example.com', 'Analia', 'Baigorria', '1980-01-01', 'Main St 1', 'Cordoba', 'Cordoba', '5000', 'Argentina', '351-111-1111', 'FEMALE', 1, @analia_clinic_id);
SET @analia_admin_user_id = LAST_INSERT_ID();

-- Dentist User
INSERT INTO users (username, password_hash, email, first_name, last_name, date_of_birth, street, city, state, postal_code, country, phone, gender, is_enabled, clinic_id)
VALUES ('analia_dentist', 'dentist123', 'analia.dentist@example.com', 'Analia', 'Dentist', '1982-02-02', 'Main St 2', 'Cordoba', 'Cordoba', '5000', 'Argentina', '351-222-2222', 'FEMALE', 1, @analia_clinic_id);
SET @analia_dentist_user_id = LAST_INSERT_ID();

-- 10 Patients for Analia Baigorria Clinic with more realistic names and concatenated usernames
INSERT INTO users (username, password_hash, email, first_name, last_name, date_of_birth, street, city, state, postal_code, country, phone, gender, is_enabled, clinic_id) VALUES
('sofiagarcia', 'patient123', 'sofia.garcia@example.com', 'Sofía', 'García', '1990-01-01', 'Street 1', 'Cordoba', 'Cordoba', '5000', 'Argentina', '351-300-0001', 'FEMALE', 1, @analia_clinic_id),
('mateorodriguez', 'patient123', 'mateo.rodriguez@example.com', 'Mateo', 'Rodríguez', '1991-02-02', 'Street 2', 'Cordoba', 'Cordoba', '5000', 'Argentina', '351-300-0002', 'MALE', 1, @analia_clinic_id),
('valentinamartinez', 'patient123', 'valentina.martinez@example.com', 'Valentina', 'Martínez', '1992-03-03', 'Street 3', 'Cordoba', 'Cordoba', '5000', 'Argentina', '351-300-0003', 'FEMALE', 1, @analia_clinic_id),
('lucashernandez', 'patient123', 'lucas.hernandez@example.com', 'Lucas', 'Hernández', '1993-04-04', 'Street 4', 'Cordoba', 'Cordoba', '5000', 'Argentina', '351-300-0004', 'MALE', 1, @analia_clinic_id),
('isabellalopez', 'patient123', 'isabella.lopez@example.com', 'Isabella', 'López', '1994-05-05', 'Street 5', 'Cordoba', 'Cordoba', '5000', 'Argentina', '351-300-0005', 'FEMALE', 1, @analia_clinic_id),
('santiagogonzalez', 'patient123', 'santiago.gonzalez@example.com', 'Santiago', 'González', '1995-06-06', 'Street 6', 'Cordoba', 'Cordoba', '5000', 'Argentina', '351-300-0006', 'MALE', 1, @analia_clinic_id),
('camilaperez', 'patient123', 'camila.perez@example.com', 'Camila', 'Pérez', '1996-07-07', 'Street 7', 'Cordoba', 'Cordoba', '5000', 'Argentina', '351-300-0007', 'FEMALE', 1, @analia_clinic_id),
('sebastianasanchez', 'patient123', 'sebastian.sanchez@example.com', 'Sebastián', 'Sánchez', '1997-08-08', 'Street 8', 'Cordoba', 'Cordoba', '5000', 'Argentina', '351-300-0008', 'MALE', 1, @analia_clinic_id),
('valeriaramirez', 'patient123', 'valeria.ramirez@example.com', 'Valeria', 'Ramírez', '1998-09-09', 'Street 9', 'Cordoba', 'Cordoba', '5000', 'Argentina', '351-300-0009', 'FEMALE', 1, @analia_clinic_id),
('nicolastorres', 'patient123', 'nicolas.torres@example.com', 'Nicolás', 'Torres', '1999-10-10', 'Street 10', 'Cordoba', 'Cordoba', '5000', 'Argentina', '351-300-0010', 'MALE', 1, @analia_clinic_id);

-- Users for Juan Perez Clinic
-- Admin User
INSERT INTO users (username, password_hash, email, first_name, last_name, date_of_birth, street, city, state, postal_code, country, phone, gender, is_enabled, clinic_id)
VALUES ('juan_admin', 'admin123', 'juan.admin@example.com', 'Juan', 'Perez', '1975-03-03', 'Av. Central 10', 'Buenos Aires', 'Buenos Aires', '1000', 'Argentina', '11-333-3333', 'MALE', 1, @juan_clinic_id);
SET @juan_admin_user_id = LAST_INSERT_ID();

-- Dentist User
INSERT INTO users (username, password_hash, email, first_name, last_name, date_of_birth, street, city, state, postal_code, country, phone, gender, is_enabled, clinic_id)
VALUES ('juan_dentist', 'dentist123', 'juan.dentist@example.com', 'Juan', 'Dentist', '1977-04-04', 'Av. Central 11', 'Buenos Aires', 'Buenos Aires', '1000', 'Argentina', '11-444-4444', 'MALE', 1, @juan_clinic_id);
SET @juan_dentist_user_id = LAST_INSERT_ID();

-- 10 Patients for Juan Perez Clinic with more realistic names and concatenated usernames
INSERT INTO users (username, password_hash, email, first_name, last_name, date_of_birth, street, city, state, postal_code, country, phone, gender, is_enabled, clinic_id) VALUES
('danieladiaz', 'patient123', 'daniela.diaz@example.com', 'Daniela', 'Díaz', '1990-11-11', 'Road 1', 'Buenos Aires', 'Buenos Aires', '1000', 'Argentina', '11-500-0001', 'FEMALE', 1, @juan_clinic_id),
('alejandroruiz', 'patient123', 'alejandro.ruiz@example.com', 'Alejandro', 'Ruiz', '1991-12-12', 'Road 2', 'Buenos Aires', 'Buenos Aires', '1000', 'Argentina', '11-500-0002', 'MALE', 1, @juan_clinic_id),
('gabrielagomez', 'patient123', 'gabriela.gomez@example.com', 'Gabriela', 'Gómez', '1992-01-01', 'Road 3', 'Buenos Aires', 'Buenos Aires', '1000', 'Argentina', '11-500-0003', 'FEMALE', 1, @juan_clinic_id),
('manuelflores', 'patient123', 'manuel.flores@example.com', 'Manuel', 'Flores', '1993-02-02', 'Road 4', 'Buenos Aires', 'Buenos Aires', '1000', 'Argentina', '11-500-0004', 'MALE', 1, @juan_clinic_id),
('andreabenitez', 'patient123', 'andrea.benitez@example.com', 'Andrea', 'Benítez', '1994-03-03', 'Road 5', 'Buenos Aires', 'Buenos Aires', '1000', 'Argentina', '11-500-0005', 'FEMALE', 1, @juan_clinic_id),
('ricardoacosta', 'patient123', 'ricardo.acosta@example.com', 'Ricardo', 'Acosta', '1995-04-04', 'Road 6', 'Buenos Aires', 'Buenos Aires', '1000', 'Argentina', '11-500-0006', 'MALE', 1, @juan_clinic_id),
('paulaherrera', 'patient123', 'paula.herrera@example.com', 'Paula', 'Herrera', '1996-05-05', 'Road 7', 'Buenos Aires', 'Buenos Aires', '1000', 'Argentina', '11-500-0007', 'FEMALE', 1, @juan_clinic_id),
('federicomoreno', 'patient123', 'federico.moreno@example.com', 'Federico', 'Moreno', '1997-06-06', 'Road 8', 'Buenos Aires', 'Buenos Aires', '1000', 'Argentina', '11-500-0008', 'MALE', 1, @juan_clinic_id),
('lauraalvarez', 'patient123', 'laura.alvarez@example.com', 'Laura', 'Alvarez', '1998-07-07', 'Road 9', 'Buenos Aires', 'Buenos Aires', '1000', 'Argentina', '11-500-0009', 'FEMALE', 1, @juan_clinic_id),
('diegoromero', 'patient123', 'diego.romero@example.com', 'Diego', 'Romero', '1999-08-08', 'Road 10', 'Buenos Aires', 'Buenos Aires', '1000', 'Argentina', '11-500-0010', 'MALE', 1, @juan_clinic_id);

-- Assign roles to users
INSERT INTO users_roles (user_id, role_id) VALUES
(@analia_admin_user_id, (SELECT role_id FROM roles WHERE role_name = 'ROLE_ADMIN')),
(@analia_dentist_user_id, (SELECT role_id FROM roles WHERE role_name = 'ROLE_DENTIST')),
((SELECT user_id FROM users WHERE username = 'sofiagarcia' AND clinic_id = @analia_clinic_id), (SELECT role_id FROM roles WHERE role_name = 'ROLE_PATIENT')),
((SELECT user_id FROM users WHERE username = 'mateorodriguez' AND clinic_id = @analia_clinic_id), (SELECT role_id FROM roles WHERE role_name = 'ROLE_PATIENT')),
((SELECT user_id FROM users WHERE username = 'valentinamartinez' AND clinic_id = @analia_clinic_id), (SELECT role_id FROM roles WHERE role_name = 'ROLE_PATIENT')),
((SELECT user_id FROM users WHERE username = 'lucashernandez' AND clinic_id = @analia_clinic_id), (SELECT role_id FROM roles WHERE role_name = 'ROLE_PATIENT')),
((SELECT user_id FROM users WHERE username = 'isabellalopez' AND clinic_id = @analia_clinic_id), (SELECT role_id FROM roles WHERE role_name = 'ROLE_PATIENT')),
((SELECT user_id FROM users WHERE username = 'santiagogonzalez' AND clinic_id = @analia_clinic_id), (SELECT role_id FROM roles WHERE role_name = 'ROLE_PATIENT')),
((SELECT user_id FROM users WHERE username = 'camilaperez' AND clinic_id = @analia_clinic_id), (SELECT role_id FROM roles WHERE role_name = 'ROLE_PATIENT')),
((SELECT user_id FROM users WHERE username = 'sebastianasanchez' AND clinic_id = @analia_clinic_id), (SELECT role_id FROM roles WHERE role_name = 'ROLE_PATIENT')),
((SELECT user_id FROM users WHERE username = 'valeriaramirez' AND clinic_id = @analia_clinic_id), (SELECT role_id FROM roles WHERE role_name = 'ROLE_PATIENT')),
((SELECT user_id FROM users WHERE username = 'nicolastorres' AND clinic_id = @analia_clinic_id), (SELECT role_id FROM roles WHERE role_name = 'ROLE_PATIENT')),

(@juan_admin_user_id, (SELECT role_id FROM roles WHERE role_name = 'ROLE_ADMIN')),
(@juan_dentist_user_id, (SELECT role_id FROM roles WHERE role_name = 'ROLE_DENTIST')),
((SELECT user_id FROM users WHERE username = 'danieladiaz' AND clinic_id = @juan_clinic_id), (SELECT role_id FROM roles WHERE role_name = 'ROLE_PATIENT')),
((SELECT user_id FROM users WHERE username = 'alejandroruiz' AND clinic_id = @juan_clinic_id), (SELECT role_id FROM roles WHERE role_name = 'ROLE_PATIENT')),
((SELECT user_id FROM users WHERE username = 'gabrielagomez' AND clinic_id = @juan_clinic_id), (SELECT role_id FROM roles WHERE role_name = 'ROLE_PATIENT')),
((SELECT user_id FROM users WHERE username = 'manuelflores' AND clinic_id = @juan_clinic_id), (SELECT role_id FROM roles WHERE role_name = 'ROLE_PATIENT')),
((SELECT user_id FROM users WHERE username = 'andreabenitez' AND clinic_id = @juan_clinic_id), (SELECT role_id FROM roles WHERE role_name = 'ROLE_PATIENT')),
((SELECT user_id FROM users WHERE username = 'ricardoacosta' AND clinic_id = @juan_clinic_id), (SELECT role_id FROM roles WHERE role_name = 'ROLE_PATIENT')),
((SELECT user_id FROM users WHERE username = 'paulaherrera' AND clinic_id = @juan_clinic_id), (SELECT role_id FROM roles WHERE role_name = 'ROLE_PATIENT')),
((SELECT user_id FROM users WHERE username = 'federicomoreno' AND clinic_id = @juan_clinic_id), (SELECT role_id FROM roles WHERE role_name = 'ROLE_PATIENT')),
((SELECT user_id FROM users WHERE username = 'lauraalvarez' AND clinic_id = @juan_clinic_id), (SELECT role_id FROM roles WHERE role_name = 'ROLE_PATIENT')),
((SELECT user_id FROM users WHERE username = 'diegoromero' AND clinic_id = @juan_clinic_id), (SELECT role_id FROM roles WHERE role_name = 'ROLE_PATIENT'));
