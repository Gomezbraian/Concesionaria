CREATE DEFINER=`root`@`localhost` PROCEDURE `Alta_pedido`(IN nombre_pedido VARCHAR(255),IN id_concesionaria INT, OUT resultado INT, OUT msg VARCHAR(400))
BEGIN
		insert INTO pedido(name,Concesionaria_id)
        values(nombre_pedido,id_concesionaria);
		SET msg = concat("Se ha creado correctamente el pedido ", nombre_pedido, "para la concesionaria", id_concesionaria);
        SET resultado = 0;
END