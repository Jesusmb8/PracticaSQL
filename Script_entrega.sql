--Borramos todo
drop schema if exists PRACTICA CASCADE;


create schema PRACTICA authorization oxalmonf;

-- Creamos tabla monedas
create table practica.monedas(
 	id_moneda varchar(10) not null, --PK 
 	nombre varchar(50) not null,
 	simbolo varchar(2) not null
); 

alter table practica.monedas
add constraint id_moneda_PK primary key (id_moneda);


-- Creamos la tabla colores
create table practica.colores(
 	id_color varchar(10) not null, --PK 
 	nombre varchar(50) not null
); 
alter  table practica.colores
add constraint id_color_PK primary key (id_color);


-- Revisiones

create table practica.revisiones(
 	id_revision varchar(20) not null, --PK 
 	dt_revision date not null,
 	importe numeric(9,2) not null,
 	id_moneda varchar(10) not null, --FK
 	km integer not null,
 	descripcion varchar(500) null
);

--PK
alter  table practica.revisiones
add constraint id_revision_PK primary key (id_revision);

--FK
alter  table practica.revisiones
add constraint id_moneda_FK foreign key(id_moneda)
references practica.monedas(id_moneda);


--select * from practica.revisiones;


-- Grupos
create table practica.grupos(
 	id_grupo varchar(10) not null, --PK 
 	nombre varchar(50) not null
); 
alter  table practica.grupos
add constraint id_grupo_PK primary key (id_grupo);


--select * from practica.grupos;

-- Marcas
create table practica.marcas(
	id_marca varchar(10) not null, --PK
	nombre varchar(20) not null,
	id_grupo varchar(10) not null --FK
);

alter table practica.marcas
add constraint id_marca_PK primary key(id_marca);


alter table practica.marcas
add constraint id_grupo_FK foreign key (id_grupo)
references practica.grupos(id_grupo);


--select * from practica.marcas;


-- Modelos

create table practica.modelos(
	id_modelo varchar(10) not null,--PK
	nombre	varchar(100) not null,
	id_marca varchar(10) not null --FK
);

alter table practica.modelos
add constraint id_modelo_PK primary key(id_modelo);


alter table practica.modelos
add constraint id_marca_FK foreign key (id_marca)
references practica.marcas(id_marca);


--select * from practica.modelos;


-- Coches

create table practica.coches(
	id_coche varchar(20) not null,--PK
	id_color varchar(10) not null,--FK
	nombre varchar(30) not null,
	matricula varchar(10) not null,
	id_modelo varchar(10) not null,--FK
	dt_compra date not null,
	dt_baja date null	
);

alter table practica.coches
add constraint id_coche_PK primary key(id_coche);


alter table practica.coches
add constraint id_color_FK foreign key (id_color)
references practica.colores(id_color);

alter table practica.coches
add constraint id_modelo_FK foreign key (id_modelo)
references practica.modelos(id_modelo);


-- Aseguradoras

create table practica.aseguradoras(
	id_aseguradora varchar(10) not null,--PK
	nombre varchar(30) not null
);

alter table practica.aseguradoras
add constraint id_aeguradora_PK primary key(id_aseguradora);

--select * from practica.aseguradoras;

--Polizas

create table practica.polizas(
	id_poliza varchar(20) not null,--PK	
	id_aseguradora varchar(10) not null,--FK
	precio numeric(9,2) not null,
	id_moneda varchar(10) not null -- FK
);

alter table practica.polizas
add constraint polizas_PK primary key(id_poliza);

alter table practica.polizas 
add constraint id_aseguradora_FK foreign key (id_aseguradora)
references practica.aseguradoras(id_aseguradora);

alter table practica.polizas 
add constraint id_moneda_FK foreign key (id_moneda) 
references practica.monedas(id_moneda);

-- Historico de polizas
create  table practica.historico_coches_polizas(
	id_coche varchar(20) not null, --PK FK
	id_poliza varchar(20) not null ,--PK FK
	dt_alta date not null, --PK
	dt_baja date null
 );
 
 
alter table practica.historico_coches_polizas
add constraint historico_coches_polizas_PK primary key(id_coche,id_poliza,dt_alta);

alter table practica.historico_coches_polizas 
add constraint id_coche_FK foreign key (id_coche)
references practica.coches(id_coche);

alter table practica.historico_coches_polizas 
add constraint id_poliza_FK foreign key (id_poliza)
references practica.polizas(id_poliza);


-- Histórico de revisiones

create table practica.historico_coches_revisiones(
    id_coche varchar(20) not null, --PK FK
	id_revision varchar(20) not null --PK FK
);

alter table practica.historico_coches_revisiones
add constraint historico_coches_revisiones_PK primary key(id_coche,id_revision);

alter table practica.historico_coches_revisiones 
add constraint id_coche_FK foreign key (id_coche)
references practica.coches(id_coche);

alter table practica.historico_coches_revisiones 
add constraint id_revision_FK foreign key (id_revision)
references practica.revisiones(id_revision);





--  CARGA DE DATOS --

--Crear datos

-- Insertamos monedas
insert into practica.monedas 
(id_moneda,nombre,simbolo)
values('M-01','Euro','€');

insert into practica.monedas 
(id_moneda,nombre,simbolo)
values('M-02','Dólar','$');

--Insertamos colores

insert into practica.colores
(nombre,id_color)
values('rojo','C-01');
insert into practica.colores
(nombre,id_color)
values('verde','C-02');
insert into practica.colores
(nombre,id_color)
values('azul','C-03');

insert into practica.colores
(nombre,id_color)
values('gris','C-04');

insert into practica.colores
(nombre,id_color)
values('amarillo','C-05');

insert into practica.colores
(nombre,id_color)
values('blanco','C-06');

insert into practica.colores
(nombre,id_color)
values('negro','C-07');

-- Insertamos grupos


insert into practica.grupos
(id_grupo,nombre)
values ('G-001','BMW Group');

insert into practica.grupos
(id_grupo,nombre)
values ('G-002','Daimler');

insert into practica.grupos
(id_grupo,nombre)
values ('G-003','FCA');


-- Insertamos marcas

insert into practica.marcas 
(id_marca,nombre,id_grupo)
values ('MG-001','BMW','G-001');

insert into practica.marcas 
(id_marca,nombre,id_grupo)
values ('MG-002','Mini','G-001');

insert into practica.marcas 
(id_marca,nombre,id_grupo)
values ('MG-003','Rolls Royce','G-001');

-- Insertamos modelos

insert into practica.modelos 
(id_modelo,nombre,id_marca)
values ('MD-001','Serie 1','MG-001');

insert into practica.modelos 
(id_modelo,nombre,id_marca)
values ('MD-002','Serie 2','MG-001');

insert into practica.modelos 
(id_modelo,nombre,id_marca)
values ('MD-003','Serie 3','MG-001');

insert into practica.modelos 
(id_modelo,nombre,id_marca)
values ('MD-004','Serie 4','MG-001');

insert into practica.modelos 
(id_modelo,nombre,id_marca)
values ('MD-005','Serie 5','MG-001');

insert into practica.modelos 
(id_modelo,nombre,id_marca)
values ('MD-007','Serie 7','MG-001');

insert into practica.modelos 
(id_modelo,nombre,id_marca)
values ('MD-008','Serie X4','MG-001');

insert into practica.modelos 
(id_modelo,nombre,id_marca)
values ('MD-009','Serie X6','MG-001');

insert into practica.modelos 
(id_modelo,nombre,id_marca)
values ('MD-010','Serie i8','MG-001');

-- Insertamos coches

insert into practica.coches 
(id_coche,id_color,nombre,matricula,id_modelo,dt_compra,dt_baja)
values ('C-00001','C-03','Coche 1','8881kkk','MD-002','01/01/2019',null);

insert into practica.coches 
(id_coche,id_color,nombre,matricula,id_modelo,dt_compra,dt_baja)
values ('C-00002','C-01','Coche 2','8882kkk','MD-001','01/01/2019',null);

insert into practica.coches 
(id_coche,id_color,nombre,matricula,id_modelo,dt_compra,dt_baja)
values ('C-00003','C-05','Coche 3','8883kkk','MD-010','01/01/2019',null);

insert into practica.coches 
(id_coche,id_color,nombre,matricula,id_modelo,dt_compra,dt_baja)
values ('C-00004','C-04','Coche 4','8884kkk','MD-001','01/01/2019','01/01/2020');

-- Insertamos aseguradoras

insert into practica.aseguradoras
(id_aseguradora,nombre)
values('ASE-0001','Mapfre');

insert into practica.aseguradoras
(id_aseguradora,nombre)
values('ASE-0002','Línea directa');

-- Insertar polizas
insert into practica.polizas 
(id_poliza,id_aseguradora,precio,id_moneda)
values('P-0001','ASE-0001','400.50','M-01');

insert into practica.polizas 
(id_poliza,id_aseguradora,precio,id_moneda)
values('P-0002','ASE-0001','430.50','M-01');

insert into practica.polizas 
(id_poliza,id_aseguradora,precio,id_moneda)
values('P-0003','ASE-0001','280.30','M-01');

insert into practica.polizas 
(id_poliza,id_aseguradora,precio,id_moneda)
values('P-0004','ASE-0002','400.50','M-02');

insert into practica.polizas 
(id_poliza,id_aseguradora,precio,id_moneda)
values('P-0005','ASE-0002','430.50','M-02');

insert into practica.polizas 
(id_poliza,id_aseguradora,precio,id_moneda)
values('P-0006','ASE-0002','280.30','M-02');

-- Insertar histórico de polizas

insert into practica.historico_coches_polizas 
(id_coche,id_poliza,dt_alta,dt_baja)
values ('C-00001','P-0001','01/01/2023',null);

insert into practica.historico_coches_polizas 
(id_coche,id_poliza,dt_alta,dt_baja)
values ('C-00001','P-0001','01/01/2022','12/31/2022');

insert into practica.historico_coches_polizas 
(id_coche,id_poliza,dt_alta,dt_baja)
values ('C-00002','P-0002','01/01/2023',null);

insert into practica.historico_coches_polizas 
(id_coche,id_poliza,dt_alta,dt_baja)
values ('C-00003','P-0003','01/01/2023',null);

insert into practica.historico_coches_polizas 
(id_coche,id_poliza,dt_alta,dt_baja)
values ('C-00004','P-0004','01/01/2023',null);


-- Insertamos revisiones
insert into practica.revisiones
(id_revision,dt_revision,importe,id_moneda,km,descripcion)
values('R-00001','01/01/2021','350.92','M-01','5000','Cambio de aceite');

insert into practica.revisiones
(id_revision,dt_revision,importe,id_moneda,km,descripcion)
values('R-00005','03/01/2022','400.92','M-01','15000','Revisión completa');

insert into practica.revisiones
(id_revision,dt_revision,importe,id_moneda,km,descripcion)
values('R-00006','05/01/2022','800.92','M-01','30000','Revisión completa con cambio de ruedas');

insert into practica.revisiones
(id_revision,dt_revision,importe,id_moneda,km,descripcion)
values('R-00007','07/01/2022','800.92','M-01','35000','Pintura y cambio de luna');

insert into practica.revisiones
(id_revision,dt_revision,importe,id_moneda,km,descripcion)
values('R-00002','01/02/2023','330.32','M-01','5000','Cambio de aceite');

insert into practica.revisiones
(id_revision,dt_revision,importe,id_moneda,km,descripcion)
values('R-00003','01/02/2020','730.32','M-01','10000','Revisión completa');

insert into practica.revisiones
(id_revision,dt_revision,importe,id_moneda,km,descripcion)
values('R-00008','07/01/2021','1800.92','M-01','20000','Cambio de baterías');

insert into practica.revisiones
(id_revision,dt_revision,importe,id_moneda,km,descripcion)
values('R-00009','04/01/2022','1800.92','M-01','30000','Fallo electrónico y cambio de pastillas de freno');

insert into practica.revisiones
(id_revision,dt_revision,importe,id_moneda,km,descripcion)
values('R-00004','01/08/2023','339.02','M-01','10000','Cambio de ruedas');

-- Insertar histórico de revisiones

insert into practica.historico_coches_revisiones 
(id_coche,id_revision)
values('C-00001','R-00001');

insert into practica.historico_coches_revisiones 
(id_coche,id_revision)
values('C-00001','R-00005');

insert into practica.historico_coches_revisiones 
(id_coche,id_revision)
values('C-00001','R-00006');

insert into practica.historico_coches_revisiones 
(id_coche,id_revision)
values('C-00001','R-00007');

insert into practica.historico_coches_revisiones 
(id_coche,id_revision)
values('C-00002','R-00002');

insert into practica.historico_coches_revisiones 
(id_coche,id_revision)
values('C-00003','R-00008');

insert into practica.historico_coches_revisiones 
(id_coche,id_revision)
values('C-00003','R-00009');

insert into practica.historico_coches_revisiones 
(id_coche,id_revision)
values('C-00003','R-00003');

insert into practica.historico_coches_revisiones 
(id_coche,id_revision)
values('C-00004','R-00004');



-- QUERY --


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

