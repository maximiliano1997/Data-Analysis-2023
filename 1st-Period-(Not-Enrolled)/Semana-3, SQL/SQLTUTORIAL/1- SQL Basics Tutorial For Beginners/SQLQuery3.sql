-- 1- SQL Basics Tutorial For Beginners

-- Punto 1: SELECT + FROM STATEMENTS


--SELECT nombre, edad FROM usuarios;

--SELECT t�tulo, autor, a�o_publicaci�n FROM libros;


-- Punto 2: WHERE STATEMENTS

-- ////////// 1
--SELECT nombre, edad FROM usuarios WHERE edad > 30;

-- //////// 2
--SELECT t�tulo, autor, a�o_publicaci�n FROM libros WHERE autor = 'Gabriel Garc�a M�rquez';



-- Punto 3: GROUP BY + ORDER BY STATEMENTS


-- ////////// 1

--SELECT pa�s, COUNT(*) as cantidad_usuarios FROM usuarios GROUP BY pa�s;

-- ///////// 2

--SELECT g�nero, AVG(edad) as edad_promedio FROM usuarios GROUP BY g�nero ORDER BY edad_promedio DESC;


