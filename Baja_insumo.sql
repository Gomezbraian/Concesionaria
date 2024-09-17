CREATE DEFINER=`root`@`localhost` PROCEDURE `Baja_insumo`(IN id_a_eliminar int, OUT resultado INT, OUT msg VARCHAR(350))
BEGIN
	IF ((select count(*) from insumo where id=id_a_eliminar)=0) THEN
		SET msg = concat("No existe el insumo con el id", id_a_eliminar);
        SET resultado = -1;
	ELSE
		delete from insumo where id=id_a_eliminar;
		SET msg = concat("Se ha eliminado correctamente el insumo con el id ", id_a_eliminar);
        SET resultado = 0;
    END IF;
END