-- 1. CREACIÓN DE LA BASE DE DATOS Y TABLAS
CREATE DATABASE IF NOT EXISTS libreria_pro;
USE libreria_pro;

CREATE TABLE Usuarios_Sistema (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre_completo VARCHAR(100) NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    rol ENUM('Administrador', 'Empleado') NOT NULL,
    estado ENUM('Activo', 'Inactivo') DEFAULT 'Activo'
);

CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre_completo VARCHAR(100) NOT NULL,
    correo_electronico VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Libros (
    isbn VARCHAR(20) PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    stock_total INT NOT NULL,
    stock_disponible INT NOT NULL
);

CREATE TABLE Prestamos (
    id_prestamo INT AUTO_INCREMENT PRIMARY KEY,
    isbn_libro VARCHAR(20) NOT NULL,
    id_cliente INT NOT NULL,
    id_empleado_registro INT NOT NULL,
    fecha_prestamo DATE NOT NULL,
    fecha_limite DATE NOT NULL,
    estado ENUM('Pendiente', 'Devuelto', 'Atrasado') DEFAULT 'Pendiente',
    FOREIGN KEY (isbn_libro) REFERENCES Libros(isbn),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_empleado_registro) REFERENCES Usuarios_Sistema(id_usuario)
);

-- 2. INSERCIÓN DE DATOS: 20 USUARIOS (2 Admins, 18 Empleados)
INSERT INTO Usuarios_Sistema (nombre_completo, username, password_hash, rol, estado) VALUES
('Carlos Mendoza', 'carlos.admin', 'hash123', 'Administrador', 'Activo'),
('Laura Gómez', 'laura.admin', 'hash123', 'Administrador', 'Activo'),
('Ana García', 'ana.emp', 'hash123', 'Empleado', 'Activo'),
('Luis Pérez', 'luis.emp', 'hash123', 'Empleado', 'Inactivo'),
('Sofía Ramírez', 'sofia.emp', 'hash123', 'Empleado', 'Activo'),
('Diego Torres', 'diego.emp', 'hash123', 'Empleado', 'Activo'),
('Marta López', 'marta.emp', 'hash123', 'Empleado', 'Activo'),
('Jorge Ruiz', 'jorge.emp', 'hash123', 'Empleado', 'Activo'),
('Elena Morales', 'elena.emp', 'hash123', 'Empleado', 'Inactivo'),
('Raúl Castro', 'raul.emp', 'hash123', 'Empleado', 'Activo'),
('Carmen Vargas', 'carmen.emp', 'hash123', 'Empleado', 'Activo'),
('Pablo Ortiz', 'pablo.emp', 'hash123', 'Empleado', 'Activo'),
('Lucía Silva', 'lucia.emp', 'hash123', 'Empleado', 'Activo'),
('Andrés Ríos', 'andres.emp', 'hash123', 'Empleado', 'Activo'),
('Valeria Luna', 'valeria.emp', 'hash123', 'Empleado', 'Inactivo'),
('Javier Cruz', 'javier.emp', 'hash123', 'Empleado', 'Activo'),
('Isabel Vega', 'isabel.emp', 'hash123', 'Empleado', 'Activo'),
('Fernando Gil', 'fernando.emp', 'hash123', 'Empleado', 'Activo'),
('Gabriela Paz', 'gabriela.emp', 'hash123', 'Empleado', 'Activo'),
('Ricardo Rey', 'ricardo.emp', 'hash123', 'Empleado', 'Activo');

-- 3. INSERCIÓN DE DATOS: 20 CLIENTES
INSERT INTO Clientes (nombre_completo, correo_electronico) VALUES
('Juan Pérez', 'juan.perez@email.com'), ('María Rodríguez', 'maria.r@email.com'),
('Pedro Martínez', 'pedro.m@email.com'), ('Luisa Hernández', 'luisa.h@email.com'),
('Carlos Díaz', 'carlos.d@email.com'), ('Ana Romero', 'ana.r@email.com'),
('José Álvarez', 'jose.a@email.com'), ('Teresa Soto', 'teresa.s@email.com'),
('Manuel Flores', 'manuel.f@email.com'), ('Rosa Gómez', 'rosa.g@email.com'),
('Miguel Rojas', 'miguel.r@email.com'), ('Blanca Medina', 'blanca.m@email.com'),
('David Castillo', 'david.c@email.com'), ('Silvia Aguilar', 'silvia.a@email.com'),
('Alejandro Herrera', 'alex.h@email.com'), ('Gloria Núñez', 'gloria.n@email.com'),
('Roberto Peña', 'roberto.p@email.com'), ('Patricia Cabrera', 'paty.c@email.com'),
('Francisco Ríos', 'paco.r@email.com'), ('Julia Mora', 'julia.m@email.com');

-- 4. INSERCIÓN DE DATOS: 50 LIBROS DIVERSOS
INSERT INTO Libros (isbn, titulo, autor, categoria, stock_total, stock_disponible) VALUES
('978-0001', 'El Principito', 'Antoine de Saint-Exupéry', 'Ficción', 15, 12),
('978-0002', '1984', 'George Orwell', 'Ciencia Ficción', 10, 8),
('978-0003', 'Cien años de soledad', 'Gabriel García Márquez', 'Realismo Mágico', 20, 18),
('978-0004', 'Don Quijote de la Mancha', 'Miguel de Cervantes', 'Clásico', 8, 8),
('978-0005', 'Orgullo y Prejuicio', 'Jane Austen', 'Romance', 12, 10),
('978-0006', 'Matar a un ruiseñor', 'Harper Lee', 'Ficción Histórica', 10, 9),
('978-0007', 'El Gran Gatsby', 'F. Scott Fitzgerald', 'Clásico', 14, 14),
('978-0008', 'Moby Dick', 'Herman Melville', 'Aventura', 6, 5),
('978-0009', 'La Odisea', 'Homero', 'Épico', 9, 8),
('978-0010', 'Crimen y Castigo', 'Fiódor Dostoyevski', 'Novela Psicológica', 11, 10),
('978-0011', 'El Señor de los Anillos', 'J.R.R. Tolkien', 'Fantasía', 25, 20),
('978-0012', 'Harry Potter y la Piedra Filosofal', 'J.K. Rowling', 'Fantasía', 30, 22),
('978-0013', 'El código Da Vinci', 'Dan Brown', 'Misterio', 18, 15),
('978-0014', 'El Alquimista', 'Paulo Coelho', 'Autoayuda', 20, 19),
('978-0015', 'Breve historia del tiempo', 'Stephen Hawking', 'Ciencia', 7, 7),
('978-0016', 'Sapiens', 'Yuval Noah Harari', 'Historia', 15, 12),
('978-0017', 'Hábitos Atómicos', 'James Clear', 'Autoayuda', 25, 20),
('978-0018', 'Padre Rico, Padre Pobre', 'Robert Kiyosaki', 'Finanzas', 30, 28),
('978-0019', 'Pensar rápido, pensar despacio', 'Daniel Kahneman', 'Psicología', 10, 8),
('978-0020', 'El arte de la guerra', 'Sun Tzu', 'Estrategia', 12, 12),
('978-0021', 'Rayuela', 'Julio Cortázar', 'Ficción', 8, 6),
('978-0022', 'Ficciones', 'Jorge Luis Borges', 'Cuentos', 10, 9),
('978-0023', 'Pedro Páramo', 'Juan Rulfo', 'Realismo Mágico', 15, 14),
('978-0024', 'La casa de los espíritus', 'Isabel Allende', 'Ficción', 14, 12),
('978-0025', 'El amor en los tiempos del cólera', 'Gabriel García Márquez', 'Romance', 16, 14),
('978-0026', 'A sangre fría', 'Truman Capote', 'No Ficción', 9, 8),
('978-0027', 'Frankenstein', 'Mary Shelley', 'Terror', 11, 11),
('978-0028', 'Drácula', 'Bram Stoker', 'Terror', 13, 10),
('978-0029', 'El retrato de Dorian Gray', 'Oscar Wilde', 'Clásico', 10, 9),
('978-0030', 'Fahrenheit 451', 'Ray Bradbury', 'Ciencia Ficción', 15, 12),
('978-0031', 'Un mundo feliz', 'Aldous Huxley', 'Ciencia Ficción', 14, 13),
('978-0032', 'La metamorfosis', 'Franz Kafka', 'Ficción Absurda', 18, 17),
('978-0033', 'Ensayo sobre la ceguera', 'José Saramago', 'Ficción', 12, 10),
('978-0034', '100 años de soledad', 'Gabriel García Márquez', 'Realismo Mágico', 20, 18),
('978-0035', 'El laberinto de la soledad', 'Octavio Paz', 'Ensayo', 8, 7),
('978-0036', 'Los detectives salvajes', 'Roberto Bolaño', 'Ficción', 6, 5),
('978-0037', 'Cumbres Borrascosas', 'Emily Brontë', 'Romance Clásico', 10, 10),
('978-0038', 'Jane Eyre', 'Charlotte Brontë', 'Romance Clásico', 9, 8),
('978-0039', 'Mujercitas', 'Louisa May Alcott', 'Clásico', 15, 13),
('978-0040', 'Anna Karenina', 'León Tolstói', 'Clásico', 7, 7),
('978-0041', 'Guerra y Paz', 'León Tolstói', 'Clásico Histórico', 5, 4),
('978-0042', 'Los Miserables', 'Victor Hugo', 'Clásico Histórico', 8, 7),
('978-0043', 'El conde de Montecristo', 'Alexandre Dumas', 'Aventura', 12, 10),
('978-0044', 'La isla del tesoro', 'Robert Louis Stevenson', 'Aventura', 14, 12),
('978-0045', 'Viaje al centro de la Tierra', 'Julio Verne', 'Aventura', 16, 14),
('978-0046', 'Veinte mil leguas de viaje submarino', 'Julio Verne', 'Ciencia Ficción', 15, 13),
('978-0047', 'Estudio en escarlata', 'Arthur Conan Doyle', 'Misterio', 20, 18),
('978-0048', 'El sabueso de los Baskerville', 'Arthur Conan Doyle', 'Misterio', 18, 16),
('978-0049', 'Asesinato en el Orient Express', 'Agatha Christie', 'Misterio', 22, 19),
('978-0050', 'Diez negritos', 'Agatha Christie', 'Misterio', 25, 23);

-- 5. INSERCIÓN DE DATOS: 30 PRÉSTAMOS (Equilibrados)
-- Formato: (isbn, id_cliente, id_empleado, fecha_prestamo, fecha_limite, estado)
INSERT INTO Prestamos (isbn_libro, id_cliente, id_empleado_registro, fecha_prestamo, fecha_limite, estado) VALUES
-- 10 Pendientes (Aún en tiempo)
('978-0001', 1, 3, '2026-04-01', '2026-04-15', 'Pendiente'),
('978-0002', 2, 5, '2026-04-02', '2026-04-16', 'Pendiente'),
('978-0005', 3, 6, '2026-04-03', '2026-04-17', 'Pendiente'),
('978-0011', 4, 3, '2026-04-03', '2026-04-17', 'Pendiente'),
('978-0012', 5, 7, '2026-04-04', '2026-04-18', 'Pendiente'),
('978-0016', 6, 8, '2026-04-04', '2026-04-18', 'Pendiente'),
('978-0017', 7, 3, '2026-04-04', '2026-04-18', 'Pendiente'),
('978-0030', 8, 10, '2026-04-04', '2026-04-18', 'Pendiente'),
('978-0043', 9, 11, '2026-04-04', '2026-04-18', 'Pendiente'),
('978-0050', 10, 12, '2026-04-04', '2026-04-18', 'Pendiente'),

-- 10 Devueltos (Historial limpio)
('978-0003', 11, 3, '2026-03-01', '2026-03-15', 'Devuelto'),
('978-0008', 12, 5, '2026-03-05', '2026-03-19', 'Devuelto'),
('978-0013', 13, 6, '2026-03-10', '2026-03-24', 'Devuelto'),
('978-0018', 14, 7, '2026-03-12', '2026-03-26', 'Devuelto'),
('978-0021', 15, 8, '2026-03-14', '2026-03-28', 'Devuelto'),
('978-0025', 16, 10, '2026-03-15', '2026-03-29', 'Devuelto'),
('978-0033', 17, 11, '2026-03-18', '2026-04-01', 'Devuelto'),
('978-0036', 18, 12, '2026-03-20', '2026-04-03', 'Devuelto'),
('978-0044', 19, 13, '2026-03-22', '2026-04-05', 'Devuelto'),
('978-0049', 20, 14, '2026-03-23', '2026-04-06', 'Devuelto'),

-- 10 Atrasados (Pasaron su fecha límite)
('978-0001', 2, 3, '2026-03-10', '2026-03-24', 'Atrasado'),
('978-0002', 4, 5, '2026-03-11', '2026-03-25', 'Atrasado'),
('978-0011', 6, 6, '2026-03-12', '2026-03-26', 'Atrasado'),
('978-0012', 8, 7, '2026-03-13', '2026-03-27', 'Atrasado'),
('978-0014', 10, 8, '2026-03-14', '2026-03-28', 'Atrasado'),
('978-0022', 12, 10, '2026-03-15', '2026-03-29', 'Atrasado'),
('978-0028', 14, 11, '2026-03-16', '2026-03-30', 'Atrasado'),
('978-0031', 16, 12, '2026-03-17', '2026-03-31', 'Atrasado'),
('978-0041', 18, 13, '2026-03-18', '2026-04-01', 'Atrasado'),
('978-0048', 20, 14, '2026-03-19', '2026-04-02', 'Atrasado');