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


