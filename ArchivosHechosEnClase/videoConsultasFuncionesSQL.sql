USE blog;
SELECT * FROM usuario;
SELECT nombrePila AS Nombre,correoElectronico AS Email FROM usuario;
SELECT * FROM usuario WHERE nombrePila = "Luis";  
SELECT nombrePila,fechaNacimiento FROM usuario WHERE fechaNacimiento > '1989-12-31' ORDER BY fechaNacimiento DESC;
SELECT * FROM categoria, etiqueta;

SELECT nombrePila,titulo
FROM usuario
INNER JOIN post ON usuario.idUsuario = post.idUsuario;

SELECT nombrePila, contenido, idPost
FROM comentario
RIGHT JOIN usuario ON usuario.idUsuario = comentario.idUsuario;
SELECT COUNT(*) FROM usuario;
SELECT COUNT(*) FROM usuario WHERE fechaNacimiento > '1989-12-31' ORDER BY fechaNacimiento DESC;

SELECT nombrePila, COUNT(idPost) AS NumeroDeComentarios
FROM comentario
INNER JOIN usuario ON usuario.idUsuario = comentario.idUsuario
GROUP BY nombrePila;

USE prueba;
SELECT * FROM producto;
SELECT AVG(Precio) FROM producto;
SELECT MAX(Precio) FROM producto;
SELECT MIN(stock) FROM producto;
SELECT Sum(stock) FROM producto;