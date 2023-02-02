
-- dt_baja vacío para indicar que está activo


-- obtener último por fecha.

-- a: coche
-- b: modelos
-- c: marcas
-- d: grupos
-- e: color
-- f: historico_coches_polizas
-- g: polizas
-- h: aseguradora
-- i: historico coches revisiones
-- j: revisiones 


select b.nombre as "Nombre modelo", c.nombre as "Marca",d.nombre as "Grupo", a.dt_compra as "Fecha de compra" , a.matricula as "Matrícula" ,e.nombre  as Color,
	  max(j.km) as "Total km", h.nombre as "Aseguradora",g.id_poliza as "Número de poliza"
from practica.coches a 
inner join practica.modelos b on a.id_modelo = b.id_modelo
inner join practica.marcas c on  c.id_marca = b.id_marca
inner join practica.grupos d on  d.id_grupo = c.id_grupo
inner join practica.colores e on e.id_color = a.id_color 
inner join practica.historico_coches_polizas f on f.id_coche  = a.id_coche  
inner join practica.polizas g on g.id_poliza  = f.id_poliza  
inner join practica.aseguradoras h on h.id_aseguradora  = g.id_aseguradora  
inner join practica.historico_coches_revisiones i on i.id_coche  = a.id_coche 
inner join practica.revisiones j on j.id_revision = i.id_revision 
where a.dt_baja is null 
	and f.dt_baja is null	
group by a.id_coche,b.nombre,c.nombre,d.nombre,e.nombre,f.dt_baja,g.id_poliza,h.nombre;

