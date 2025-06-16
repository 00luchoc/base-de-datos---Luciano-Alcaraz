CREATE TABLE CLIENTES (
    id_cliente INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL,
    telefono TEXT,
    email TEXT
);

CREATE TABLE PRODUCTOS (
    id_producto INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL,
    precio_unitario REAL NOT NULL,
    stock_disponible INTEGER NOT NULL
);

CREATE TABLE PEDIDOS (
    id_pedido INTEGER PRIMARY KEY,
    id_cliente INTEGER NOT NULL,
    fecha_pedido TEXT NOT NULL,
    estado TEXT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES CLIENTES(id_cliente) ON DELETE CASCADE
);

CREATE TABLE DETALLE_PEDIDO (
    id_detalle INTEGER PRIMARY KEY,
    id_pedido INTEGER NOT NULL,
    id_producto INTEGER NOT NULL,
    cantidad INTEGER NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES PEDIDOS(id_pedido) ON DELETE CASCADE,
    FOREIGN KEY (id_producto) REFERENCES PRODUCTOS(id_producto) ON DELETE CASCADE
);

CREATE TABLE ENTREGAS (
    id_entrega INTEGER PRIMARY KEY,
    id_pedido INTEGER NOT NULL,
    fecha_entrega TEXT NOT NULL,
    direccion_entrega TEXT NOT NULL,
    metodo_entrega TEXT NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES PEDIDOS(id_pedido) ON DELETE CASCADE
);