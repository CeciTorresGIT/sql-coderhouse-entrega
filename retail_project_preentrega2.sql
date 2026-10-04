create table clientes (
	id_cliente serial primary key,
	nombre varchar (100) not null,
	email varchar (150) unique not null,
	edad integer check (edad >= 18)
);

create table productos (
	id_producto serial primary key,
	nombre varchar (100) not null,
	categoria varchar (50) not null,
	precio decimal (10,2) check (precio > 0),
	stock integer check (stock >= 0)
);

create table ventas (
	 id_venta serial primary key,
	 id_cliente integer not null,
 	id_producto integer not null,
 	cantidad integer check (cantidad > 0),
 	precio_unitario decimal (10,2) check (precio_unitario > 0),
 	fecha_venta date not null, 
 	foreign key (id_cliente) references clientes (id_cliente),
 	foreign key (id_producto) references productos (id_producto)
 );
 
begin;

insert into clientes (nombre, email, edad)
values 
    ('Juan Pérez', 'juan.perez@email.com', 30),
    ('María Gómez', 'maria.gomez@email.com', 25),
    ('Carlos Rodríguez', 'carlos.rodriguez@email.com', 42),
    ('Lucía Fernández', 'lucia.fernandez@email.com', 35),
    ('Diego Martínez', 'diego.martinez@email.com', 28);

insert into productos (nombre, categoria, precio, stock)
values 
	('Notebook Lenovo', 'Tecnología', 850000.00, 10),
	('Mouse Logitech', 'Tecnología', 25000.00, 25),
	('Teclado Redragon', 'Tecnología', 45000.00, 15),
	('Silla de escritorio', 'Muebles', 180000.00, 8),
	('Escritorio', 'Muebles', 250000.00, 5);

insert into ventas (id_cliente, id_producto, cantidad, precio_unitario, fecha_venta)
values
	(1, 1, 1, 850000.00, '2026-09-25'),
	(2, 2, 2, 25000.00, '2026-09-26'),
	(3, 3, 1, 45000.00, '2026-09-27'),
	(4, 4, 1, 180000.00, '2026-09-28'),
	(5, 5, 2, 250000.00, '2026-09-29');

commit;

select * from clientes c;
select * from productos p;
select * from ventas v;

select *
from productos p 
where categoria = 'Tecnología';

update productos p 
set precio = precio * 1.10
where categoria = 'Tecnología';

select *
from ventas v 
where id_venta = 5; 

delete from ventas 
where id_venta = 5;


