-- 1- SQL Basics Tutorial For Beginners

-- Punto 1: SELECT + FROM STATEMENTS


--SELECT nombre, edad FROM usuarios;

--SELECT título, autor, año_publicación FROM libros;


-- Punto 2: WHERE STATEMENTS

-- ////////// 1
--SELECT nombre, edad FROM usuarios WHERE edad > 30;

-- //////// 2
--SELECT título, autor, año_publicación FROM libros WHERE autor = 'Gabriel García Márquez';



-- Punto 3: GROUP BY + ORDER BY STATEMENTS


-- ////////// 1

--SELECT país, COUNT(*) as cantidad_usuarios FROM usuarios GROUP BY país;

-- ///////// 2

--SELECT género, AVG(edad) as edad_promedio FROM usuarios GROUP BY género ORDER BY edad_promedio DESC;


