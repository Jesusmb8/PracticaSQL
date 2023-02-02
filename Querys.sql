
-- dt_baja vacío para indicar que está activo


-- obtener último por fecha.
-- a: coche
-- b: modelos
-- c: marcas
-- d: grupos
-- e: color
select a.dt_compra, a.matricula,a.total_km,b.nombre,c.nombre,d.nombre,e.nombre  
from practica.coches a 
inner join practica.modelos b on a.id_modelo = b.id_modelo
inner join practica.marcas c on  c.id_marca = b.id_marca
inner join practica.grupos d on  d.id_grupo = c.id_grupo
inner join practica.colores e on e.id_color = a.id_color 
where a.dt_baja is null ;