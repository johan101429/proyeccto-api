# crear base de datos db_arriendos
create database db_arriendos;
# usar base de datos
use db_arriendos;
# crear tabla departamento
create table departamento(
	id_departamento int primary key not null,
    nom_departamento varchar(100) not null
);
insert into departamento(id_departamento,nom_departamento)values (8,'valle del cauca'),(9,'meta'),(10,'huila'); 
# crear tabla ciudad
create table ciudad(
	id_ciudad int primary key not null,
    nom_ciudad varchar(100) not null,
    cod_departamento int not null,
    foreign key(cod_departamento) references departamento(id_departamento)
);
insert into ciudad(id_ciudad,nom_ciudad,cod_departamento)values (1,'armenia','1'),(2,'melgar','2'),(3,'bogota','3'),(4,'cali','4'),(5,'tumaco','5'),(6,'soledad','6'),(7,'cartagena','7'),(8,'buenaventura','8'),(9,'granada','9'),(10,'pitalito','10'); 

#delete from ciudad where id_ciudad = 7;
create table propietario(
id_propietario int primary key not null,
primer_nombre varchar(100),
segundo_nombre varchar(100),
primer_apellido varchar(100),
segundo_apellido varchar(100),
telefono_fijo varchar(20),
numero_celular varchar(20),
email varchar(100)

);
insert into propietario(id_propietario,primer_nombre,segundo_nombre,primer_apellido,segundo_apellido,telefono_fijo,numero_celular,email)values (3, 'mauricio','andres','martines','gonzales', '3126852139','6067367709','mauriio@gmail.com'),
(4, 'maria','camila','restrepo','arce', '3128904576','6067341238','camila.restrepo@gmail.com'),
(5, 'flora','maria','torrez','loaiza', '3126452139','6067368909','andres.felipe@gmail.com'),
(6, 'sandra','patricia','gomez','jimenes', '3112346781','6067349089','spgj@gmail.com'),
(7, 'alejandra','andrea','martines','perez', '310123471','6067368909','aleandre@gmail.com'),
(8, 'jose','eliecer','buitrago','nieto', '3109137866','6067443319','joeliecere@gmail.com'),
(9, 'leandro','jose','zamora','sinisterra', '3153467210','6067459056','leandrozs@gmail.com'),
(10, 'joel','felipe','martines','quintero', '3189056431','6067447519','joelquintero@gmail.com');

create table inquilino(
	id_inquilino int primary key not null,
    primer_nombre varchar(50) not null,
    segundo_nombre varchar(50) not null,
    primer_apellido varchar(50) not null,
    segundo_apellido varchar(50) not null,
    telefono_fijo varchar(20)  null,
	numero_celular varchar(20) null,
	email varchar(100) null
);
insert into inquilino(id_inquilino,primer_nombre,segundo_nombre,primer_apellido,segundo_apellido,telefono_fijo,numero_celular,email)values
(1, 'jorge','andres','martines','rojas', '3126342139','6067361209','jorgea@gmail.com'),
(2, 'rosa','maria','paez','arcila', '3128945576','6067342338','mariarosa@gmail.com'),
(3, 'julian','andres','torrez','devia', '3126449139','6067468909','juliandres@gmail.com'),
(4, 'marcos ','patricio','arango','palacio', '3112343481','6067342389','marcospinto@gmail.com'),
(5, 'alejandro','jose','martines','rendon', '3101234717','6067368309','joseale@gmail.com'),
(6, 'carlos','eliecer','ospina','ospina', '3109147866','6067449319','eliecercar@gmail.com'),
(7, 'santiago','alejandro','zamora','cifuentes', '3153237210','6067458056','santiale@gmail.com'),
(8, 'alejandra','maria','muños','quintero', '3187556431','6067443419','mariaaleja@gmail.com'),
(9, 'jenny','patricia','alarcon','arcila', '3153411210','6067456056','jnpatri@gmail.com'),
(10, 'andres','felipe','pinina','rosas', '3153237210','6067453656','afps@gmail.com');
create table vivienda(
id_vivienda int primary key not null,
direccion varchar(100) not null,
cant_habitantes smallint,
descripcion varchar(100),
cod_propietario int not null,
cod_ciudad int not null,
foreign key(cod_propietario) references propietario(id_propietario),
foreign key(cod_ciudad) references ciudad(id_ciudad)
);

insert into vivienda(id_vivienda,direccion,cant_habitantes,descripcion,cod_propietario,cod_ciudad)values
(1, 'calle 29 # 12-45','2','casas de dos piso 4 cuartos','10', '1'),
(2, 'carrera 14 # 14-01','3','apartamento amoblado con buena vista ', '9','2'),
(3, 'edificio andres','1','apartaestudio bien ubicado', '8','3'),
(4, 'carrera 15 # 15-89 ','4','linda casa bien ubicada buen sector', '7','4'),
(5, 'condominio las lomas', '3','buena casa ubicada en conjunto cerrado','6','5'),
(6, 'calle 45 # 50-21','3','casa bien economica y en buen lugar ','5', '6'),
(7, 'edificio soler ','2','hermoso apartamento para estrenar ', '4','7'),
(8, 'carrera 12 # 12-11','3','casa con 3 cuartos bien ubicada', '3','8'),
(9, 'urbanizacion la pradera','4','casa ubicada en el norte de la ciudad', '2','9'),
(10, 'carrera 11 # 22-89','5','casa grande ubicada en el centro dela ciudad','1', '10');
 create table arriendo(
 id_arriendo int primary key not null,
 fecha_inicio date not null,
 fecha_final date not null,
 valor_mensual float not  null,
 cod_vivienda int not null,
 foreign key(cod_vivienda) references vivienda(id_vivienda)
 );
 insert into arriendo(id_arriendo,fecha_inicio,fecha_final,valor_mensual,cod_vivienda)values
 (1,'2020-03-01','2021-01-25','900000.00','10'),
 (2, '2021-04-12','2022-04-29','1000000','9'),
(3, '2022-05-4','2023-12-12','1100000','8'),
(4, '2022-10-21','2023-11-10','800000','7'),
(5, '2020-09-04','2021-10-11','950000','6'),
(6, '2023-08-17','2023-12-09','1000000','5'),
(7, '2021-09-29','2022-10-08','900000','4'),
(8, '2022-10-01','2023-01-01','1000000','3'),
(9, '2020-04-19','2020-08-04','980000','2'),
(10,'2023-02-28','2023-06-25','1200000','1');
 
 
create table arriendo_inquilinos (
    cod_arriendo int not null,
    cod_inquilino int not null,
    primary key(cod_arriendo, cod_inquilino),
    foreign key(cod_arriendo) references arriendo(id_arriendo),
   foreign key(cod_inquilino) references inquilino(id_inquilino)
);

insert into arriendo_inquilinos(id_arriendo,fecha_inicio,fecha_final,valor_mensual,cod_vivienda)values
();


# modificar tabla
#alter table vivienda add constraint fk_vivienda_propietario foreign key (
#id_propietario) references propietario(id_propietario);

# alterar campo celular
alter table propietario modify column numero_celular varchar(50);
alter table propietario add column celular2 varchar(50);
alter table propietario add constraint uk_email unique(email);
# visualizar tabla en la  base de datos 
show tables;
# visualizar composicion de la tabla clear
select*from departamento;
select*from propietario;
select*from ciudad;
select*from inquilino;
select*from vivienda;
select*from arriendo;
select*from propietario where segundo_nombre = 'felipe' ;
select primer_nombre from propietario where id_propietario = 4;
select primer_nombre,numero_celular,telefono_fijo from propietario where primer_apellido ='martines' or segundo_apellido = 'martines';