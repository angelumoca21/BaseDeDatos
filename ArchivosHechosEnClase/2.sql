CREATE DATABASE test;
USE test;

CREATE TABLE alumno(
	id INT UNSIGNED PRIMARY KEY,
    nombre VARCHAR(25) NOT NULL,
    apellido1 VARCHAR(25) NOT NULL,
    apellido2 VARCHAR(25) NOT NULL,
    nota INT NOT NULL
);

/*
Trigger 1: trigger_check_nota_before_insert
Se ejecuta sobre la tabla alumnos.
Se ejecuta antes de una operación de inserción.
Si el nuevo valor de la nota que se quiere insertar es negativo, se guarda como 0.
Si el nuevo valor de la nota que se quiere insertar es mayor que 10, se guarda como 10.
*/

delimiter //
CREATE TRIGGER trigger_check_nota_before_insert
BEFORE INSERT ON alumno 
FOR EACH ROW
BEGIN
	IF NEW.nota < 0 THEN
		SET NEW.nota = 0;
	ELSEIF NEW.nota > 10 THEN
		SET NEW.nota = 10;
	END IF;
END //

SHOW TRIGGERS;
SELECT * FROM alumno;
INSERT INTO alumno(id,nombre,apellido1,apellido2,nota) VALUES (2,'Juan',"Perez","Ramirez", -5);
INSERT INTO alumno(id,nombre,apellido1,apellido2,nota) VALUES (3,'Luis',"Martinez","Gil", 25);