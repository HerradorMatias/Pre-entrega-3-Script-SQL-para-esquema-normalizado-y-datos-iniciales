CREATE DATABASE Ventas_Tech_DB;
USE Ventas_Tech_DB;

DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS categorias;

--- Defino la creación de la tabla "Categorias" y declaro como estará estructurada.

CREATE TABLE Categorias (
ID_Categoria INT  PRIMARY KEY,
NombreCategoria VARCHAR(50) NOT NULL,
Descripcion VARCHAR(200)
)

--- Defino la creación de la tabla "Clientes" y declaro como estará estructurada.

CREATE TABLE Clientes (
ID_Cliente INT PRIMARY KEY,
Nombre VARCHAR(100) NOT NULL,
Email VARCHAR(100) NOT NULL UNIQUE,
Ciudad VARCHAR(50) NOT NULL,
FechaRegistro DATE NOT NULL,
) 

CREATE TABLE Productos (
    ID_Producto      INT    PRIMARY KEY,
    nombre_producto  VARCHAR(100)   NOT NULL,
    ID_Categoria     INT           NOT NULL, 
    precio           DECIMAL(10,2)  NOT NULL,
    stock            INT            DEFAULT 0,
    activo           BIT            DEFAULT 1

    CONSTRAINT FK_Productos_Categoria FOREIGN KEY (ID_Categoria) REFERENCES Categorias (ID_Categoria),
)

-- Tabla de hechos
CREATE TABLE ventas (
    ID_Venta         INT            PRIMARY KEY,
    ID_Cliente       INT          NOT NULL, 
    ID_Producto      INT           NOT NULL,
    cantidad         INT            NOT NULL,
    precio_unitario  DECIMAL(10,2)  NOT NULL,
    fecha_venta      DATE           NOT NULL

    CONSTRAINT FK_Ventas_Cliente FOREIGN KEY (ID_Cliente) REFERENCES Clientes (ID_Cliente),
    CONSTRAINT FK_Ventas_Producto FOREIGN KEY (ID_Producto) REFERENCES Productos (ID_Producto),
);
-- === SECCIÓN 3: INSERT DATA (25 registros) ===
-- Primero las tablas sin dependencias

-- categorias — 4 registros
INSERT INTO categorias (ID_Categoria, NombreCategoria, Descripcion) VALUES
  (1, 'Computación',    'Laptops, PCs y monitores'),
  (2, 'Accesorios',     'Periféricos y complementos'),
  (3, 'Audio',          'Auriculares y parlantes'),
  (4, 'Almacenamiento', 'Discos y memorias');

-- clientes — 5 registros
INSERT INTO clientes (ID_Cliente, nombre, email, ciudad, FechaRegistro) VALUES
  (1, 'María López',  'maria@mail.com',  'Buenos Aires', '2024-01-05'),
  (2, 'Carlos Ruiz',  'carlos@mail.com', 'Córdoba',      '2024-01-10'),
  (3, 'Ana Gómez',    'ana@mail.com',    'Rosario',      '2024-02-01'),
  (4, 'Pedro Sanz',   'pedro@mail.com',  'Mendoza',      '2024-02-15'),
  (5, 'Laura Torres', 'laura@mail.com',  'Tucumán',      '2024-03-01');

-- productos — 6 registros
INSERT INTO productos (ID_Producto, nombre_producto, ID_Categoria, precio, stock, activo) VALUES
  (1, 'Laptop Pro 15',      1, 1200.00, 15, 1),
  (2, 'Mouse Inalámbrico',  2,   28.00, 80, 1),
  (3, 'Monitor 4K 27',      1,  450.00, 12, 1),
  (4, 'Auriculares BT Pro', 3,  120.00, 35, 1),
  (5, 'SSD Externo 1TB',    4,  130.00, 18, 1),
  (6, 'Teclado Mecánico',   2,   95.00, 40, 1);

-- ventas — 10 registros
INSERT INTO ventas (ID_Venta, ID_Cliente, ID_Producto, cantidad, precio_unitario, fecha_venta) VALUES
  ( 1, 1, 1, 2, 1200.00, '2024-03-05'),
  ( 2, 2, 2, 5,   28.00, '2024-03-06'),
  ( 3, 3, 3, 1,  450.00, '2024-03-07'),
  ( 4, 1, 4, 2,  120.00, '2024-03-08'),
  ( 5, 4, 5, 3,  130.00, '2024-03-10'),
  ( 6, 2, 6, 4,   95.00, '2024-03-11'),
  ( 7, 5, 1, 1, 1200.00, '2024-03-12'),
  ( 8, 3, 2, 8,   28.00, '2024-03-13'),
  ( 9, 4, 4, 1,  120.00, '2024-03-14'),
  (10, 5, 3, 2,  450.00, '2024-03-15');

  -- === SECCIÓN 4: VALIDACIÓN ===
-- Deben devolver 4, 5, 6 y 10 filas respectivamente
SELECT * FROM categorias;   -- esperado: 4 filas
SELECT * FROM clientes;     -- esperado: 5 filas
SELECT * FROM productos;    -- esperado: 6 filas
SELECT * FROM ventas;       -- esperado: 10 filas
 