-- Categorías
INSERT INTO categoria(nombre) VALUES
('Tecnología'),
('Cocina'),
('Viajes'),
('Ciencia'),
('Deportes');

-- Usuarios
INSERT INTO usuario(nombrePila,apellidoPaterno,correoElectronico,fechaNacimiento) VALUES
('Ana', 'López', 'ana@test.com', '1990-02-10'),
('Roberto', 'Pérez', 'roberto@test.com', '1985-06-22'),
('Luis', 'Gómez', 'luis@test.com', '1992-11-12'),
('María', 'Hernández', 'maria@test.com', '1998-04-05'),
('Carlos', 'Ramírez', 'carlos@test.com', '1989-09-30');

-- Posts
INSERT INTO post(contenido,titulo,fecha,idUsuario,idCategoria) VALUES
('Tips de MySQL...','MySQL Básico','2025-01-20', 1, 1),
('Cómo hacer pasta...','Pasta casera','2025-01-23', 2, 2),
('Guía de Japón...','Viaje a Japón','2025-02-10', 3, 3),
('Nuevos experimentos...','Física Moderna','2025-02-18', 4, 4),
('Cómo mejorar en fútbol...','Entrenamiento','2025-03-01', 5, 5);

-- Etiquetas
INSERT INTO etiqueta(nombre) VALUES
('Tutorial'),
('Receta'),
('Principiantes'),
('Avanzado'),
('Tips');

-- PostEtiqueta
INSERT INTO post_etiqueta(idPost,idEtiqueta) VALUES
(1, 1),
(1, 3),
(2, 2),
(3, 5),
(4, 4),
(5, 5),
(5, 3);

-- Comentarios
INSERT INTO comentario(contenido,fecha,idUsuario,idPost) VALUES
('Muy útil', '2025-02-01', 2, 1),
('Gran receta!', '2025-02-02', 1, 2),
('Excelente información', '2025-02-03', 4, 3),
('Muy interesante', '2025-02-04', 3, 4),
('Me ayudó mucho', '2025-02-05', 1, 5);