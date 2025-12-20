-- Lista el nombre de todos los productos que hay en la tabla producto.
SELECT nombre FROM producto;

-- Lista los nombres y los precios de todos los productos de la tabla producto.
SELECT nombre, precio FROM producto;

-- Lista todas las columnas de la tabla producto.
SELECT * FROM producto;

-- Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
SELECT producto.nombre AS Producto,precio,fabricante.nombre AS Fabricante 
FROM producto
INNER JOIN fabricante
ON producto.codigo_fabricante = fabricante.codigo;

-- Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT nombre 
FROM producto
WHERE codigo_fabricante = (
	SELECT codigo FROM fabricante WHERE nombre = "Lenovo");

-- Devuelve todos los datos de los productos que tienen el mismo 
-- precio que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT * 
FROM producto
WHERE precio = (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = (
	SELECT codigo FROM fabricante WHERE nombre = "Lenovo"));
    
-- Lista el nombre del producto más caro del fabricante Lenovo.
SELECT nombre AS Producto
FROM producto
WHERE precio = (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = (
	SELECT codigo FROM fabricante WHERE nombre = "Lenovo"));

-- Calcula el número total de productos que hay en la tabla productos. 
SELECT COUNT(*) FROM producto;

/*
Muestra el número total de productos que tiene cada uno de los fabricantes.
El listado también debe incluir los fabricantes que no tienen ningún producto.
El resultado mostrará dos columnas, una con el nombre del fabricante
y otra con el número de productos que tiene. 
Ordene el resultado descendentemente por el número de productos.
*/

SELECT fabricante.nombre AS Fabricante, COUNT(producto.codigo_fabricante) AS '#' 
FROM fabricante
LEFT JOIN producto
ON producto.codigo_fabricante = fabricante.codigo
GROUP BY fabricante.codigo
ORDER BY 2 DESC;

/*
Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes.
El resultado mostrará el nombre del fabricante junto con los datos que se solicitan.
*/
SELECT fabricante.nombre AS Fabricante,MAX(precio),MIN(precio),AVG(precio)
FROM fabricante
INNER JOIN producto ON fabricante.codigo=producto.codigo_fabricante
GROUP BY fabricante.nombre;


/*
Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo,
precio medio y el número total de productos de los fabricantes que tienen un precio medio
superior a 200€. Es necesario mostrar el nombre del fabricante.
*/
SELECT fabricante.nombre AS Fabricante,MAX(precio),MIN(precio),AVG(precio),COUNT(producto.codigo_fabricante)
FROM fabricante
INNER JOIN producto ON fabricante.codigo=producto.codigo_fabricante
GROUP BY fabricante.nombre
HAVING AVG(precio)>200;

-- https://www.ibm.com/docs/es/i/7.5?topic=statement-having-clause
