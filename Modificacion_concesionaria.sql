CREATE DEFINER=`root`@`localhost` PROCEDURE `Modificacion_concesionaria`(IN id_concesionaria INT,IN nuevo_nombre_concesionaria VARCHAR(255), OUT resultado INT, OUT msg VARCHAR(350))
BEGIN
	IF ((select count(*) from concesionaria where id=id_concesionaria)=0) THEN
		SET msg = concat("No existe ningun concesionario con el id ", id_concesionaria);
        SET resultado = -1;
	ELSE
		update concesionaria set name=nuevo_nombre_concesionaria where id=id_concesionaria;
		SET msg = concat("Se ha modificado correctamente la concesionaria con el id", id_concesionaria);
        SET resultado = 0;
    END IF;
END