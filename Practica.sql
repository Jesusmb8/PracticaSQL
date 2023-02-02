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

insert into practica.monedas 
(id_moneda,nombre,simbolo)
values('M-01','Euro','€');

insert into practica.monedas 
(id_moneda,nombre,simbolo)
values('M-02','Dólar','$');


-- Creamos la tabla colores
create table practica.colores(
 	id_color varchar(10) not null, --PK 
 	nombre varchar(50) not null
); 
alter  table practica.colores
add constraint id_color_PK primary key (id_color);

insert into practica.colores
(nombre,id_color)
values('rojo','C-01');
insert into practica.colores
(nombre,id_color)
values('verde','C-02');
insert into practica.colores
(nombre,id_color)
values('azul','C-03');

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

insert into practica.revisiones
(id_revision,dt_revision,importe,id_moneda,km,descripcion)
values('R-00001','01/01/2000','350.92','M-01','5000','Cambio de aceite');

--select * from practica.revisiones;


-- Grupos
create table practica.grupos(
 	id_grupo varchar(10) not null, --PK 
 	nombre varchar(50) not null
); 
alter  table practica.grupos
add constraint id_grupo_PK primary key (id_grupo);

insert into practica.grupos
(id_grupo,nombre)
values ('G-001','BMW Group');

insert into practica.grupos
(id_grupo,nombre)
values ('G-002','Daimler');

insert into practica.grupos
(id_grupo,nombre)
values ('G-003','FCA');

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

insert into practica.marcas 
(id_marca,nombre,id_grupo)
values ('MG-001','BMW','G-001');

insert into practica.marcas 
(id_marca,nombre,id_grupo)
values ('MG-002','Mini','G-001');

insert into practica.marcas 
(id_marca,nombre,id_grupo)
values ('MG-003','Rolls Royce','G-001');

-- TODO: añadir más marcas

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

insert into practica.modelos 
(id_modelo,nombre,id_marca)
values ('MD-001','Serie 3','MG-001');
insert into practica.modelos 
(id_modelo,nombre,id_marca)
values ('MD-002','Serie 4','MG-001');
insert into practica.modelos 
(id_modelo,nombre,id_marca)
values ('MD-003','Serie 7','MG-001');

--select * from practica.modelos;


-- Coches

create table practica.coches(
	id_coche varchar(20) not null,--PK
	id_color varchar(10) not null,--FK
	nombre varchar(30) not null,
	matricula varchar(10) not null,
	id_modelo varchar(10) not null,--FK
	total_km varchar(10) not null,
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

insert into practica.coches 
(id_coche,id_color,nombre,matricula,id_modelo,total_km,dt_compra)
values ('C-00001','C-03','Coche CEO','8888kkk','MD-002','1000','01/01/2008');

-- Aseguradoras

create table practica.aseguradoras(
	id_aseguradora varchar(10) not null,--PK
	nombre varchar(30) not null
);

alter table practica.aseguradoras
add constraint id_aeguradora_PK primary key(id_aseguradora);

insert into practica.aseguradoras
(id_aseguradora,nombre)
values('ASE-0001','Mapfre');

insert into practica.aseguradoras
(id_aseguradora,nombre)
values('ASE-0002','Línea directa');

--select * from practica.aseguradoras;

--Polizas

create table practica.polizas(
	id_poliza varchar(20) not null,--PK	
	id_aseguradora varchar(10) not null,--FK
	precio numeric(9,2) not null,
	id_moneda varchar(10) not null, -- FK
	dt_alta date not null,
	dt_baja date null
);

alter table practica.polizas
add constraint polizas_PK primary key(id_poliza, id_aseguradora);

/*alter table practica.polizas 
add constraint id_aseguradora_FK foreign key (id_aseguradora)
references practica.aseguradoras(id_aseguradora);*/

alter table practica.polizas 
add constraint id_moneda_FK foreign key (id_moneda) 
references practica.monedas(id_moneda);

-- Historico de polizas
create  table practica.historico_coches_polizas(
	id_coche varchar(20) not null, --PK FK
	id_poliza varchar(20) not null --PK FK
 );
 
 
alter table practica.historico_coches_polizas
add constraint historico_coches_polizas_PK primary key(id_coche,id_poliza);

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


