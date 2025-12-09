CREATE DATABASE prueba;
USE prueba;
CREATE TABLE producto (
    ProductoID INT AUTO_INCREMENT PRIMARY KEY,
    NombreProducto VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(150),
    Precio DECIMAL(10,2) NOT NULL,
    Stock INT NOT NULL
);

INSERT INTO producto (NombreProducto, Descripcion, Precio, Stock) VALUES
('Camiseta', 'Camiseta negra simple de talla única', 10, 16),
('Pantalón', 'Pantalón largo azul tipo chino', 20, 24),
('Gorra', 'Gorra azul con el logo de los Yankees', 15, 32),
('Zapatillas', 'Zapatillas de running de color blanco y verde', 35, 13);