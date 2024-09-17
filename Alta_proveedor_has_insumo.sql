CREATE DEFINER=`root`@`localhost` PROCEDURE `Alta_proveedor_has_insumo`(IN id_proveedor INT, IN id_insumo INT,IN precio FLOAT, OUT resultado INT, OUT msg VARCHAR(400))
BEGIN
		IF ((SELECT count(*) FROM proveedor_has_insumo WHERE Proveedor_id=id_proveedor AND Insumo_id=id_insumo)!=0) THEN
        SET msg = concat("El insumo con el id ", id_insumo, " y proveedor ",id_proveedor, " ya existen en la tabla");
        SET resultado = -1;
        ELSE 
		INSERT into proveedor_has_insumo (Proveedor_id,Insumo_id,Precio) values (id_proveedor,id_insumo,precio);
        SET msg = concat("Se ha ingresado correctamente el insumo con id ", id_insumo, " y correspondiente al proveedor ",id_proveedor);
        SET resultado = 0;
        END IF;
END