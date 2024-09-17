CREATE DEFINER=`root`@`localhost` PROCEDURE `Alta_insumo`(IN nombre_insumo VARCHAR(255), OUT resultado INT, OUT msg VARCHAR(350))
BEGIN
	IF ((select count(*) from insumo where name=nombre_insumo)!=0) THEN
		SET msg = concat("Ya existe un insumo llamado ", nombre_insumo);
        SET resultado = -1;
	ELSE
		insert INTO insumo(name)
        values(nombre_insumo);
		SET msg = concat("Se ha creado correctamente un insumo llamado ", nombre_insumo);
        SET resultado = 0;
    END IF;
END