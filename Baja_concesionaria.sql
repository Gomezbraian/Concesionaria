CREATE DEFINER=`root`@`localhost` PROCEDURE `Baja_concesionaria`(IN id_a_eliminar int, OUT resultado INT, OUT msg VARCHAR(350))
BEGIN
	IF ((select count(*) from concesionaria where id=id_a_eliminar)=0) THEN
		SET msg = concat("No existe la concesionaria con el id", id_a_eliminar);
        SET resultado = -1;
	ELSE
		delete from concesionaria where id=id_a_eliminar;
		SET msg = concat("Se ha eliminado correctamente la concesionaria con el id ", id_a_eliminar);
        SET resultado = 0;
    END IF;
END