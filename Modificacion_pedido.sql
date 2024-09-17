CREATE DEFINER=`root`@`localhost` PROCEDURE `Modificacion_pedido`(IN id_pedido INT,IN nuevo_nombre_pedido VARCHAR(255), OUT resultado INT, OUT msg VARCHAR(350))
BEGIN
IF ((select count(*) from pedido where id=id_pedido)=0) THEN
		SET msg = concat("No existe ningun pedido con el id ", id_pedido);
        SET resultado = -1;
	ELSE
		update pedido set name=nuevo_nombre_pedido where id=id_pedido;
		SET msg = concat("Se ha modificado correctamente el pedido con el id", id_pedido);
        SET resultado = 0;
END IF;
END