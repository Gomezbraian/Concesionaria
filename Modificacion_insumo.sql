CREATE DEFINER=`root`@`localhost` PROCEDURE `Modificacion_insumo`(IN id_insumo INT,IN nuevo_nombre_insumo VARCHAR(255), OUT resultado INT, OUT msg VARCHAR(350))
BEGIN
IF ((select count(*) from insumo where id=id_insumo)=0) THEN
		SET msg = concat("No existe ningun insumo con el id ", id_insumo);
        SET resultado = -1;
	ELSE
		update insumo set name=nuevo_nombre_insumo where id=id_insumo;
		SET msg = concat("Se ha modificado correctamente el insumo con el id", id_insumo);
        SET resultado = 0;
END IF;
END