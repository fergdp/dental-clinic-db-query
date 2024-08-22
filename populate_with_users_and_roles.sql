USE dental_clinic_db_v2;
INSERT INTO roles (role_name)
VALUES ('ROLE_ADMIN'), ('ROLE_RECEPTIONIST'), ('ROLE_DENTIST'), ('ROLE_DENTIST_ASSISTANT'), ('ROLE_PATIENT'), ('ROLE_USER');


USE dental_clinic_db_v2;


-- Usuario específico con contraseña en texto plano
INSERT INTO users (username, password_hash, email, first_name, last_name, date_of_birth, street, city, state, postal_code, country_code, phone, gender, is_enabled)
VALUES 
    ('fergdp', 'admin123', 'admin@example.com', 'Fernando', 'Gomez de Paz', '1985-01-01', '123 Main St', 'Buenos Aires', 'Buenos Aires', '1000', 'AR', '11-1234-5678', 'MALE', 1);

-- Relación con rol de admin
INSERT INTO users_roles (user_id, role_id)
VALUES 
    ((SELECT user_id FROM users WHERE username = 'admin'), (SELECT role_id FROM roles WHERE role_name = 'admin'));

-- Usuarios aleatorios con contraseñas en texto plano y genders en mayúsculas
INSERT INTO users (username, password_hash, email, first_name, last_name, date_of_birth, street, city, state, postal_code, country_code, phone, gender, is_enabled)
VALUES 
    ('user1', 'patient123', 'user1@example.com', 'Juan', 'Pérez', '1990-05-15', 'Calle Falsa 123', 'Córdoba', 'Córdoba', '5000', 'AR', '351-555-1234', 'MALE', 1),
    ('user2', 'patient123', 'user2@example.com', 'María', 'González', '1987-07-20', 'Avenida Siempreviva 742', 'Rosario', 'Santa Fe', '2000', 'AR', '341-555-5678', 'FEMALE', 1),
    ('user3', 'patient123', 'user3@example.com', 'Carlos', 'López', '1978-11-02', 'Av. Corrientes 5500', 'Buenos Aires', 'Buenos Aires', '1000', 'AR', '11-555-6789', 'MALE', 1),
    ('user4', 'patient123', 'user4@example.com', 'Ana', 'Martínez', '1992-09-10', 'Pasaje Colón 450', 'Mendoza', 'Mendoza', '5500', 'AR', '261-555-9876', 'FEMALE', 1),
    ('user5', 'patient123', 'user5@example.com', 'Luis', 'Gutiérrez', '1985-03-23', 'Calle Mitre 800', 'Salta', 'Salta', '4400', 'AR', '387-555-4321', 'MALE', 1),
    ('user6', 'receptionist123', 'user6@example.com', 'Sofía', 'Ramírez', '1993-08-14', 'Calle San Martín 100', 'Tucumán', 'Tucumán', '4000', 'AR', '381-555-6789', 'FEMALE', 1),
    ('user7', 'receptionist123', 'user7@example.com', 'Mauro', 'Díaz', '1982-01-22', 'Calle Rivadavia 456', 'Neuquén', 'Neuquén', '8300', 'AR', '299-555-7890', 'MALE', 1),
    ('user8', 'dentist123', 'user8@example.com', 'Laura', 'Fernández', '1991-02-28', 'Calle Belgrano 200', 'San Juan', 'San Juan', '5400', 'AR', '264-555-5678', 'FEMALE', 1),
    ('user9', 'dentist123', 'user9@example.com', 'Ricardo', 'Sosa', '1980-06-19', 'Av. Libertador 300', 'Santa Fe', 'Santa Fe', '3000', 'AR', '342-555-6789', 'MALE', 1),
    ('user10', 'dentist_assistant123', 'user10@example.com', 'Gisela', 'Ruiz', '1994-11-23', 'Calle Moreno 400', 'La Plata', 'Buenos Aires', '1900', 'AR', '221-555-3456', 'FEMALE', 1),
    ('user11', 'dentist_assistant123', 'user11@example.com', 'Martín', 'Castro', '1989-09-10', 'Calle Mitre 500', 'Mar del Plata', 'Buenos Aires', '7600', 'AR', '223-555-4567', 'MALE', 1),
    ('user12', 'user123', 'user12@example.com', 'Valentina', 'Sánchez', '1983-07-15', 'Calle Italia 600', 'Bariloche', 'Río Negro', '8400', 'AR', '294-555-6789', 'FEMALE', 1),
    ('user13', 'user123', 'user13@example.com', 'Esteban', 'Morales', '1977-04-18', 'Calle Francia 700', 'Bahía Blanca', 'Buenos Aires', '8000', 'AR', '291-555-7890', 'MALE', 1),
    ('user14', 'admin123', 'user14@example.com', 'Patricia', 'Hernández', '1984-12-21', 'Calle Colón 800', 'Corrientes', 'Corrientes', '3400', 'AR', '379-555-6789', 'FEMALE', 1),
    ('user15', 'admin123', 'user15@example.com', 'Santiago', 'Cabrera', '1995-05-09', 'Calle Córdoba 900', 'Resistencia', 'Chaco', '3500', 'AR', '362-555-7890', 'MALE', 1),
    ('user16', 'patient123', 'user16@example.com', 'Noelia', 'Ortiz', '1992-10-30', 'Av. Colón 1000', 'Posadas', 'Misiones', '3300', 'AR', '376-555-5678', 'FEMALE', 1),
    ('user17', 'receptionist123', 'user17@example.com', 'Gustavo', 'Vera', '1988-03-05', 'Calle San Juan 1100', 'Formosa', 'Formosa', '3600', 'AR', '370-555-6789', 'MALE', 1),
    ('user18', 'receptionist123', 'user18@example.com', 'Lucía', 'Ponce', '1996-06-22', 'Av. Belgrano 1200', 'Jujuy', 'Jujuy', '4600', 'AR', '388-555-7890', 'FEMALE', 1),
    ('user19', 'dentist123', 'user19@example.com', 'Hernán', 'Rivas', '1986-02-14', 'Calle Moreno 1300', 'Salta', 'Salta', '4400', 'AR', '387-555-3456', 'MALE', 1),
    ('user20', 'user123', 'user20@example.com', 'Agustina', 'Franco', '1990-09-11', 'Calle San Martín 1400', 'San Luis', 'San Luis', '5700', 'AR', '266-555-4567', 'FEMALE', 1);

-- Relacionar usuarios aleatorios con roles
INSERT INTO users_roles (user_id, role_id)
VALUES 
    ((SELECT user_id FROM users WHERE username = 'user1'), (SELECT role_id FROM roles WHERE role_name = 'patient')),
    ((SELECT user_id FROM users WHERE username = 'user2'), (SELECT role_id FROM roles WHERE role_name = 'patient')),
    ((SELECT user_id FROM users WHERE username = 'user3'), (SELECT role_id FROM roles WHERE role_name = 'patient')),
    ((SELECT user_id FROM users WHERE username = 'user4'), (SELECT role_id FROM roles WHERE role_name = 'patient')),
    ((SELECT user_id FROM users WHERE username = 'user5'), (SELECT role_id FROM roles WHERE role_name = 'patient')),
    ((SELECT user_id FROM users WHERE username = 'user6'), (SELECT role_id FROM roles WHERE role_name = 'receptionist')),
    ((SELECT user_id FROM users WHERE username = 'user7'), (SELECT role_id FROM roles WHERE role_name = 'receptionist')),
    ((SELECT user_id FROM users WHERE username = 'user8'), (SELECT role_id FROM roles WHERE role_name = 'dentist')),
    ((SELECT user_id FROM users WHERE username = 'user9'), (SELECT role_id FROM roles WHERE role_name = 'dentist')),
    ((SELECT user_id FROM users WHERE username = 'user10'), (SELECT role_id FROM roles WHERE role_name = 'dentist_assistant')),
    ((SELECT user_id FROM users WHERE username = 'user11'), (SELECT role_id FROM roles WHERE role_name = 'dentist_assistant')),
    ((SELECT user_id FROM users WHERE username = 'user12'), (SELECT role_id FROM roles WHERE role_name = 'user')),
    ((SELECT user_id FROM users WHERE username = 'user13'), (SELECT role_id FROM roles WHERE role_name = 'user')),
    ((SELECT user_id FROM users WHERE username = 'user14'), (SELECT role_id FROM roles WHERE role_name = 'admin')),
    ((SELECT user_id FROM users WHERE username = 'user15'), (SELECT role_id FROM roles WHERE role_name = 'admin')),
    ((SELECT user_id FROM users WHERE username = 'user16'), (SELECT role_id FROM roles WHERE role_name = 'patient')),
    ((SELECT user_id FROM users WHERE username = 'user17'), (SELECT role_id FROM roles WHERE role_name = 'receptionist')),
    ((SELECT user_id FROM users WHERE username = 'user18'), (SELECT role_id FROM roles WHERE role_name = 'receptionist')),
    ((SELECT user_id FROM users WHERE username = 'user19'), (SELECT role_id FROM roles WHERE role_name = 'dentist')),
    ((SELECT user_id FROM users WHERE username = 'user20'), (SELECT role_id FROM roles WHERE role_name = 'user'));



    {
  "id": 0,
  "username": "fergdp",
  "password": "admin123",
  "email": "gdp.fernando@gmail.com",
  "firstName": "Fernando",
  "lastName": "Gomez de Paz",
  "dateOfBirth": "2024-08-22",
  "street": "publica 123",
  "city": "Cordoba",
  "state": "Cordoba",
  "postalCode": "5000",
  "country": "Argentina",
  "phone": "0351153251291",
  "gender": "MALE",
  "roles": [
    {
      "id": 0,
      "name": "ROLE_ADMIN"
    }
  ],
  "createdAt": "2024-08-22T20:12:30.109Z",
  "updatedAt": "2024-08-22T20:12:30.109Z",
  "enabled": true
}
