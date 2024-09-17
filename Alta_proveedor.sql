CREATE DEFINER=`root`@`localhost` PROCEDURE `Alta_proveedor`(IN nombre_proveedor VARCHAR(255), OUT resultado INT, OUT msg VARCHAR(350))
BEGIN
	IF ((select count(*) from proveedor where name=nombre_proveedor)!=0) THEN
		SET msg = concat("Ya existe un proveedor llamado ", nombre_proveedor);
        SET resultado = -1;
	ELSE
		insert INTO proveedor(name)
        values(nombre_proveedor);
		SET msg = concat("Se ha creado correctamente un proveedor llamado ", nombre_proveedor);
        SET resultado = 0;
    END IF;
END