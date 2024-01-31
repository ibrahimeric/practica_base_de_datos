create database if not exists tplab071123;

create table if not exists clientes (
  idCliente int auto_increment primary key not null,
  nombre varchar(45) not null,
  apellido varchar(45) not null,
  fecha_nacimiento varchar(45) not null,
  direccion text
);

create table if not exists productos (
  idProducto int auto_increment primary key not null,
  nombre varchar(45) not null,
  precio decimal(18,2) not null
);

create table if not exists ventas (
  idVenta int auto_increment primary key not null,
  fecha date not null,
  idCliente int not null,
  foreign key (idCliente) references clientes(idCliente)
);

create table if not exists detalleventa (
  idDetalle int auto_increment primary key not null,
  idVenta int not null,
  idProducto int not null,
  cantidad int not null,
  descuento decimal(18,2)
);


alter table detalleventa
add foreign key (idVenta) references ventas(idVenta),
add foreign key (idProducto) references productos(idProducto);


INSERT INTO clientes (nombre, apellido, fecha_nacimiento, direccion)
VALUES
    ('Juan', 'Perez', '1990-03-15', 'Calle 123, Ciudad A'),
    ('Maria', 'Gomez', '1985-07-20', 'Avenida 456, Ciudad B'),
    ('Carlos', 'Rodriguez', '1992-11-10', 'Calle 789, Ciudad C'),
    ('Laura', 'Lopez', '1988-05-02', 'Calle 456, Ciudad A'),
    ('Pedro', 'Martinez', '1998-09-25', 'Avenida 123, Ciudad B');
    
    
INSERT INTO productos (nombre, precio)
VALUES
    ('Producto A', 19.99),
    ('Producto B', 29.99), 
    ('Producto C', 9.99),
    ('Producto D', 49.99),
    ('Producto E', 14.99);


INSERT INTO ventas (fecha, idCliente)
VALUES
    ('2023-11-01', 1),
    ('2023-11-02', 2),
    ('2023-11-03', 3),
    ('2023-11-04', 4),
    ('2023-11-05', 5);
    

INSERT INTO detalleventa (cantidad, descuento, IdVenta, IdProducto)
VALUES
    (3, 0.10, 1, 1),
    (2, 0.05, 2, 2),
    (4, 0.15, 3, 3),
    (1, 0.00, 4, 4),
    (5, 0.20, 5, 5);



/* delete from clientes; */

/* select * from clientes;

select * from productos;

select * from ventas;

select * from detalleventa; */

/* a) Aplicar la cláusula Where y obtener todas las ventas realizadas en una determinada fecha. */
/* select * from ventas where fecha = '2023-11-02'; */


/* b) Obtener los clientes que realizaron las compras en una determinada fecha y que producto compraron en la misma. */
/* select c.nombre, c.apellido, v.fecha, p.nombre
from clientes c
join ventas v on c.idCliente = v.idVenta
join productos p on c.idCliente = p.idProducto; */



/* c) Obtener la cantidad de productos comprados por un cliente particular.  */
/* select c.nombre, c.apellido, dv.cantidad, count(*) as cantidad_productos_comprados
from clientes c
join ventas v on c.idCliente = v.idVenta
join detalleventa dv on v.idVenta = dv.idVenta
where c.idCliente = 5
GROUP BY c.idCliente, c.nombre, c.apellido, dv.cantidad; */

/* 3) Realizar un ejemplo de consulta SQL aplicando Inner Join, Left Join, Right Join, Full Outer Join */

-- inner join
/* select dv.idDetalle, dv.descuento, p.nombre
from detalleventa dv
inner join productos p on dv.idProducto = p.idProducto; */

-- left join
/* select c.idCliente, c.nombre, c.apellido, v.idVenta
from clientes c
left join ventas v on c.idCliente = v.idCliente
where v.fecha is null or v.fecha > '2023-11-03'; */

-- right join
/* select c.idCliente, c.nombre, c.apellido, dv.idDetalle
from clientes c
right join detalleventa dv on c.idCliente = dv.idVenta
where c.nombre like 'L%'; */

-- full outer
/* select c.idCliente, c.nombre, c.apellido, p.idProducto
from clientes c
left join productos p on c.idCliente = p.idProducto

union

select c.idCliente, c.nombre, c.apellido, p.idProducto
from clientes c
right join productos p on c.idCliente = p.idProducto

where c.idCliente is null or p.idProducto is null; */