-- PRUEBAS INSERT
--------------------------------------------------------------------

-- Insertar datos en la tabla CLIENTES
INSERT INTO CLIENTES (id_cliente, nombre, telefono, email) 
VALUES (1, 'Julieta', '11-2345-6789', 'julieta@gmail.com'), (2, 'Luciano', '11-9876-5432', 'luciano@hotmail.com'), (3, 'Joel', '11-5555-1234', 'joel@yahoo.com');

-- Insertar datos en la tabla PRODUCTOS (variedades de cookies)
INSERT INTO PRODUCTOS (id_producto, nombre, precio_unitario, stock_disponible) 
VALUES (1, 'Cookies de chocolate', 350.00, 50), (2, 'Cookies de avena y pasas', 300.00, 40), (3, 'Cookies red velvet', 400.00, 30), (4, 'Cookies de limón', 320.00, 35), (5, 'Cookies integrales', 280.00, 25);

-- Insertar pedidos de los clientes
INSERT INTO PEDIDOS (id_pedido, id_cliente, fecha_pedido, estado)
VALUES(1, 1, '2023-11-15', 'entregado'), (2, 2, '2023-11-16', 'pendiente'), (3, 3, '2023-11-17', 'procesando'), (4, 1, '2023-11-18', 'pendiente');

-- Detalles de los pedidos (qué productos contiene cada pedido)
INSERT INTO DETALLE_PEDIDO (id_detalle, id_pedido, id_producto, cantidad) 
VALUES (1, 1, 1, 2), (2, 1, 3, 1), (3, 2, 2, 3), (4, 3, 1, 1), (5, 3, 4, 2), (6, 4, 5, 4);

-- Datos de las entregas (solo para pedidos entregados)
INSERT INTO ENTREGAS (id_entrega, id_pedido, fecha_entrega, direccion_entrega, metodo_entrega) 
VALUES (1, 1, '2023-11-16', 'Av. Corrientes 1234, CABA', 'domicilio');

-- PRUEBAS UPDATE
--------------------------------------------------------------------

-- Actualiza un cliente usado en un pedido
UPDATE CLIENTES SET nombre = 'Julieta M.' WHERE id_cliente = 1;

-- Intento de cambiar el ID de un cliente con pedidos
UPDATE CLIENTES SET id_cliente = 100 WHERE id_cliente = 1;
-- Esta prueba deberia fallar segun la integridad referencial

-- Actualiza stock de un producto
UPDATE PRODUCTOS SET stock_disponible = 45 WHERE id_producto = 1;

-- PRUEBAS DELETE
--------------------------------------------------------------------

-- Elimina un producto
DELETE FROM PRODUCTOS WHERE id_producto = 5;

-- Elimina un cliente con pedidos
DELETE FROM CLIENTES WHERE id_cliente = 1;
-- Verificación después de la eliminación:
SELECT * FROM CLIENTES;

-- PRUEBAS RELACIONALES
--------------------------------------------------------------------

-- Ver todos los clientes
SELECT * FROM CLIENTES;

-- Ver todos los productos disponibles
SELECT * FROM PRODUCTOS;

-- Ver pedidos con detalles de clientes
SELECT p.id_pedido, c.nombre AS cliente, p.fecha_pedido, p.estado 
FROM PEDIDOS p 
INNER JOIN CLIENTES c 
ON p.id_cliente = c.id_cliente;

-- Ver detalles completos de un pedido (ejemplo para pedido 1)
SELECT pr.nombre AS producto, dp.cantidad, pr.precio_unitario, (dp.cantidad * pr.precio_unitario) AS subtotal
FROM DETALLE_PEDIDO dp
INNER JOIN PRODUCTOS pr 
ON dp.id_producto = pr.id_producto WHERE dp.id_pedido = 1;

-- Ver pedidos pendientes
SELECT p.id_pedido, c.nombre AS cliente, p.fecha_pedido
FROM PEDIDOS p 
INNER JOIN CLIENTES c 
ON p.id_cliente = c.id_cliente WHERE p.estado = 'pendiente';