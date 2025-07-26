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

-- 10 Patients for Analia Baigorria Clinic (clinic_id = 1) with realistic names and concatenated usernames
INSERT INTO users (username, password_hash, email, first_name, last_name, date_of_birth, street, city, state, postal_code, country, phone, gender, is_enabled, clinic_id) VALUES
('sofiagarcia', 'patient123', 'sofia.garcia@example.com', 'Sofía', 'García', '1990-01-01', 'Street 1', 'Cordoba', 'Cordoba', '5000', 'Argentina', '351-300-0001', 'FEMALE', 1, 1),
('mateorodriguez', 'patient123', 'mateo.rodriguez@example.com', 'Mateo', 'Rodríguez', '1991-02-02', 'Street 2', 'Cordoba', 'Cordoba', '5000', 'Argentina', '351-300-0002', 'MALE', 1, 1),
('valentinamartinez', 'patient123', 'valentina.martinez@example.com', 'Valentina', 'Martínez', '1992-03-03', 'Street 3', 'Cordoba', 'Cordoba', '5000', 'Argentina', '351-300-0003', 'FEMALE', 1, 1),
('lucashernandez', 'patient123', 'lucas.hernandez@example.com', 'Lucas', 'Hernández', '1993-04-04', 'Street 4', 'Cordoba', 'Cordoba', '5000', 'Argentina', '351-300-0004', 'MALE', 1, 1),
('isabellalopez', 'patient123', 'isabella.lopez@example.com', 'Isabella', 'López', '1994-05-05', 'Street 5', 'Cordoba', 'Cordoba', '5000', 'Argentina', '351-300-0005', 'FEMALE', 1, 1),
('santiagogonzalez', 'patient123', 'santiago.gonzalez@example.com', 'Santiago', 'González', '1995-06-06', 'Street 6', 'Cordoba', 'Cordoba', '5000', 'Argentina', '351-300-0006', 'MALE', 1, 1),
('camilaperez', 'patient123', 'camila.perez@example.com', 'Camila', 'Pérez', '1996-07-07', 'Street 7', 'Cordoba', 'Cordoba', '5000', 'Argentina', '351-300-0007', 'FEMALE', 1, 1),
('sebastianasanchez', 'patient123', 'sebastian.sanchez@example.com', 'Sebastián', 'Sánchez', '1997-08-08', 'Street 8', 'Cordoba', 'Cordoba', '5000', 'Argentina', '351-300-0008', 'MALE', 1, 1),
('valeriaramirez', 'patient123', 'valeria.ramirez@example.com', 'Valeria', 'Ramírez', '1998-09-09', 'Street 9', 'Cordoba', 'Cordoba', '5000', 'Argentina', '351-300-0009', 'FEMALE', 1, 1),
('nicolastorres', 'patient123', 'nicolas.torres@example.com', 'Nicolás', 'Torres', '1999-10-10', 'Street 10', 'Cordoba', 'Cordoba', '5000', 'Argentina', '351-300-0010', 'MALE', 1, 1);

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



-- Inserta todas las obras sociales de la Federación
-- Recuerde reemplazar '1' con el clinic_id que corresponda
INSERT INTO health_insurances (clinic_id, name, federation_code, details) VALUES
(1, 'AMERICA SERVICIOS M.C.A', 195, 'AMERICA SERVICIOS M.C.A'), -- ID: 1
(1, 'AMICOS', 26, 'Asociacion Mutual Intercooperativa Solidaria'), -- ID: 2
(1, 'AMTTAC', 101, 'Trabajadores del Transporte Automotor de Cargas Cba'), -- ID: 3
(1, 'ANDES SALUD', 500, 'ANDES SALUD'), -- ID: 4
(1, 'ASOC.MUT.BCO.PCIA. DE CBA - Prótesis', 25, 'Asociación Mutual del Personal del Banco de la Provincia de Córdoba'), -- ID: 5
(1, 'ASOC.MUT.BCO.PCIA.DE CBA - Generales', 31, 'Asociación Mutual del Personal del Banco de la Provincia de Córdoba'), -- ID: 6
(1, 'ASOCIACION ECLESIASTICA DE SAN PEDRO', 72, 'ASOCIACION ECLESIASTICA DE SAN PEDRO'), -- ID: 7
(1, 'ATSA', 110, 'O.S del Personal de la Sanidad Argentina'), -- ID: 8
(1, 'AVALIAN', 76, 'AVALIAN'), -- ID: 9
(1, 'BOREAL CORDOBA CAPITAL', 265, 'BOREAL - Válido solo para Córdoba Capital'), -- ID: 10
(1, 'BOREAL SOLO INTERIOR DE CORDOBA', 720, 'BOREAL - Válido solo para el interior de Córdoba'), -- ID: 11
(1, 'CAJA DE ABOGADOS', 5, 'Caja de Previsión Social para Abogados y Procuradores de la Provincia de Córdoba'), -- ID: 12
(1, 'CAJA NOTARIAL', 20, 'Caja Notarial de Jubilaciones y Previsión Social de la Provincia de Córdoba'), -- ID: 13
(1, 'CERAMISTAS (OSCE)', 430, 'Obra Social de Ceramistas'), -- ID: 14
(1, 'CIENCIAS ECONOMICAS (CPCE)', 80, 'Consejo Profesional de Ciencias Económicas de Córdoba'), -- ID: 15
(1, 'DASPU - Ortodoncia', 888, 'Dirección de Asistencia Social del Personal Universitario'), -- ID: 16
(1, 'DASPU - Generales', 8, 'Dirección de Asistencia Social del Personal Universitario'), -- ID: 17
(1, 'OSSEG - Prótesis', 175, 'Obra Social de Seguros'), -- ID: 18
(1, 'OSFATLYF', 595, 'Obra Social de la Federación Argentina de Trabajadores de Luz y Fuerza'), -- ID: 19
(1, 'POLICIA FEDERAL (CORA)', 40, 'Obra Social de la Policía Federal Argentina'), -- ID: 20
(1, 'DOCTORED', 545, 'DOCTORED'), -- ID: 21
(1, 'GRAFICOS', 17, 'Personal de la Industria Gráfica de la Provincia de Córdoba'), -- ID: 22
(1, 'INTEGRAL SALUD (OSPOCE)', 345, 'Obra Social del Personal de Organismos de Control Externo'), -- ID: 23
(1, 'IOSFA', 460, 'Obra Social de las Fuerzas Armadas y de Seguridad'), -- ID: 24
(1, 'JERARQUICOS SALUD', 48, 'JERARQUICOS SALUD'), -- ID: 25
(1, 'LUIS PASTEUR', 109, 'Obra Social Luis Pasteur'), -- ID: 26
(1, 'MUTUAL MEDICA RIO CUARTO', 475, 'Mutual Médica de Río Cuarto'), -- ID: 27
(1, 'LUZ y FUERZA CORDOBA (OSPLYFC)', 405, 'Obra Social del Personal de Luz y Fuerza de Córdoba'), -- ID: 28
(1, 'SERVICIO PENITENCIARIO FEDERAL', 440, 'Obra Social del Servicio Penitenciario Federal'), -- ID: 29
(1, 'OSAM (SOCDUS)', 520, 'Obra Social de la Actividad Minera'), -- ID: 30
(1, 'OSDIPP', 240, 'Obra Social del Personal de Dirección de la Industria Privada del Petróleo'), -- ID: 31
(1, 'OSIAD SALUD', 34, 'Personal de la Industria Aceitera, Desmotadora'), -- ID: 32
(1, 'OSJERA', 540, 'Personal Jerárquico de Agua y Energía'), -- ID: 33
(1, 'OSMATA - SANITAS SALUD SRL', 495, 'Sindicato de Mecánicos y Afines del Transporte Automotor'), -- ID: 34
(1, 'OSMISS', 555, 'Ministros, Secretarios y Subsecretarios'), -- ID: 35
(1, 'OSPEP', 560, 'Personal de Panadería'), -- ID: 36
(1, 'OSPERyHRA', 52, 'Personal de Edificios de Renta y Horizontal de la Rep. Arg'), -- ID: 37
(1, 'OSPES', 425, 'Personal de Estaciones de Servicio, Garajes, Playas de Estacionamiento, Lavaderos Automáticos y Gomerías'), -- ID: 38
(1, 'OSPF', 515, 'Obra Social del Personal de Farmacia'), -- ID: 39
(1, 'OSPFP (GRUPO ROI S.A)', 575, 'Obra Social del Personal de Fábricas de Pintura'), -- ID: 40
(1, 'OSPIL - Atilra', 170, 'Personal de la Industria Lechera'), -- ID: 41
(1, 'OSPIM - CORA', 490, 'Personal de la Industria Molinera'), -- ID: 42
(1, 'OSPIM - Ensalud S.A.', 590, 'Personal de la Industria Molinera - Ensalud S.A.'), -- ID: 43
(1, 'OSPIP', 370, 'Personal de la Industria del Plástico'), -- ID: 44
(1, 'OSPIP MONOTRIBUTO', 374, 'Personal de la Industria del Plástico - Monotributo'), -- ID: 45
(1, 'OSPIT', 565, 'Personal de la Industria Textil'), -- ID: 46
(1, 'OSPSA - FILIAL SAN FRANCISCO', 470, 'Personal de la Sanidad Argentina - Filial San Francisco'), -- ID: 47
(1, 'OSPSIP', 535, 'Personal de Seguridad, Comercial, Industrial e Investigaciones Privadas'), -- ID: 48
(1, 'PROVINCIA ART (CORA)', 445, 'Aseguradora de Riesgos del Trabajo del Grupo Provincia'), -- ID: 49
(1, 'RED ARGENTINA DE SALUD', 315, 'Red Argentina de Salud'), -- ID: 50
(1, 'SADAIC', 22, 'Autores y Compositores de Música'), -- ID: 51
(1, 'SANOS SALUD - HORUS', 585, 'Sanos Salud - Horus'), -- ID: 52
(1, 'SWISS MEDICAL', 230, 'Swiss Medical Group'), -- ID: 53
(1, 'UNIMED - Cba Dental', 190, 'Unión Médica Nacional'), -- ID: 54
(1, 'WILLIAM HOPE', 450, 'Obra Social William Hope'), -- ID: 55
(1, 'OSSEC (CORA)', 668, 'Obra Social de Seguros - Prestaciones Generales'), -- ID: 56
(1, 'OSSEG (CORA)', 667, 'Obra Social de Seguros - Prestaciones Generales'); -- ID: 57



INSERT INTO health_insurance_plans (health_insurance_id, plan_name) VALUES
(1, 'General'),
(2, 'General'),
(3, 'MS 105/205/405/505'),
(4, 'BLACK'), (4, 'TITANIUM'),
(5, 'Protesis, Ortodoncia e Implantes'),
(6, 'Prestaciones generales'),
(7, 'General'),
(8, 'General'),
(9, 'Selecta (AS500, AS400)'), (9, 'Superior (AS300)'), (9, 'Integral (AS200, AS204)'), (9, 'Clásica (Plan 3, Plan 9)'),
(10, 'A2'), (10, 'A3'), (10, 'INTEGRAL'), (10, 'MAGNUM'), (10, 'CLÁSICO'), (10, 'SINGULAR'),
(11, 'A2'), (11, 'A3'), (11, 'INTEGRAL'), (11, 'MAGNUM'), (11, 'CLÁSICO'), (11, 'SINGULAR'),
(12, 'General'),
(13, 'General'),
(14, 'General'),
(15, 'General'),
(16, 'Ortodoncia y Ortopedia Funcional'),
(17, 'Prestaciones Generales'),
(18, 'Plan INTEGRAL'), (18, 'Plan INTEGRAL ADHERENTES'), (18, 'Plan ADHERENTE 2021'),
(19, 'BÁSICO'), (19, 'MONOTRIBUTISTA'), (19, 'ESPECIAL'), (19, 'ADHERENTE'), (19, 'MATERNO INFANTIL'), (19, 'SECRETARIADO'),
(20, 'General'),
(21, 'Plan Total'), (21, 'Plan 500'), (21, 'Plan 1000'), (21, 'Plan 2000'), (21, 'Plan 3000'),
(22, 'General'),
(23, 'Roble'), (23, 'Arrayán'), (23, 'Cedro'), (23, 'Ceibo'), (23, 'Ceibo DL'),
(24, 'General'),
(25, 'Varios Planes'),
(26, 'V'), (26, 'S'), (26, 'SI'), (26, 'P'), (26, 'PS'), (26, 'NS'), (26, 'N'), (26, 'C'), (26, 'Novo'), (26, 'J'), (26, 'M'), (26, 'L'),
(27, 'General'),
(28, 'Prestaciones Generales'),
(29, 'General'),
(30, 'General'),
(31, 'MAGNUS'), (31, 'Plan 1-4'), (31, 'PMO'), (31, 'Plan 100-350'), (31, 'Plan 450'),
(32, 'General'),
(33, 'BÁSICO'), (33, 'BÁSICO PLUS'), (33, 'PSO 600'), (33, 'PSO 700'), (33, 'PSO 800'),
(34, 'OSMATA'), (34, 'SANITAS SALUD SS300'), (34, 'SANITAS SALUD SS200'),
(35, 'Plan 100'), (35, 'Plan 200'),
(36, 'General'),
(37, 'General'),
(38, 'PREMIUM'), (38, 'SUPER'), (38, 'BASICO'),
(39, 'General'),
(40, 'Plan único'),
(41, 'PBO (Básico)'), (41, 'Superador'),
(42, 'Quantum'), (42, 'Krono'),
(43, 'DELTA'), (43, 'KRONO'),
(44, 'Plan único'),
(45, 'Monotributo'), (45, 'Efector Social'),
(46, 'Plan único'),
(47, 'General'),
(48, 'BÁSICO'), (48, 'BÁSICO PLUS'), (48, 'PSO 600'), (48, 'PSO 700'), (48, 'PSO 800'),
(49, 'No aplica (ART)'),
(50, 'General'),
(51, 'General'),
(52, 'Celeste'), (52, 'Celeste Plus'), (52, 'Super Celeste'), (52, 'Azul'), (52, 'Dorado'), (52, 'Black'),
(53, 'Advance'), (53, 'Black'), (53, 'Global'), (53, 'Premium'), (53, 'Nubial'), (53, 'Medicien'), (53, 'Qualitas'), (53, 'Docthos'),
(54, 'Horus-45'), (54, 'Horus-65'), (54, 'Horus-85'), (54, 'PROSALUD-55'), (54, 'PROSALUD-75'), (54, 'PROSALUD-95'), (54, 'Horus-95'),
(55, 'Plateados'), (55, 'Dorados'),
(56, 'Plan INTEGRAL'), (56, 'ADHERENTE 2021'), (56, 'OSSEG 450'),
(57, 'Plan INTEGRAL ADHERENTE');


-- Aranceles para AMERICA SERVICIOS M.C.A (Plan ID: 1)
INSERT INTO fee_schedules (plan_id, treatment_code, description, total_fee, co_payment, insurer_coverage, effective_date) VALUES
(1, '01.01', 'Fichado y consulta', 14722.00, 0.00, 14722.00, '2025-04-01'),
(1, '01.04', 'Consulta de urgencia', 25559.00, 0.00, 25559.00, '2025-04-01'),
(1, '02.15', 'Restauración simple de piezas dentarias', 30613.00, 0.00, 30613.00, '2025-04-01'),
(1, '02.16', 'Restauración compuesta/compleja de piezas dentarias', 59285.00, 0.00, 59285.00, '2025-04-01'),
(1, '03.01', 'Tratamiento unirradicular', 62521.00, 0.00, 62521.00, '2025-04-01'),
(1, '03.02', 'Tratamiento multirradicular', 83445.00, 0.00, 83445.00, '2025-04-01'),
(1, '05.01', 'Tartrectomía y cepillado mecánico', 22440.00, 0.00, 22440.00, '2025-04-01'),
(1, '10.01', 'Extracción Simple', 29377.00, 0.00, 29377.00, '2025-04-01');

-- Aranceles para AMICOS (Plan ID: 2)
INSERT INTO fee_schedules (plan_id, treatment_code, description, total_fee, co_payment, insurer_coverage, effective_date) VALUES
(2, '01.01', 'Consulta y fichado', 13040.90, 5868.00, 7172.90, '2025-07-01'),
(2, '01.04', 'Consulta de Urgencia', 22325.00, 10046.00, 12279.00, '2025-07-01'),
(2, '02.15.00', 'Composite: Cavidad simple', 23513.90, 10581.00, 12932.90, '2025-07-01'),
(2, '02.16.00', 'Composite: cavidad compuesta', 32809.27, 14764.00, 18045.27, '2025-07-01'),
(2, '03.01', 'Tratamiento Unirradicular', 55611.12, 25025.00, 30586.12, '2025-07-01'),
(2, '03.02', 'Tratamiento Multirradicular', 74242.14, 33409.00, 40833.14, '2025-07-01'),
(2, '10.01', 'Extracción dentaria', 25231.21, 11354.00, 13877.21, '2025-07-01');

-- Aranceles para ATSA (Plan ID: 8)
INSERT INTO fee_schedules (plan_id, treatment_code, description, total_fee, co_payment, insurer_coverage, effective_date) VALUES
(8, '01.01', 'Consulta y fichado', 10856.00, 0.00, 10856.00, '2025-04-01'),
(8, '01.04', 'Consulta de urgencia', 18439.00, 0.00, 18439.00, '2025-04-01'),
(8, '02.15', 'Restauración simple de piezas dentarias', 20405.00, 0.00, 20405.00, '2025-04-01'),
(8, '02.16', 'Resturaciones compuestas y complejas', 29688.00, 0.00, 29688.00, '2025-04-01'),
(8, '03.01', 'Tratamiento Unirradicular', 50425.00, 0.00, 50425.00, '2025-04-01'),
(8, '03.02', 'Tratamiento Multiradicular', 67092.00, 0.00, 67092.00, '2025-04-01'),
(8, '10.01', 'Extracción dentaria', 24350.00, 0.00, 24350.00, '2025-04-01');

-- Aranceles para AVALIAN (Asumimos Plan Integral ID: 13)
INSERT INTO fee_schedules (plan_id, treatment_code, description, total_fee, co_payment, insurer_coverage, effective_date) VALUES
(13, '01.01', 'Examen - Fichado - Diagnóstico y Plan de Tratamiento', 10950.58, 0.00, 10950.58, '2025-06-01'),
(13, '01.04', 'Consulta de urgencia', 13035.25, 0.00, 13035.25, '2025-06-01'),
(13, '02.01', 'Restauración Cavidad Simple', 17908.11, 0.00, 17908.11, '2025-06-01'),
(13, '02.02', 'Restauración Cavidad Compuesta', 30049.81, 0.00, 30049.81, '2025-06-01'),
(13, '03.01', 'Tratamiento unirradicular', 46504.79, 0.00, 46504.79, '2025-06-01'),
(13, '10.01', 'Extracción dentaria simple', 20935.21, 0.00, 20935.21, '2025-06-01');

-- Aranceles para BOREAL CORDOBA CAPITAL (Asumimos Plan A2, ID: 16)
INSERT INTO fee_schedules (plan_id, treatment_code, description, total_fee, co_payment, insurer_coverage, effective_date) VALUES
(16, '01.01', 'Examen, diagnóstico, fichado y plan de tratamiento', 19042.00, 13815.00, 5227.00, '2025-04-01'),
(16, '01.04', 'Consulta de urgencia', 20033.00, 15387.00, 4646.00, '2025-04-01'),
(16, '02.22', 'Restauración cavidad simple o compuesta', 36604.00, 28473.00, 8131.00, '2025-04-01'),
(16, '02.23', 'Restauración compleja', 46992.00, 37118.00, 9874.00, '2025-04-01'),
(16, '03.01', 'Tratamiento unirradicular', 58629.00, 41205.00, 17424.00, '2025-04-01'),
(16, '10.01', 'Extracción Dentaria', 40100.00, 32550.00, 7550.00, '2025-04-01');

-- Aranceles para CAJA DE ABOGADOS (Plan ID: 20)
-- Cobertura: 60% OS y 40% Afiliado para Grales; 40% OS y 60% Afiliado para Prótesis
INSERT INTO fee_schedules (plan_id, treatment_code, description, total_fee, co_payment, insurer_coverage, effective_date) VALUES
(20, '01.01', 'Primera consulta, fichado, diagnostico y plan de tratamiento', 10589.59, 4235.84, 6353.75, '2025-03-01'),
(20, '02.15', 'Composite: cavidad simple', 18332.69, 7333.08, 10999.61, '2025-03-01'),
(20, '03.01', 'Tratamiento inflamatario pulpar (Unirradicular)', 45154.93, 18061.97, 27092.96, '2025-03-01'),
(20, '04.01.01', 'Incrustación cavidad simple', 115813.75, 69488.25, 46325.50, '2025-03-01'),
(20, '10.01', 'Extraccion dentaria', 20487.93, 8195.17, 12292.76, '2025-03-01');

-- Aranceles para DASPU - Generales (Plan ID: 26)
INSERT INTO fee_schedules (plan_id, treatment_code, description, total_fee, co_payment, insurer_coverage, effective_date) VALUES
(26, '01.01.', 'Exámen diagnóstico y fichado', 7612.00, 2283.60, 5328.40, '2025-03-01'),
(26, '02.02', 'Restauración posterior', 17315.00, 5194.50, 12120.50, '2025-03-01'),
(26, '03.01', 'Tratamiento unirradicular', 31767.00, 9530.10, 22236.90, '2025-03-01'),
(26, '10.01', 'Extracción dentaria', 16205.00, 4861.50, 11343.50, '2025-03-01');

-- Aranceles para JERARQUICOS SALUD (Asumimos Plan General ID: 41)
INSERT INTO fee_schedules (plan_id, treatment_code, description, total_fee, co_payment, insurer_coverage, effective_date) VALUES
(41, '01.01', 'Consulta de relevamiento bucal', 11803.00, 0.00, 11803.00, '2025-04-01'),
(41, '02.01', 'Restauraciones convencionales simples a piezas dentarias', 21507.00, 0.00, 21507.00, '2025-04-01'),
(41, '03.01', 'Tratamiento pulpar de 1 conducto', 47088.00, 0.00, 47088.00, '2025-04-01'),
(41, '10.01', 'Extracción dentaria', 24101.00, 0.00, 24101.00, '2025-04-01');

-- Aranceles para OSFATLYF (Plan BÁSICO, ID: 52)
INSERT INTO fee_schedules (plan_id, treatment_code, description, total_fee, co_payment, insurer_coverage, effective_date) VALUES
(52, '01.01.00', 'Consulta, diagnóstico, fichado y plan de tratamiento', 13225.00, 8000.00, 5225.00, '2025-05-01'),
(52, '01.04.00', 'Consulta de urgencia', 18582.00, 8000.00, 10582.00, '2025-05-01'),
(52, '02.01.00', 'Obturación Cavidad Simple', 24725.00, 10000.00, 14725.00, '2025-05-01'),
(52, '03.01.00', 'Tratamiento de conducto en unirradiculares', 46575.00, 20000.00, 26575.00, '2025-05-01');

-- Aranceles para SWISS MEDICAL (Asumimos Plan Global, ID: 90)
INSERT INTO fee_schedules (plan_id, treatment_code, description, total_fee, co_payment, insurer_coverage, effective_date) VALUES
(90, '01.01', 'Exámen, diagnóstico y fichado', 11052.00, 0.00, 11052.00, '2025-06-01'),
(90, '01.04', 'Consulta de Urgencia', 16597.00, 0.00, 16597.00, '2025-06-01'),
(90, '02.09', 'Restauraciones con resina de fotocurado', 32167.00, 0.00, 32167.00, '2025-06-01'),
(90, '03.01', 'Endodoncia unirradicular (incluye Rx)', 70000.00, 0.00, 70000.00, '2025-06-01'),
(90, '10.01', 'Extracción dentaria simple o restos radiculares', 26772.00, 0.00, 26772.00, '2025-06-01');