DROP SCHEMA IF EXISTS sportsko;
DROP USER IF EXISTS sportsko_admin;

CREATE DATABASE sportsko;

USE sportsko;

CREATE USER 'sportsko_admin'@'%' IDENTIFIED BY '12345';

GRANT ALL PRIVILEGES ON sportsko.* TO 'sportsko_admin'@'%';
FLUSH PRIVILEGES;

CREATE TABLE sportsko.categoria (
    id_categoria INT NOT NULL AUTO_INCREMENT,
    descripcion VARCHAR(255) NOT NULL,
    ruta_imagen VARCHAR(1024),
    activo bool,
    PRIMARY KEY (id_categoria)
) ENGINE=InnoDB DEFAULT CHARACTER SET utf8mb4;

CREATE TABLE sportsko.producto (
    id_producto INT NOT NULL AUTO_INCREMENT,
    id_categoria INT NOT NULL,
    nombre_producto VARCHAR(255) NOT NULL,
    descripcion TEXT NOT NULL,
    precio double,
    existencias INT,
    ruta_imagen VARCHAR(1024),
    talla VARCHAR(25),
    color VARCHAR(25),
    oferta bool,
    activo bool,
    PRIMARY KEY (id_producto),
    FOREIGN KEY fk_producto_categoria (id_categoria) REFERENCES categoria(id_categoria)
) ENGINE=InnoDB DEFAULT CHARACTER SET utf8mb4;

CREATE TABLE sportsko.usuario (
    id_usuario INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(20) NOT NULL,
    password VARCHAR(512) NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    apellidos VARCHAR(30) NOT NULL,
    correo VARCHAR(25),
    telefono VARCHAR(15),
    ruta_imagen VARCHAR(1024),
    activo bool,
    PRIMARY KEY (id_usuario)
) ENGINE=InnoDB DEFAULT CHARACTER SET utf8mb4;

CREATE TABLE sportsko.factura (
    id_factura INT NOT NULL AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    fecha DATE,
    total double,
    estado INT,
    PRIMARY KEY (id_factura),
    FOREIGN KEY fk_factura_usuario (id_usuario) REFERENCES usuario(id_usuario)
) ENGINE=InnoDB DEFAULT CHARACTER SET utf8mb4;

CREATE TABLE sportsko.venta (
    id_venta INT NOT NULL AUTO_INCREMENT,
    id_factura INT NOT NULL,
    id_producto INT NOT NULL,
    precio double,
    cantidad INT,
    PRIMARY KEY (id_venta),
    FOREIGN KEY fk_venta_factura (id_factura) REFERENCES factura(id_factura),
    FOREIGN KEY fk_venta_producto (id_producto) REFERENCES producto(id_producto)
) ENGINE=InnoDB DEFAULT CHARACTER SET utf8mb4;

CREATE TABLE sportsko.resena (
    id_resena INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    id_producto INT,
    calificacion INT,
    comentario TEXT,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
) ENGINE=InnoDB DEFAULT CHARACTER SET utf8mb4;

-- Inserting data into sportsko.categoria
INSERT INTO sportsko.categoria (descripcion, ruta_imagen, activo) VALUES
('Hombre', 'hombre.jpg', true),
('Mujer', 'mujer.jpg', true),
('Ninos', 'ninos.jpg', true);

-- Categoría 1 - Hombres
INSERT INTO sportsko.producto (id_categoria, nombre_producto, descripcion, precio, existencias, ruta_imagen, talla, color, oferta, activo)
VALUES
(1, 'Zapatillas Montaña Hombres Xplorer', 'Descubre nuevos horizontes con las zapatillas de tenis de montaña Xplorer para hombres. Diseñadas para la aventura y la comodidad en cada paso.', 99.99, 50, 'zapatillas_montana_hombres_xplorer.jpg', null, 'verde', false, true),
(1, 'Zapatillas Peak Trek Hombres', 'Alcanza la cima con estilo y rendimiento. Las zapatillas de tenis de montaña Peak Trek para hombres ofrecen un ajuste perfecto y durabilidad en terrenos exigentes.', 89.99, 60, 'zapatillas_peak_trek_hombres.jpg', null, 'marrón', false, true),
(1, 'Zapatillas Summit Pro Hombres', 'Conquista las cumbres más altas con las zapatillas de tenis de montaña Summit Pro para hombres. Ligereza, agarre y estilo en cada aventura.', 79.99, 70, 'zapatillas_summit_pro_hombres.jpg', null, 'azul', false, true),
(1, 'Zapatillas Trailblazer Hombres', 'Haz camino con las zapatillas de tenis de montaña Trailblazer para hombres. Un diseño robusto y resistente para enfrentar cualquier sendero.', 109.99, 40, 'zapatillas_trailblazer_hombres.jpg', null, 'negro', true, true),
(1, 'Zapatillas EverTrek Hombres', 'Explora sin límites con las zapatillas de tenis de montaña EverTrek para hombres. Comodidad y tracción excepcionales en cada terreno.', 94.99, 55, 'zapatillas_evertek_hombres.jpg', null, 'gris', false, true),
(1, 'Zapatillas ProVenture Hombres', 'Aventura sin restricciones con las zapatillas de tenis de montaña ProVenture para hombres. Rendimiento superior y estilo audaz en cada paso.', 109.99, 30, 'zapatillas_proventure_hombres.jpg', null, 'azul', false, true),
(1, 'Zapatillas TrailMaster Hombres', 'Domina los senderos con las zapatillas de tenis de montaña TrailMaster para hombres. Resistencia y soporte para desafiar cualquier terreno.', 84.99, 65, 'zapatillas_trailmaster_hombres.jpg', null, 'verde', false, true),
(1, 'Zapatillas AlpineX Hombres', 'Supera los picos más altos con las zapatillas de tenis de montaña AlpineX para hombres. Diseño aerodinámico y durabilidad incomparable.', 119.99, 20, 'zapatillas_alpinex_hombres.jpg', null, 'azul', false, true),
(1, 'Zapatillas TrekElite Hombres', 'Destaca en la élite del trekking con las zapatillas de tenis de montaña TrekElite para hombres. Rendimiento de élite y estilo innovador.', 129.99, 15, 'zapatillas_trekelite_hombres.jpg', null, 'negro', true, true);

-- Categoría 2 - Mujeres
INSERT INTO sportsko.producto (id_categoria, nombre_producto, descripcion, precio, existencias, ruta_imagen, talla, color, oferta, activo)
VALUES
(2, 'Zapatillas Trail Femme Explorer', 'Explora la naturaleza con las zapatillas de tenis de montaña Trail Femme Explorer para mujeres. Diseñadas para la mujer aventurera con estilo y funcionalidad.', 89.99, 45, 'zapatillas_trail_femme_explorer.jpg', null, 'rosa', true, true),
(2, 'Zapatillas Wild Trail Mujeres', 'Libera tu espíritu salvaje con las zapatillas de tenis de montaña Wild Trail para mujeres. Comodidad y resistencia para desafiar cualquier terreno.', 79.99, 50, 'zapatillas_wild_trail_mujeres.jpg', null, 'gris', false, true),
(2, 'Zapatillas Nature Pro Mujeres', 'Conéctate con la naturaleza con las zapatillas de tenis de montaña Nature Pro para mujeres. Estilo elegante y rendimiento excepcional en cada sendero.', 69.99, 60, 'zapatillas_nature_pro_mujeres.jpg', null, 'verde', false, true),
(2, 'Zapatillas TrekFusion Mujeres', 'Fusiona estilo y rendimiento con las zapatillas de tenis de montaña TrekFusion para mujeres. Diseño moderno y agarre excepcional.', 99.99, 35, 'zapatillas_trekfusion_mujeres.jpg', null, 'azul', true, true),
(2, 'Zapatillas Alpine Queen Mujeres', 'Siéntete como una reina de la montaña con las zapatillas de tenis de montaña Alpine Queen para mujeres. Elegancia y resistencia en cada paso.', 119.99, 25, 'zapatillas_alpine_queen_mujeres.jpg', null, 'violeta', false, true),
(2, 'Zapatillas Peak Performance Mujeres', 'Alcanza tu máximo rendimiento con las zapatillas de tenis de montaña Peak Performance para mujeres. Comodidad y estilo en cada expedición.', 89.99, 45, 'zapatillas_peak_performance_mujeres.jpg', null, 'azul', false, true),
(2, 'Zapatillas Terra Nova Mujeres', 'Explora nuevos territorios con las zapatillas de tenis de montaña Terra Nova para mujeres. Diseño resistente y tracción superior.', 79.99, 50, 'zapatillas_terra_nova_mujeres.jpg', null, 'verde', false, true),
(2, 'Zapatillas TrailBliss Mujeres', 'Encuentra la dicha en cada sendero con las zapatillas de tenis de montaña TrailBliss para mujeres. Comodidad y estilo en armonía.', 94.99, 40, 'zapatillas_trailbliss_mujeres.jpg', null, 'rosa', false, true),
(2, 'Zapatillas Summit Diva Mujeres', 'Conquista las cumbres con actitud con las zapatillas de tenis de montaña Summit Diva para mujeres. Estilo audaz y rendimiento incomparable.', 109.99, 30, 'zapatillas_summit_diva_mujeres.jpg', null, 'negro', true, true);

-- Categoría 3
INSERT INTO sportsko.producto (id_categoria, nombre_producto, descripcion, precio, existencias, ruta_imagen, talla, color, oferta, activo) VALUES
(3, 'Botas de Escalada Xtreme', 'Botas de escalada diseñadas para ascensos técnicos', 149.99, 25, 'botas_escalada_xtreme.jpg', null, 'azul', false, true),
(3, 'Zapatillas Acuáticas Aqua Trail', 'Zapatillas acuáticas para actividades en el agua', 59.99, 80, 'zapatillas_acuaticas_aqua_trail.jpg', null, 'azul', true, true),
(3, 'Kit Accesorios Senderismo', 'Kit de accesorios para senderismo (brújula, linterna, cantimplora)', 39.99, 20, 'kit_accesorios_senderismo.jpg', null, 'azul', false, true),
(3, 'Mosquetón Escalada Pro', 'Mosquetón de escalada resistente y ligero', 19.99, 50, 'mosqueton_escalada_pro.jpg', null, 'azul', false, true),
(3, 'Cuerda Escalada Dynamic', 'Cuerda dinámica para escalada de alto rendimiento', 89.99, 15, 'cuerda_escalada_dynamic.jpg', null, 'azul', false, true),
(3, 'Arnés Escalada Ajustable', 'Arnés ajustable y cómodo para escalada', 49.99, 30, 'arnes_escalada_ajustable.jpg', null, 'azul', true, true),
(3, 'Casco Escalada Ventilado', 'Casco ventilado y resistente para escalada', 69.99, 20, 'casco_escalada_ventilado.jpg', null, 'azul', false, true),
(3, 'Magnesio Escalada 500g', 'Bloque de magnesio para mejorar el agarre en escalada', 9.99, 100, 'magnesio_escalada_500g.jpg', null, 'azul', false, true),
(3, 'Camiseta Senderismo Dry', 'Camiseta transpirable para senderismo de secado rápido', 29.99, 40, 'camiseta_senderismo_dry.jpg', null, 'azul', false, true);


INSERT INTO sportsko.usuario (id_usuario, username,password,nombre, apellidos, correo, telefono,ruta_imagen,activo) VALUES 
(1,'juan','$2a$10$P1.w58XvnaYQUQgZUCk4aO/RTRl8EValluCqB3S2VMLTbRt.tlre.','Juan', 'Castro Mora',    'jcastro@gmail.com',    '4556-8978', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Juan_Diego_Madrigal.jpg/250px-Juan_Diego_Madrigal.jpg',true),
(2,'rebeca','$2a$10$GkEj.ZzmQa/aEfDmtLIh3udIH5fMphx/35d0EYeqZL5uzgCJ0lQRi','Rebeca',  'Contreras Mora', 'acontreras@gmail.com', '5456-8789','https://upload.wikimedia.org/wikipedia/commons/0/06/Photo_of_Rebeca_Arthur.jpg',true),
(3,'pedro','$2a$10$koGR7eS22Pv5KdaVJKDcge04ZB53iMiw76.UjHPY.XyVYlYqXnPbO','Pedro', 'Mena Loria',     'lmena@gmail.com',      '7898-8936','https://upload.wikimedia.org/wikipedia/commons/thumb/f/fd/Eduardo_de_Pedro_2019.jpg/480px-Eduardo_de_Pedro_2019.jpg?20200109230854',true);

-- Inserting data into sportsko.factura
INSERT INTO sportsko.factura (id_usuario, fecha, total, estado) VALUES
(1, '2023-01-01', 180.00, 1),
(1, '2023-02-01', 240.00, 1),
(1, '2023-03-01', 120.00, 0),
(2, '2023-04-01', 180.00, 1),
(2, '2023-05-01', 120.00, 0),
(2, '2023-06-01', 150.00, 1),
(3, '2023-07-01', 120.00, 0),
(3, '2023-08-01', 210.00, 1),
(3, '2023-09-01', 140.00, 0);

-- Inserting data into sportsko.venta
INSERT INTO sportsko.venta (id_factura, id_producto, precio, cantidad) VALUES
(1, 1, 89.99, 2),
(1, 3, 149.99, 1),
(2, 2, 119.99, 2),
(2, 4, 79.99, 3),
(3, 5, 169.99, 1),
(3, 6, 59.99, 2),
(4, 7, 69.99, 3),
(4, 8, 99.99, 1),
(5, 9, 39.99, 1);

-- Inserting data into sportsko.resena
INSERT INTO sportsko.resena (id_usuario, id_producto, calificacion, comentario) VALUES
(1, 1, 4, 'Buenas zapatillas para senderismo'),
(1, 2, 5, 'Perfectas para trail running exigente'),
(1, 3, 3, 'Botas de escalada robustas pero pesadas'),
(2, 4, 4, 'Cómodas y ligeras, ideales para trekking'),
(2, 5, 5, 'Excelentes en condiciones de invierno'),
(2, 6, 3, 'Adecuadas para actividades acuáticas'),
(3, 7, 4, 'Buena elección para trail walking diario'),
(3, 8, 5, 'Zapatillas de cross training versátiles'),
(3, 9, 4, 'Adecuadas para actividades acuáticas');

create table sportsko.rol (
  id_rol INT NOT NULL AUTO_INCREMENT,
  nombre varchar(20),
  id_usuario int,
  PRIMARY KEY (id_rol),
  foreign key fk_rol_usuario (id_usuario) references usuario(id_usuario)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

insert into sportsko.rol (id_rol, nombre, id_usuario) values
 (1,'ROLE_ADMIN',1), (2,'ROLE_VENDEDOR',1), (3,'ROLE_USER',1),
 (4,'ROLE_VENDEDOR',2), (5,'ROLE_USER',2),
 (6,'ROLE_USER',3);
