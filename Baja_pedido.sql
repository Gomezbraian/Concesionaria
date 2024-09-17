CREATE DEFINER=`root`@`localhost` PROCEDURE `Baja_pedido`(IN id_a_eliminar int, OUT resultado INT, OUT msg VARCHAR(350))
BEGIN
	IF ((select count(*) from pedido where id=id_a_eliminar)=0) THEN
		SET msg = concat("No existe el pedido con el id", id_a_eliminar);
        SET resultado = -1;
	ELSEIF ((select count(*) from detalle_pedido where Pedido_id=id_a_eliminar)!=0) THEN
		SET msg = concat("La cabecera del pedido", id_a_eliminar," está asociada a un pedido en la tabla detalle_pedido");
        SET resultado = -1;
	ELSE
		delete from pedido where id=id_a_eliminar;
		SET msg = concat("Se ha eliminado correctamente el pedido con el id ", id_a_eliminar);
        SET resultado = 0;
    END IF;
END