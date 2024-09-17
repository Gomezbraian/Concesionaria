CREATE DEFINER=`root`@`localhost` PROCEDURE `Alta_concesionaria`(IN nombre_concesionaria VARCHAR(255), OUT resultado INT, OUT msg VARCHAR(350))
BEGIN
	IF ((select count(*) from concesionaria where name=nombre_concesionaria)!=0) THEN
		SET msg = concat("Ya existe una concesionaria llamada ", nombre_concesionaria);
        SET resultado = -1;
	ELSE
		insert INTO concesionaria(name)
        values(nombre_concesionaria);
		SET msg = concat("Se ha creado correctamente la concesionaria llamada ", nombre_concesionaria);
        SET resultado = 0;
    END IF;
END