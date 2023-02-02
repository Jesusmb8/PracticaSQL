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
(id_coche,id_color,nombre,matricula,id_modelo,total_km,dt_compra,dt_baja)
values ('C-00001','C-03','Coche 1','8881kkk','MD-002','1000','01/01/2008',null);

insert into practica.coches 
(id_coche,id_color,nombre,matricula,id_modelo,total_km,dt_compra,dt_baja)
values ('C-00002','C-01','Coche 2','8882kkk','MD-001','1000','01/01/2008',null);

insert into practica.coches 
(id_coche,id_color,nombre,matricula,id_modelo,total_km,dt_compra,dt_baja)
values ('C-00003','C-05','Coche 3','8883kkk','MD-010','1200','01/01/2008',null);

insert into practica.coches 
(id_coche,id_color,nombre,matricula,id_modelo,total_km,dt_compra,dt_baja)
values ('C-00004','C-04','Coche 4','8884kkk','MD-001','1700','01/01/2008','01/01/2010');

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
values('R-00001','01/01/2023','350.92','M-01','5000','Cambio de aceite');

insert into practica.revisiones
(id_revision,dt_revision,importe,id_moneda,km,descripcion)
values('R-00005','03/01/2023','400.92','M-01','15000','Revisión completa');

insert into practica.revisiones
(id_revision,dt_revision,importe,id_moneda,km,descripcion)
values('R-00002','01/02/2023','330.32','M-01','5000','Cambio de aceite');

insert into practica.revisiones
(id_revision,dt_revision,importe,id_moneda,km,descripcion)
values('R-00003','01/02/2023','730.32','M-01','10000','Revisión completa');

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
values('C-00002','R-00002');

insert into practica.historico_coches_revisiones 
(id_coche,id_revision)
values('C-00003','R-00003');

insert into practica.historico_coches_revisiones 
(id_coche,id_revision)
values('C-00004','R-00004');
