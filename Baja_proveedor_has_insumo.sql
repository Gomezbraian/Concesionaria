CREATE DEFINER=`root`@`localhost` PROCEDURE `Baja_proveedor_has_insumo`(IN id_proveedor INT, IN id_insumo INT, OUT resultado INT, OUT msg VARCHAR(400))
BEGIN
		IF ((SELECT count(*) FROM proveedor_has_insumo WHERE Proveedor_id=id_proveedor AND Insumo_id=id_insumo)=0) THEN
        SET msg = concat("El insumo con el id", id_insumo, "y proveedor",id_proveedor, "no existen en la tabla");
        SET resultado = -1;
        ELSE 
		delete from proveedor_has_insumo where Proveedor_id=id_proveedor AND Insumo_id=id_insumo;
        SET msg = concat("Se ha eliminado correctamente elinsumo con id", id_insumo, "y correspondiente al proveedor",id_proveedor);
        SET resultado = 0;
        END IF;
END