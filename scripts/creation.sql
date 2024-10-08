-- Creación de la base de datos
CREATE DATABASE PrensaVerificada;
GO

-- Uso de la base de datos
USE PrensaVerificada;
GO

-- Creación de la tabla 'autores'
CREATE TABLE autores (
    autorid INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(255) NOT NULL,
    biografia TEXT,
    twitter NVARCHAR(255),
    instagram NVARCHAR(255),
    foto NVARCHAR(255) -- Ruta de la imagen del autor
);

-- Creación de la tabla 'categorias'
CREATE TABLE categorias (
    categoriaid INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(255) NOT NULL
);

-- Creación de la tabla 'publicaciones'
CREATE TABLE publicaciones (
    publicacionid INT IDENTITY(1,1) PRIMARY KEY,
    titulo NVARCHAR(255) NOT NULL,
    subtitulo NVARCHAR(255),
    contenido TEXT NOT NULL,
    imagen NVARCHAR(255), -- Ruta de la imagen principal
    fechapublicacion DATE NOT NULL,
    autorid INT FOREIGN KEY REFERENCES autores(autorid),
    categoriaid INT FOREIGN KEY REFERENCES categorias(categoriaid)
);

-- Creación de la tabla 'usuarios'
CREATE TABLE usuarios (
    usuarioid INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(255) NOT NULL,
    email NVARCHAR(255) NOT NULL,
    contrasena NVARCHAR(255) NOT NULL,
    fecharegistro DATE NOT NULL
);

-- Creación de la tabla 'reclamos'
CREATE TABLE reclamos (
    reclamoid INT IDENTITY(1,1) PRIMARY KEY,
    usuarioid INT FOREIGN KEY REFERENCES usuarios(usuarioid),
    fecha DATE NOT NULL,
    estado NVARCHAR(50) NOT NULL,
    descripcion TEXT NOT NULL
);

-- Creación de la tabla 'favoritos'
CREATE TABLE favoritos (
    favoritoid INT IDENTITY(1,1) PRIMARY KEY,
    usuarioid INT FOREIGN KEY REFERENCES usuarios(usuarioid),
    publicacionid INT FOREIGN KEY REFERENCES publicaciones(publicacionid),
    fechaagregado DATE NOT NULL
);

-- Creación de la tabla 'bitacora'
CREATE TABLE bitacora (
    bitacoraid INT IDENTITY(1,1) PRIMARY KEY,
    usuarioid INT FOREIGN KEY REFERENCES usuarios(usuarioid),
    fecha DATE NOT NULL,
    accion NVARCHAR(255) NOT NULL -- Descripción de la acción (ej. 'Inicio de sesión', 'Actualización de perfil')
);

-- Inserciones para la tabla 'autores'
INSERT INTO autores (nombre, biografia, twitter, instagram, foto)
VALUES 
('Hugo Alconada Mon', 'Prosecretario de Redacción en LA NACIÓN, abogado, y maestro en el nuevo periodismo iberoamericano.', 'https://twitter.com/halconada', 'https://www.instagram.com/halconada/', 'img/alconada.webp'),
('Soledad Larghi', 'Periodista en America Noticias, especializada en política y sociedad.', 'https://twitter.com/SoledadLarghi', 'https://www.instagram.com/solelarghi/', 'img/Soledad-Larghi-Revista-GENTE-10.jpg.webp'),
('Ernesto Tenembaum', 'Analista político y periodista en Infobae.', 'https://twitter.com/ertenembaum', 'https://www.instagram.com/ernesto_tenembaum/', 'img/tenembaum.webp');

-- Inserciones para la tabla 'categorias'
INSERT INTO categorias (nombre)
VALUES 
('Política'),
('Economía'),
('Deportes'),
('Tecnología'),
('Viajes');

-- Inserciones para la tabla 'publicaciones'
INSERT INTO publicaciones (titulo, subtitulo, contenido, imagen, fechapublicacion, autorid, categoriaid)
VALUES 
('Caso Chocolate: ordenaron la inhibición general de todo el patrimonio de los Albini', 'Investigación sobre el caso Albini', 'Detalles sobre el caso Chocolate y la intervención judicial.', 'img/chocolate.webp', '2024-06-04', 1, 1),
('El contrato de Mbappé en el Real Madrid es impresionante', 'Mbappé en el Real Madrid', 'Un análisis del nuevo contrato de Mbappé con el club.', 'img/mbappe.webp', '2024-06-04', 3, 3),
('Karina Milei manejó una sociedad en Miami que compró cuatro propiedades por unos US$2,7 millones', 'Investigación sobre Karina Milei', 'Un reportaje sobre las propiedades adquiridas por Karina Milei.', 'img/karina-milei.webp', '2024-06-04', 1, 1);

-- Inserciones para la tabla 'usuarios'
INSERT INTO usuarios (nombre, email, contrasena, fecharegistro)
VALUES 
('Juan Perez', 'juan.perez@example.com', 'password123', '2024-01-15'),
('Maria Gonzalez', 'maria.gonzalez@example.com', 'password456', '2024-03-22'),
('Carlos Martinez', 'carlos.martinez@example.com', 'password789', '2024-05-10');

-- Inserciones para la tabla 'reclamos'
INSERT INTO reclamos (usuarioid, fecha, estado, descripcion)
VALUES 
(1, '2024-06-05', 'Pendiente', 'Problema con la visualización de la nota sobre política.'),
(2, '2024-06-06', 'Resuelto', 'Error en el contenido de la publicación sobre economía.'),
(3, '2024-06-07', 'En proceso', 'Solicito corrección de información en la nota de deportes.');

-- Inserciones para la tabla 'favoritos'
INSERT INTO favoritos (usuarioid, publicacionid, fechaagregado)
VALUES 
(1, 1, '2024-06-05'),
(2, 2, '2024-06-06'),
(3, 3, '2024-06-07');

-- Inserciones para la tabla 'bitacora'
INSERT INTO bitacora (usuarioid, fecha, accion)
VALUES 
(1, '2024-06-01', 'Inicio de sesión'),
(2, '2024-06-02', 'Actualización de perfil'),
(3, '2024-06-03', 'Publicación marcada como favorita');
