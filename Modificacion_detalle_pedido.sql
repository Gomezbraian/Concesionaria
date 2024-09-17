CREATE DEFINER=`root`@`localhost` PROCEDURE `Modificacion_detalle_pedido`(IN id_detalle INT,IN nuevo_nombre_pedido VARCHAR(255), IN nueva_cantidad INT, OUT resultado INT, OUT msg VARCHAR(400))
BEGIN
	IF ((select count(*) from detalle_pedido where id=id_detalle)=0) THEN
		SET msg = concat("No existe el detalle_pedido con el id",id_detalle);
        SET resultado = -1;
	ELSE
		update detalle_pedido set name=nuevo_nombre_pedido, Cantidad=nueva_cantidad where id=id_detalle;
		SET msg = concat("Se ha modificado correctamente el detalle_pedido con el id",id_detalle);
        SET resultado = 0;
END IF;
END