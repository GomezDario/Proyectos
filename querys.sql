/*
	1. Obtener nombre, usuario y tipo de los repositorios con más de seis commits de usuarios de la ciudad de
	   Quilmes, ordenados ascendentemente por cantidad de pull requests.
       
*/ 
		SELECT nombre, usuario ,COUNT(usuario) as cantidadDeComits, tipo_repositorio 
		FROM repositorio
		NATURAL JOIN contribucion
		NATURAL JOIN commit
		NATURAL JOIN usuario
		WHERE ciudad = 'Quilmes'
		GROUP BY nombre
		ORDER BY cantidad_pull_request asc;

/*
	2. Obtener los commits con fecha de cambio luego del 01/10/2021 ordenados descendentemente por hash,
	   ascendentemente por archivo y descendentemente por la fecha de cambio.

*/


		SELECT * FROM commit
		WHERE fecha_cambio > '2021-10-01'
		ORDER BY hash desc, id_archivo asc , fecha_cambio desc;


/*
	3. Obtener los repositorios que solo poseen contribuciones de usuarios de Solano y con edad entre 18 y 21
	   (deben cumplirse ambas condiciones).
       
       -Se busco obtener el año de nacimiento de cada usuario y a este año se le resto el año actual con el 
       	objetivo de compara dicho año entre 18 y 21 y que sean de la ciudad de 'Solano'.
*/


		SELECT * 
		FROM repositorio
		NATURAL JOIN usuario
		NATURAL JOIN contribucion
		WHERE  abs(DATE_PART('year',fecha_nacimiento) - DATE_PART('year' , now())) between 18 AND 21

		INTERSECT

		SELECT * 
		FROM repositorio
		NATURAL JOIN usuario
		NATURAL JOIN contribucion
		WHERE ciudad = 'Solano';
        
        
        
        
/*
	4. Obtener un listado que muestre de cada repositorio, el promedio de contribuciones de usuarios de Quilmes
	   y de Varela.

*/



		SELECT nombre, avg(cantidad_cambios) as promedioCambios 
		FROM repositorio
		NATURAL JOIN 
			(SELECT cantidad_cambios, usuario
			 FROM contribucion
			 NATURAL JOIN usuario
			 WHERE ciudad = 'Quilmes'

		     UNION

		     SELECT cantidad_cambios, usuario
			 FROM contribucion
			 NATURAL JOIN usuario
			 WHERE ciudad = 'Varela') as cantidadDeCambiosDeUsuarios
   		
		GROUP BY nombre;
        
/*
	5. Obtener un listado que muestre de cada archivo, el usuario que más commiteó en el mismo junto con la
	cantidad de commits.

*/



		SELECT id, usuario, cantidadDeComits
		FROM archivo
		JOIN 
		(SELECT usuario, count(hash) as cantidadDeComits
		FROM usuario
		NATURAL JOIN contribucion
		NATURAL JOIN commit
		GROUP BY usuario) as usuariosConComits ON usuario_repositorio = usuario;
        
        
/*
	6. Obtener un listado de las últimas actividades. Que son, por usuario, la suma de contribuciones que hizo y
	   el promedio de la cantidad de cambios, ordenados descendentemente por estas últimas dos.

*/



		SELECT usuario, count(hash) as sumaDeContribuciones ,avg(cantidad_cambios) as promedioDeCambios 
		FROM contribucion
		GROUP BY usuario
		ORDER BY sumaDeContribuciones, promedioDeCambios desc;
        
        
        
/*
	7. Obtener el nombre de usuario y el repositorio en donde el usuario sea el creador del repositorio pero no
	   haya hecho contribuciones, o haya hecho al menos tres.

*/ 



		SELECT usuario, nombre FROM repositorio
		NATURAL JOIN usuario
		NATURAL JOIN contribucion
		WHERE cantidad_pull_request = 0

		UNION

		SELECT usuario, nombre FROM repositorio
		NATURAL JOIN usuario
		NATURAL JOIN contribucion
		WHERE cantidad_pull_request <= 3;
        
        
        
/*
	8. Obtener la cantidad de repositorios superseguros por ciudad. Que son los que pertenecen a usuarios con
	   contraseña que poseen al menos un ‘#’ numeral, más de 32 caracteres y el usuario hizo más de diez
	   contribuciones, ordenados descendentemente por cantidad de favoritos.

*/


		SELECT count(nombre) as cantidadRepo, ciudad FROM
			(SELECT nombre ,usuario,count(hash) as contribucionesT,
  			ciudad, cantidad_favoritos 
			FROM usuario 
			NATURAL JOIN contribucion
			NATURAL JOIN repositorio
			WHERE contrasenia LIKE '%#%' AND char_length(contrasenia) >= 32
			GROUP BY usuario, cantidad_favoritos, nombre, ciudad
			ORDER BY cantidad_favoritos desc) as contraseniaSuperSegura
	   GROUP BY ciudad;
       
/*
	9. Obtener los tres archivos más modificados del 2021 por usuarios que hayan hecho más de 6 pull requests
	   o que posean menos de tres repositorios (puede cumplirse una o ambas condiciones).

*/


		(SELECT id 
		FROM usuario
		JOIN archivo ON usuario_repositorio = usuario
        JOIN commit ON id_archivo = id
        WHERE cantidad_pull_request > 6 
        AND DATE_PART('year',fecha_cambio) = '2021'

        UNION

        SELECT id FROM
        (SELECT count(nombre) as cantidadDeRepositorios, usuario, id
        FROM usuario
        NATURAL JOIN repositorio
        JOIN archivo ON usuario_repositorio = usuario
        JOIN commit ON id_archivo = id
        WHERE DATE_PART('year',fecha_cambio) = '2021'
        GROUP BY usuario, id) as cantidadDeRepoPorUsuario
        WHERE cantidadDeRepositorios < 3)
        ORDER BY id desc limit 3;
        
/*
	10. Obtener de los repositorios ‘family friendly’, el repositorio y la cantidad de contribuidores por edad. Son
		los repositorios en los que la edad de todos los usuarios que contribuyeron en el mismo es menor a 21.

*/
        SELECT *  FROM repositorio
        NATURAL JOIN usuario
        NATURAL JOIN contribucion
        WHERE abs(DATE_PART('year', fecha_nacimiento) - DATE_PART('year', now())) < 21 AND nombre = 'family friendly';


/*
	11. Obtener los más activos. Que son los usuarios que realizaron más commits que el promedio, ordenados
		ascendentemente por nyap y ciudad, y descendentemente por la cantidad de commits.

*/

        SELECT count(hash) as cantidadDeComits, usuario FROM usuario
        NATURAL JOIN contribucion
        NATURAL JOIN commit
        GROUP BY usuario
        HAVING count(hash) > 
            (SELECT avg(cantidadDeComits)
            FROM
            (SELECT count(hash) as cantidadDeComits, usuario FROM usuario
            NATURAL JOIN contribucion
            NATURAL JOIN commit
            GROUP BY usuario)
            as cantidadDeComitPorUsuario);

/*
	12. Obtener de cada repositorio su contribuidor insignia. Que es aquel que más cambios realizó durante sus
		distintas contribuciones.
*/


      SELECT nombre, usuario, sum(cantidad_cambios) as cantidadCambios FROM repositorio
      NATURAL JOIN contribucion
      GROUP BY nombre;


/*

	13. Tenemos una alta demanda de commits por archivo y fecha de cambio. Aplicar una estrategia para compensar esta alta demanda.

*/
      CREATE INDEX idx_archivo_fechacambio
      ON commit(id_archivo, fecha_cambio);
      SELECT tablename, indexname 
      FROM pg_indexes
      where indexname = 'idx_archivo_fechacambio'


/*
	14. Cree una vista(view) de usuarios cuyo promedio histórico de contribuciones en repositorios de Quilmes
		sea mayor a cinco, commitearon al menos cinco veces en al menos tres repositorios distintos, tienen menos
		de tres repositorios con con más de cien favoritos y menos de veinte pull requests, y nacieron en la década
		de los noventa.

*/

    CREATE VIEW usuariosQueCumplenLasCondiciones as
    (

      SELECT usuario
      FROM contribucion
      NATURAL JOIN usuario
      NATURAL JOIN repositorio
      WHERE ciudad = 'Quilmes'
      GROUP BY usuario
      HAVING avg(cantidad_cambios) > 5

      INTERSECT

      SELECT usuario
      FROM usuario
      JOIN archivo ON usuario_repositorio = usuario
      JOIN commit ON id_archivo = id
      GROUP BY usuario
      HAVING count(hash) < 5

      INTERSECT

      SELECT DISTINCT usuario
      FROM usuario
      JOIN archivo ON usuario_repositorio = usuario
      JOIN commit ON id_archivo = id
      GROUP BY usuario
      HAVING count(nombre_repositorio) >= 3

      INTERSECT

      SELECT DISTINCT usuario
      FROM usuario
      NATURAL JOIN repositorio
      WHERE cantidad_favoritos > 100 AND cantidad_pull_request < 20
      GROUP BY usuario
      HAVING count(nombre) < 3 

      INTERSECT

      SELECT DISTINCT usuario
      FROM usuario
      WHERE DATE_PART('year' , fecha_nacimiento) between '1990' and '1999'


    );

	SELECT * FROM usuariosQueCumplenLasCondiciones;

/*
	15. En la tabla usuario conocemos su usuario, pero tenemos un requerimiento que exige al sistema que la
	    combinación de correos y ciudad sea única. Aplique una estrategia para resolverlo.

*/
ALTER TABLE usuario
ADD CONSTRAINT correo_ciudad_unico UNIQUE(correo, ciudad);
