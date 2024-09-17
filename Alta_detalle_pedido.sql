CREATE DEFINER=`root`@`localhost` PROCEDURE `Alta_detalle_pedido`(IN nombre_pedido VARCHAR(255),IN pedido_id INT,IN modelo_id INT,IN cantidad INT, OUT resultado INT, OUT msg VARCHAR(400))
BEGIN
	IF ((select count(*) from detalle_pedido where Pedido_id=pedido_id)!=0) THEN
		SET msg = concat("Ya existe un pedido con la misma cabecera");
        SET resultado = -1;
	ELSEIF ((select count(*) from pedido where id=pedido_id)=0) THEN
		SET msg = concat("No existe la cabecera con id",pedido_id);
        SET resultado = -1;
	ELSE
		insert into detalle_pedido (name,Pedido_id,Modelo_id,Cantidad) values (nombre_pedido,pedido_id,modelo_id,cantidad);
		SET msg = concat("Se ha agregado correctamente el pedido");
        SET resultado = 0;
END IF;
END