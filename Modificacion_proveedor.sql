CREATE DEFINER=`root`@`localhost` PROCEDURE `Modificacion_proveedor`(IN id_proveedor INT,IN nuevo_nombre_proveedor VARCHAR(255), OUT resultado INT, OUT msg VARCHAR(350))
BEGIN
IF ((select count(*) from proveedor where id=id_proveedor)=0) THEN
		SET msg = concat("No existe ningun proveedor con el id ", id_proveedor);
        SET resultado = -1;
	ELSE
		update proveedor set name=nuevo_nombre_proveedor where id=id_proveedor;
		SET msg = concat("Se ha modificado correctamente el proveedor con el id", id_proveedor);
        SET resultado = 0;
END IF;
END