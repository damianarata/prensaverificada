USE [master]
GO
/****** Object:  Database [PrensaVerificada]    Script Date: 11/11/2024 10:16:42 ******/
CREATE DATABASE [PrensaVerificada]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PrensaVerificada', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PrensaVerificada.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PrensaVerificada_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PrensaVerificada_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PrensaVerificada] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PrensaVerificada].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PrensaVerificada] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PrensaVerificada] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PrensaVerificada] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PrensaVerificada] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PrensaVerificada] SET ARITHABORT OFF 
GO
ALTER DATABASE [PrensaVerificada] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PrensaVerificada] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PrensaVerificada] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PrensaVerificada] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PrensaVerificada] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PrensaVerificada] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PrensaVerificada] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PrensaVerificada] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PrensaVerificada] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PrensaVerificada] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PrensaVerificada] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PrensaVerificada] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PrensaVerificada] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PrensaVerificada] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PrensaVerificada] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PrensaVerificada] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PrensaVerificada] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PrensaVerificada] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PrensaVerificada] SET  MULTI_USER 
GO
ALTER DATABASE [PrensaVerificada] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PrensaVerificada] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PrensaVerificada] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PrensaVerificada] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PrensaVerificada] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PrensaVerificada] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PrensaVerificada] SET QUERY_STORE = OFF
GO
USE [PrensaVerificada]
GO
/****** Object:  Table [dbo].[autores]    Script Date: 11/11/2024 10:16:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[autores](
	[autorid] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](255) NOT NULL,
	[biografia] [text] NULL,
	[twitter] [nvarchar](255) NULL,
	[instagram] [nvarchar](255) NULL,
	[foto] [nvarchar](255) NULL,
	[usuarioid] [int] NULL,
	[medio] [varchar](255) NOT NULL,
	[linkedin] [varchar](255) NOT NULL,
	[facebook] [varchar](255) NOT NULL,
	[youtube] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[autorid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[publicaciones]    Script Date: 11/11/2024 10:16:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[publicaciones](
	[publicacionid] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [nvarchar](255) NOT NULL,
	[subtitulo] [nvarchar](255) NULL,
	[contenido] [text] NOT NULL,
	[imagen] [nvarchar](255) NULL,
	[fechapublicacion] [datetime2](0) NOT NULL,
	[autorid] [int] NULL,
	[categoriaid] [int] NULL,
	[estadoid] [int] NULL,
	[contador_total] [int] NULL,
	[contador_semanal] [int] NULL,
	[id_tipo_letra] [int] NOT NULL,
	[id_tipo_tamano] [int] NOT NULL,
	[parrafos] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[publicacionid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_autores_mas_leidos]    Script Date: 11/11/2024 10:16:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_autores_mas_leidos]
AS
SELECT 
    a.autorid,
    a.nombre,
    a.foto,
    COUNT(p.publicacionid) AS total_publicaciones,
    SUM(p.contador_total) AS total_lecturas,
    SUM(p.contador_semanal) AS lecturas_semanales
FROM 
    dbo.autores a
LEFT JOIN 
    dbo.publicaciones p ON a.autorid = p.autorid
GROUP BY 
    a.autorid, a.nombre, a.foto  -- Agrega a.foto aquí
HAVING 
    SUM(p.contador_total) IS NOT NULL;
GO
/****** Object:  Table [dbo].[categorias]    Script Date: 11/11/2024 10:16:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categorias](
	[categoriaid] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](255) NOT NULL,
	[imagen] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[categoriaid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_categorias_mas_leidas]    Script Date: 11/11/2024 10:16:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_categorias_mas_leidas]
AS
SELECT 
    c.categoriaid,
    c.nombre,
	c.imagen,
    COUNT(p.publicacionid) AS total_publicaciones,
    SUM(p.contador_total) AS total_lecturas,
    SUM(p.contador_semanal) AS lecturas_semanales
FROM 
    dbo.categorias c
LEFT JOIN 
    dbo.publicaciones p ON c.categoriaid = p.categoriaid
GROUP BY 
    c.categoriaid, c.nombre, c.imagen
HAVING 
    SUM(p.contador_total) IS NOT NULL; -- Solo incluye categorías con al menos una lectura

GO
/****** Object:  Table [dbo].[favoritos]    Script Date: 11/11/2024 10:16:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[favoritos](
	[favoritoid] [int] IDENTITY(1,1) NOT NULL,
	[usuarioid] [int] NULL,
	[publicacionid] [int] NULL,
	[fechaagregado] [datetime2](0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[favoritoid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_publicaciones_mas_favoritas]    Script Date: 11/11/2024 10:16:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE VIEW [dbo].[vw_publicaciones_mas_favoritas]
AS
SELECT 
    p.publicacionid,
    p.titulo,
    p.imagen,
    COUNT(f.favoritoid) AS total_favoritos
FROM 
    dbo.publicaciones p
LEFT JOIN 
    dbo.favoritos f ON p.publicacionid = f.publicacionid
GROUP BY 
    p.publicacionid, p.titulo, p.imagen
HAVING 
    COUNT(f.favoritoid) > 0; -- Solo incluye publicaciones que han sido agregadas a favoritos

GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 11/11/2024 10:16:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[usuarioid] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](255) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[contrasena] [nvarchar](255) NOT NULL,
	[fecharegistro] [datetime2](0) NOT NULL,
	[admin] [bit] NULL,
	[blocked] [bit] NULL,
	[codigo] [nvarchar](50) NOT NULL,
	[retry] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[usuarioid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_PublicacionesFavoritasPorUsuario]    Script Date: 11/11/2024 10:16:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_PublicacionesFavoritasPorUsuario] AS
SELECT 
    u.usuarioid,
    p.publicacionid,
    p.titulo,
    p.subtitulo,
    p.contenido,
    p.imagen,
    p.fechapublicacion,
    p.autorid,
    p.categoriaid,
    p.estadoid,
    p.contador_total,
    p.contador_semanal,
    p.id_tipo_letra,
    p.id_tipo_tamano,
    p.parrafos,
    f.fechaagregado AS fecha_favorito
FROM 
    dbo.favoritos f
INNER JOIN 
    dbo.usuarios u ON f.usuarioid = u.usuarioid
INNER JOIN 
    dbo.publicaciones p ON f.publicacionid = p.publicacionid;
GO
/****** Object:  Table [dbo].[bitacora]    Script Date: 11/11/2024 10:16:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bitacora](
	[bitacoraid] [int] IDENTITY(1,1) NOT NULL,
	[usuarioid] [int] NULL,
	[fecha] [datetime2](0) NOT NULL,
	[accion] [nvarchar](255) NOT NULL,
	[criticidad] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[bitacoraid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_BitacoraCriticidad]    Script Date: 11/11/2024 10:16:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_BitacoraCriticidad] AS
SELECT
    criticidad,
    COUNT(*) AS TotalRegistros,
    'Últimas 24 horas' AS Periodo
FROM
    PrensaVerificada.dbo.bitacora
WHERE
    fecha >= DATEADD(HOUR, -24, GETDATE())
GROUP BY
    criticidad

UNION ALL

SELECT
    criticidad,
    COUNT(*) AS TotalRegistros,
    'Últimos 7 días' AS Periodo
FROM
    PrensaVerificada.dbo.bitacora
WHERE
    fecha >= DATEADD(DAY, -7, GETDATE())
GROUP BY
    criticidad

UNION ALL

SELECT
    criticidad,
    COUNT(*) AS TotalRegistros,
    'Último mes' AS Periodo
FROM
    PrensaVerificada.dbo.bitacora
WHERE
    fecha >= DATEADD(MONTH, -1, GETDATE())
GROUP BY
    criticidad;

GO
/****** Object:  Table [dbo].[comentarios]    Script Date: 11/11/2024 10:16:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comentarios](
	[comentarioid] [int] IDENTITY(1,1) NOT NULL,
	[reclamoid] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[descripcion] [nvarchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[comentarioid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[estados]    Script Date: 11/11/2024 10:16:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estados](
	[estadoid] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[estadoid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reclamos]    Script Date: 11/11/2024 10:16:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reclamos](
	[reclamoid] [int] IDENTITY(1,1) NOT NULL,
	[usuarioid] [int] NULL,
	[fecha] [datetime2](0) NOT NULL,
	[estadoid] [int] NOT NULL,
	[descripcion] [text] NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
	[mail] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[reclamoid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reclamos_estados]    Script Date: 11/11/2024 10:16:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reclamos_estados](
	[estadoid] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_reclamos_estados] PRIMARY KEY CLUSTERED 
(
	[estadoid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_letra]    Script Date: 11/11/2024 10:16:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_letra](
	[id_tipo_letra] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_tipo_letra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_tamano]    Script Date: 11/11/2024 10:16:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_tamano](
	[id_tipo_tamano] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_tipo_tamano] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[autores] ON 

INSERT [dbo].[autores] ([autorid], [nombre], [biografia], [twitter], [instagram], [foto], [usuarioid], [medio], [linkedin], [facebook], [youtube]) VALUES (1, N'Hugo Alconada Mon', N'Prosecretario de Redacción en LA NACIÓN, abogado, y maestro en el nuevo periodismo iberoamericano.', N'https://twitter.com/halconada', N'https://www.instagram.com/halconada/', N'img/alconada.jpg', 1, N'La Nacion', N'', N'', N'')
INSERT [dbo].[autores] ([autorid], [nombre], [biografia], [twitter], [instagram], [foto], [usuarioid], [medio], [linkedin], [facebook], [youtube]) VALUES (2, N'Soledad Larghi', N'Periodista en America Noticias, especializada en política y sociedad.', N'https://twitter.com/SoledadLarghi', N'https://www.instagram.com/solelarghi/', N'img/Soledad-Larghi-Revista-GENTE-10.jpg.jpg', 2, N'America Noticias', N'', N'https://www.facebook.com/SoledadLarghi/', N'https://www.youtube.com/user/SoledadLarghi')
INSERT [dbo].[autores] ([autorid], [nombre], [biografia], [twitter], [instagram], [foto], [usuarioid], [medio], [linkedin], [facebook], [youtube]) VALUES (3, N'Ernesto Tenembaum', N'Analista político y periodista en Infobae.', N'https://twitter.com/ertenembaum', N'https://www.instagram.com/ernesto_tenembaum/', N'img/tenembaum.jpg', 3, N'Infobae', N'', N'', N'')
INSERT [dbo].[autores] ([autorid], [nombre], [biografia], [twitter], [instagram], [foto], [usuarioid], [medio], [linkedin], [facebook], [youtube]) VALUES (4, N'Carlos Pagni', N'Periodista e historiador argentino, ganador del Premio Konex al Periodismo, el Premio Konex de Platino 2017', N'https://twitter.com/CarlosPagniOKK', N'https://www.instagram.com/carlospagni/', N'img/carlospagni2.jpeg', 7, N'La Nacion', N'https://ar.linkedin.com/in/carlos-pagni-b50329117', N'https://www.facebook.com/carlospagniLn/', N'')
INSERT [dbo].[autores] ([autorid], [nombre], [biografia], [twitter], [instagram], [foto], [usuarioid], [medio], [linkedin], [facebook], [youtube]) VALUES (10, N'Pablo Vilaboa', N'Docente de la UAI y profesor universitario ademas de ingeniero.3', N'', N'', N'Uploads/pablo.jpeg', 12, N'UAI', N'', N'', N'')
SET IDENTITY_INSERT [dbo].[autores] OFF
GO
SET IDENTITY_INSERT [dbo].[bitacora] ON 

INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (1, 1, CAST(N'2024-06-01T00:00:00.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (2, 2, CAST(N'2024-06-02T00:00:00.0000000' AS DateTime2), N'Actualización de perfil', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (3, 3, CAST(N'2024-06-03T00:00:00.0000000' AS DateTime2), N'Publicación marcada como favorita', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (4, 1, CAST(N'2024-10-21T00:00:00.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (5, 2, CAST(N'2024-10-21T00:00:00.0000000' AS DateTime2), N'Cambio de contraseña', N'WARN')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (6, 3, CAST(N'2024-10-21T00:00:00.0000000' AS DateTime2), N'Recuperación de clave', N'CRIT')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (7, 1, CAST(N'2024-10-21T00:00:00.0000000' AS DateTime2), N'Actualizar perfil', N'WARN')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (8, 2, CAST(N'2024-10-21T00:00:00.0000000' AS DateTime2), N'Leer publicación', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (9, 3, CAST(N'2024-10-21T00:00:00.0000000' AS DateTime2), N'Agregar a favoritos', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (10, 1, CAST(N'2024-10-21T00:00:00.0000000' AS DateTime2), N'Eliminar favoritos', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (11, 2, CAST(N'2024-10-21T00:00:00.0000000' AS DateTime2), N'Búsqueda Avanzada', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (12, 3, CAST(N'2024-10-21T00:00:00.0000000' AS DateTime2), N'Compartir en redes', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (13, 1, CAST(N'2024-10-21T00:00:00.0000000' AS DateTime2), N'Crear reclamo', N'CRIT')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (14, 2, CAST(N'2024-10-20T00:00:00.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (15, 3, CAST(N'2024-10-20T00:00:00.0000000' AS DateTime2), N'Cambio de contraseña', N'WARN')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (16, 1, CAST(N'2024-10-20T00:00:00.0000000' AS DateTime2), N'Recuperación de clave', N'CRIT')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (17, 2, CAST(N'2024-10-20T00:00:00.0000000' AS DateTime2), N'Actualizar perfil', N'WARN')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (18, 3, CAST(N'2024-10-20T00:00:00.0000000' AS DateTime2), N'Leer publicación', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (19, 1, CAST(N'2024-10-20T00:00:00.0000000' AS DateTime2), N'Agregar a favoritos', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (20, 2, CAST(N'2024-10-20T00:00:00.0000000' AS DateTime2), N'Eliminar favoritos', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (21, 3, CAST(N'2024-10-20T00:00:00.0000000' AS DateTime2), N'Búsqueda Avanzada', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (22, 1, CAST(N'2024-10-20T00:00:00.0000000' AS DateTime2), N'Compartir en redes', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (23, 2, CAST(N'2024-10-20T00:00:00.0000000' AS DateTime2), N'Crear reclamo', N'CRIT')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (24, 1, CAST(N'2024-10-19T00:00:00.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (25, 2, CAST(N'2024-10-19T00:00:00.0000000' AS DateTime2), N'Cambio de contraseña', N'WARN')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (26, 3, CAST(N'2024-10-19T00:00:00.0000000' AS DateTime2), N'Recuperación de clave', N'CRIT')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (27, 1, CAST(N'2024-10-19T00:00:00.0000000' AS DateTime2), N'Actualizar perfil', N'WARN')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (28, 2, CAST(N'2024-10-19T00:00:00.0000000' AS DateTime2), N'Leer publicación', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (29, 3, CAST(N'2024-10-19T00:00:00.0000000' AS DateTime2), N'Agregar a favoritos', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (30, 1, CAST(N'2024-10-19T00:00:00.0000000' AS DateTime2), N'Eliminar favoritos', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (31, 2, CAST(N'2024-10-19T00:00:00.0000000' AS DateTime2), N'Búsqueda Avanzada', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (32, 3, CAST(N'2024-10-19T00:00:00.0000000' AS DateTime2), N'Compartir en redes', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (33, 1, CAST(N'2024-10-19T00:00:00.0000000' AS DateTime2), N'Crear reclamo', N'CRIT')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (34, 1, CAST(N'2024-10-18T00:00:00.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (35, 2, CAST(N'2024-10-18T00:00:00.0000000' AS DateTime2), N'Cambio de contraseña', N'WARN')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (36, 3, CAST(N'2024-10-18T00:00:00.0000000' AS DateTime2), N'Recuperación de clave', N'CRIT')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (37, 1, CAST(N'2024-10-18T00:00:00.0000000' AS DateTime2), N'Actualizar perfil', N'WARN')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (38, 2, CAST(N'2024-10-18T00:00:00.0000000' AS DateTime2), N'Leer publicación', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (39, 3, CAST(N'2024-10-18T00:00:00.0000000' AS DateTime2), N'Agregar a favoritos', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (40, 1, CAST(N'2024-10-18T00:00:00.0000000' AS DateTime2), N'Eliminar favoritos', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (41, 2, CAST(N'2024-10-18T00:00:00.0000000' AS DateTime2), N'Búsqueda Avanzada', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (42, 3, CAST(N'2024-10-18T00:00:00.0000000' AS DateTime2), N'Compartir en redes', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (43, 1, CAST(N'2024-10-18T00:00:00.0000000' AS DateTime2), N'Crear reclamo', N'CRIT')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (44, 2, CAST(N'2024-10-17T00:00:00.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (45, 3, CAST(N'2024-10-17T00:00:00.0000000' AS DateTime2), N'Cambio de contraseña', N'WARN')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (46, 1, CAST(N'2024-10-17T00:00:00.0000000' AS DateTime2), N'Recuperación de clave', N'CRIT')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (47, 2, CAST(N'2024-10-17T00:00:00.0000000' AS DateTime2), N'Actualizar perfil', N'WARN')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (48, 3, CAST(N'2024-10-17T00:00:00.0000000' AS DateTime2), N'Leer publicación', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (49, 1, CAST(N'2024-10-17T00:00:00.0000000' AS DateTime2), N'Agregar a favoritos', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (50, 2, CAST(N'2024-10-17T00:00:00.0000000' AS DateTime2), N'Eliminar favoritos', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (51, 3, CAST(N'2024-10-17T00:00:00.0000000' AS DateTime2), N'Búsqueda Avanzada', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (52, 1, CAST(N'2024-10-17T00:00:00.0000000' AS DateTime2), N'Compartir en redes', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (53, 2, CAST(N'2024-10-17T00:00:00.0000000' AS DateTime2), N'Crear reclamo', N'CRIT')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (54, 1, CAST(N'2024-10-19T00:00:00.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (55, 2, CAST(N'2024-10-19T00:00:00.0000000' AS DateTime2), N'Cambio de contraseña', N'WARN')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (56, 3, CAST(N'2024-10-19T00:00:00.0000000' AS DateTime2), N'Recuperación de clave', N'CRIT')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (57, 1, CAST(N'2024-10-19T00:00:00.0000000' AS DateTime2), N'Actualizar perfil', N'WARN')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (58, 2, CAST(N'2024-10-19T00:00:00.0000000' AS DateTime2), N'Leer publicación', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (59, 3, CAST(N'2024-10-19T00:00:00.0000000' AS DateTime2), N'Agregar a favoritos', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (60, 1, CAST(N'2024-10-19T00:00:00.0000000' AS DateTime2), N'Eliminar favoritos', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (61, 2, CAST(N'2024-10-19T00:00:00.0000000' AS DateTime2), N'Búsqueda Avanzada', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (62, 3, CAST(N'2024-10-19T00:00:00.0000000' AS DateTime2), N'Compartir en redes', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (63, 1, CAST(N'2024-10-19T00:00:00.0000000' AS DateTime2), N'Crear reclamo', N'CRIT')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (64, 1, CAST(N'2024-10-18T00:00:00.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (65, 2, CAST(N'2024-10-18T00:00:00.0000000' AS DateTime2), N'Cambio de contraseña', N'WARN')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (66, 3, CAST(N'2024-10-18T00:00:00.0000000' AS DateTime2), N'Recuperación de clave', N'CRIT')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (67, 1, CAST(N'2024-10-18T00:00:00.0000000' AS DateTime2), N'Actualizar perfil', N'WARN')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (68, 2, CAST(N'2024-10-18T00:00:00.0000000' AS DateTime2), N'Leer publicación', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (69, 3, CAST(N'2024-10-18T00:00:00.0000000' AS DateTime2), N'Agregar a favoritos', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (70, 1, CAST(N'2024-10-18T00:00:00.0000000' AS DateTime2), N'Eliminar favoritos', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (71, 2, CAST(N'2024-10-18T00:00:00.0000000' AS DateTime2), N'Búsqueda Avanzada', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (72, 3, CAST(N'2024-10-18T00:00:00.0000000' AS DateTime2), N'Compartir en redes', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (73, 1, CAST(N'2024-10-18T00:00:00.0000000' AS DateTime2), N'Crear reclamo', N'CRIT')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (74, 2, CAST(N'2024-10-17T00:00:00.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (75, 3, CAST(N'2024-10-17T00:00:00.0000000' AS DateTime2), N'Cambio de contraseña', N'WARN')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (76, 1, CAST(N'2024-10-17T00:00:00.0000000' AS DateTime2), N'Recuperación de clave', N'CRIT')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (77, 2, CAST(N'2024-10-17T00:00:00.0000000' AS DateTime2), N'Actualizar perfil', N'WARN')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (78, 3, CAST(N'2024-10-17T00:00:00.0000000' AS DateTime2), N'Leer publicación', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (79, 1, CAST(N'2024-10-17T00:00:00.0000000' AS DateTime2), N'Agregar a favoritos', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (80, 2, CAST(N'2024-10-17T00:00:00.0000000' AS DateTime2), N'Eliminar favoritos', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (81, 3, CAST(N'2024-10-17T00:00:00.0000000' AS DateTime2), N'Búsqueda Avanzada', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (82, 1, CAST(N'2024-10-17T00:00:00.0000000' AS DateTime2), N'Compartir en redes', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (83, 2, CAST(N'2024-10-17T00:00:00.0000000' AS DateTime2), N'Crear reclamo', N'CRIT')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (84, 1, CAST(N'2024-10-19T00:00:00.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (85, 2, CAST(N'2024-10-19T00:00:00.0000000' AS DateTime2), N'Cambio de contraseña', N'WARN')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (86, 3, CAST(N'2024-10-19T00:00:00.0000000' AS DateTime2), N'Recuperación de clave', N'CRIT')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (87, 1, CAST(N'2024-10-19T00:00:00.0000000' AS DateTime2), N'Actualizar perfil', N'WARN')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (88, 2, CAST(N'2024-10-19T00:00:00.0000000' AS DateTime2), N'Leer publicación', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (89, 3, CAST(N'2024-10-19T00:00:00.0000000' AS DateTime2), N'Agregar a favoritos', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (90, 1, CAST(N'2024-10-19T00:00:00.0000000' AS DateTime2), N'Eliminar favoritos', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (91, 2, CAST(N'2024-10-19T00:00:00.0000000' AS DateTime2), N'Búsqueda Avanzada', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (92, 3, CAST(N'2024-10-19T00:00:00.0000000' AS DateTime2), N'Compartir en redes', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (93, 1, CAST(N'2024-10-19T00:00:00.0000000' AS DateTime2), N'Crear reclamo', N'CRIT')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (98, 1, CAST(N'2024-10-31T00:00:00.0000000' AS DateTime2), N'Crear reclamo', N'CRIT')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (102, 8, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Intento fallido de incio de sesión', N'WARN')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (103, 8, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Intento fallido de incio de sesión', N'WARN')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (104, 8, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Intento fallido de incio de sesión', N'WARN')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (105, 8, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Intento fallido de incio de sesión', N'WARN')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (108, 1, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Intento fallido de incio de sesión', N'WARN')
GO
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (109, 1, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (114, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (115, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Nuevo usuario  - pablo@gmail.com', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (116, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (117, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (118, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Leer publicación  - 44', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (119, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Leer publicación  - 44', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (120, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Búsqueda Avanzada - 44', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (121, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Leer publicación  - 44', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (122, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Búsqueda Avanzada - 44', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (123, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar favoritos', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (124, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar top publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (125, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar categorias', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (126, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (127, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar autores', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (128, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar autor  - 1', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (129, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Realizar busqueda', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (130, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar reclamos', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (131, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Email de recuperacion enviado a pablo@gmail.com', N'WARN')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (133, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (134, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (135, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar autores', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (136, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (137, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar favoritos', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (138, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (139, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Leer publicación  - 32', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (140, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Leer publicación  - 32', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (141, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Agregado a favoritos  - 32', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (142, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar favoritos', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (143, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar favoritos', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (144, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (145, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Leer publicación  - 33', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (146, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Leer publicación  - 33', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (147, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Agregado a favoritos  - 33', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (148, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar favoritos', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (149, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar favoritos', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (150, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (151, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Leer publicación  - 40', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (152, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Leer publicación  - 40', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (153, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Agregado a favoritos  - 40', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (154, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar favoritos', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (155, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Intento fallido de incio de sesión', N'WARN')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (156, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (157, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (158, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Leer publicación  - 44', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (159, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Leer publicación  - 44', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (160, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Agregado a favoritos  - 44', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (161, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar favoritos', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (162, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar top publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (163, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cambio de contraseña', N'WARN')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (164, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Intento fallido de incio de sesión', N'WARN')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (165, 999999, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Email de recuperacion enviado a  - pablo@gmail.com', N'WARN')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (167, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Intento fallido de incio de sesión', N'WARN')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (168, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar favoritos', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (169, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar top publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (170, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Leer publicación  - 21', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (171, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Leer publicación  - 21', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (172, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Agregado a favoritos  - 21', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (173, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar top publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (174, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Leer publicación  - 21', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (175, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar top publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (176, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar autores', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (177, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Intento fallido de incio de sesión', N'WARN')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (178, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Usuario bloquado', N'CRIT')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (179, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Email de recuperacion enviado a  - pablo@gmail.com', N'WARN')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (181, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar favoritos', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (182, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (183, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (184, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Email de recuperacion enviado a  - pablo@gmail.com', N'WARN')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (186, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cambio de contraseña', N'WARN')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (187, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (188, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Email de recuperacion enviado a  - pablo@gmail.com', N'WARN')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (190, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cambio de contraseña', N'WARN')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (191, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (192, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (193, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Actualización de perfil', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (194, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Actualización de perfil', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (195, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Actualización de perfil', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (196, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (197, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (198, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Actualización de perfil', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (199, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Actualización de perfil', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (200, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar autores', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (201, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar autor  - 8', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (202, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar autores', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (203, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (204, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (205, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar autores', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (206, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Actualización de perfil', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (207, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar autores', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (208, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar autores', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (209, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar autores', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (210, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (211, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (212, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar autores', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (213, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Actualización de perfil', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (214, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar autores', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (215, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar autores', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (216, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar autores', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (217, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar autor  - 10', N'INFO')
GO
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (218, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Actualización de perfil', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (219, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar autores', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (220, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar autor  - 10', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (221, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar autor  - 10', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (222, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar autor  - 10', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (223, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar autor  - 10', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (224, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Actualización de perfil', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (225, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (226, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (227, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Actualización de perfil', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (228, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar autores', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (229, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar autores', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (230, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar autor  - 10', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (231, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Actualización de perfil', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (232, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Intento fallido de incio de sesión', N'WARN')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (233, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (234, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (235, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Actualización de perfil', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (236, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar autores', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (237, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar autor  - 10', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (238, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Actualización de perfil', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (239, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar autores', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (240, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar categorias', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (241, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar top publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (242, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar autores', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (243, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar autor  - 10', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (244, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Intento fallido de incio de sesión', N'WARN')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (245, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (246, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (247, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar autores', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (248, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Actualización de perfil', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (249, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (250, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (251, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar autores', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (252, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Actualización de perfil', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (253, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar autores', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (254, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar autores', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (255, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Publicacion actualizada ', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (256, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (257, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (258, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (259, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (260, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Publicacion actualizada  - 45 EN EDITOR', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (261, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Publicacion actualizada  - 45', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (262, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (263, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar top publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (264, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (265, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Leer publicación  - 45', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (266, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar top publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (267, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (268, 12, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (269, 1, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (270, 1, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (271, 12, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (272, 12, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (273, 12, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Publicacion actualizada  - 45 PAUSADA', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (274, 12, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Cargar favoritos', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (275, 12, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Cargar top publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (276, 12, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (277, 12, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Publicacion actualizada  - 45 EN EDITOR', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (278, 12, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Publicacion actualizada  - 45', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (279, 12, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Cargar top publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (280, 12, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (281, 1, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (282, 1, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (283, 12, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (284, 12, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (285, 12, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Leer publicación  - 45', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (286, 12, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Cargar top publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (287, 12, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Cargar autor  - 10', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (288, 12, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Leer publicación  - 45', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (289, 12, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Cargar top publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (290, 12, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Publicacion actualizada  - 45 PAUSADA', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (291, 12, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Cargar top publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (292, 12, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (293, 12, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Publicacion actualizada  - 45 EN EDITOR', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (294, 12, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (295, 12, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (296, 12, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Cargar autores', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (297, 12, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Cargar top publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (298, 12, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Publicacion actualizada  - 45 EN EDITOR', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (299, 12, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Publicacion actualizada  - 45', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (300, 12, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Cargar top publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (301, 12, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Leer publicación  - 45', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (302, 12, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (303, 12, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Cargar favoritos', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (304, 12, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Leer publicación  - 44', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (305, 1, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (306, 1, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (307, 1, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Publicacion actualizada  - 21 EN EDITOR', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (308, 1, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Publicacion actualizada  - 21', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (309, 1, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Cargar top publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (310, 1, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Leer publicación  - 21', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (311, 1, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (312, 1, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Publicacion actualizada  - 27 EN EDITOR', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (313, 1, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Publicacion actualizada  - 27', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (314, 1, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Cargar top publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (315, 1, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Leer publicación  - 40', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (316, 1, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Leer publicación  - 40', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (317, 1, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Agregado a favoritos  - 40', N'INFO')
GO
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (318, 1, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Cargar favoritos', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (319, 1, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Cargar top publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (320, 1, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Publicacion actualizada  - 40 ELIMINADA', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (321, 1, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Cargar favoritos', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (322, 1, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Cargar top publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (323, 1, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (324, 1, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (325, 1, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (326, 1, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (327, 1, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (328, 1, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (329, 1, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (330, 1, CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (331, 1, CAST(N'2024-11-09T18:32:37.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (332, 1, CAST(N'2024-11-09T18:32:38.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (333, 1, CAST(N'2024-11-09T18:32:55.0000000' AS DateTime2), N'Cargar top publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (334, 1, CAST(N'2024-11-09T18:32:58.0000000' AS DateTime2), N'Leer publicación  - 21', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (335, 1, CAST(N'2024-11-09T18:33:01.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (336, 1, CAST(N'2024-11-09T18:33:04.0000000' AS DateTime2), N'Cargar favoritos', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (337, 1, CAST(N'2024-11-09T18:33:06.0000000' AS DateTime2), N'Cargar categorias', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (338, 1, CAST(N'2024-11-09T18:33:08.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (339, 1, CAST(N'2024-11-09T18:33:21.0000000' AS DateTime2), N'Realizar busqueda', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (340, 1, CAST(N'2024-11-09T18:33:29.0000000' AS DateTime2), N'Realizar busqueda', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (341, 1, CAST(N'2024-11-09T18:33:37.0000000' AS DateTime2), N'Realizar busqueda', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (342, 1, CAST(N'2024-11-09T19:01:52.0000000' AS DateTime2), N'Intento fallido de incio de sesión', N'WARN')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (343, 1, CAST(N'2024-11-09T19:02:02.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (344, 1, CAST(N'2024-11-09T19:02:02.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (345, 1, CAST(N'2024-11-09T19:02:08.0000000' AS DateTime2), N'Cargar autores', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (346, 1, CAST(N'2024-11-09T19:02:10.0000000' AS DateTime2), N'Cargar autor  - 1', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (347, 1, CAST(N'2024-11-09T19:02:15.0000000' AS DateTime2), N'Cargar autores', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (348, 1, CAST(N'2024-11-09T19:02:16.0000000' AS DateTime2), N'Cargar autor  - 2', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (349, 1, CAST(N'2024-11-09T19:02:22.0000000' AS DateTime2), N'Cargar autores', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (350, 1, CAST(N'2024-11-09T19:02:24.0000000' AS DateTime2), N'Cargar autor  - 10', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (351, 1, CAST(N'2024-11-09T19:02:27.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (352, 1, CAST(N'2024-11-09T19:02:29.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (353, 1, CAST(N'2024-11-09T19:02:31.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (354, 1, CAST(N'2024-11-09T19:02:33.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (355, 1, CAST(N'2024-11-09T19:02:40.0000000' AS DateTime2), N'Cargar top publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (361, 1, CAST(N'2024-11-09T19:15:35.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (362, 1, CAST(N'2024-11-09T19:15:36.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (363, 1, CAST(N'2024-11-09T19:15:44.0000000' AS DateTime2), N'Realizar busqueda', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (364, 1, CAST(N'2024-11-09T19:15:51.0000000' AS DateTime2), N'Realizar busqueda', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (365, 1, CAST(N'2024-11-09T19:16:20.0000000' AS DateTime2), N'Realizar busqueda', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (366, 1, CAST(N'2024-11-09T19:16:26.0000000' AS DateTime2), N'Realizar busqueda', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (367, 1, CAST(N'2024-11-09T19:16:31.0000000' AS DateTime2), N'Realizar busqueda', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (368, 1, CAST(N'2024-11-09T19:16:37.0000000' AS DateTime2), N'Realizar busqueda', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (369, 1, CAST(N'2024-11-09T19:19:21.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (370, 1, CAST(N'2024-11-09T19:19:21.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (371, 1, CAST(N'2024-11-09T19:19:31.0000000' AS DateTime2), N'Realizar busqueda', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (372, 1, CAST(N'2024-11-09T19:19:36.0000000' AS DateTime2), N'Realizar busqueda', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (373, 1, CAST(N'2024-11-10T18:52:08.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (374, 1, CAST(N'2024-11-10T18:52:08.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (375, 1, CAST(N'2024-11-10T18:54:02.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (376, 1, CAST(N'2024-11-10T18:54:02.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (377, 1, CAST(N'2024-11-10T18:54:25.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (378, 1, CAST(N'2024-11-10T19:13:01.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (379, 1, CAST(N'2024-11-10T19:13:02.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (380, 1000000, CAST(N'2024-11-10T19:13:24.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (381, 1000000, CAST(N'2024-11-10T19:13:24.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (382, 1000000, CAST(N'2024-11-10T19:16:01.0000000' AS DateTime2), N'Intento fallido de incio de sesión', N'WARN')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (383, 1000000, CAST(N'2024-11-10T19:16:10.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (384, 1000000, CAST(N'2024-11-10T19:16:10.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (385, 1000000, CAST(N'2024-11-10T19:26:22.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (386, 1000000, CAST(N'2024-11-10T19:26:22.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (387, 1000000, CAST(N'2024-11-10T19:26:52.0000000' AS DateTime2), N'Publicacion actualizada  - 45 PAUSADA', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (388, 1000000, CAST(N'2024-11-10T19:26:56.0000000' AS DateTime2), N'Cargar top publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (389, 1000000, CAST(N'2024-11-10T19:27:15.0000000' AS DateTime2), N'Publicacion actualizada  - 45 EN EDITOR', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (390, 1000000, CAST(N'2024-11-10T19:27:18.0000000' AS DateTime2), N'Publicacion actualizada  - 45', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (391, 1000000, CAST(N'2024-11-10T19:27:24.0000000' AS DateTime2), N'Cargar top publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (392, 1000000, CAST(N'2024-11-10T19:27:27.0000000' AS DateTime2), N'Cargar autor  - 10', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (393, 1000000, CAST(N'2024-11-10T19:27:30.0000000' AS DateTime2), N'Leer publicación  - 45', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (394, 1000000, CAST(N'2024-11-10T19:27:31.0000000' AS DateTime2), N'Cargar top publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (395, 1000000, CAST(N'2024-11-10T19:27:34.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (396, 1000000, CAST(N'2024-11-10T19:27:39.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (397, 12, CAST(N'2024-11-10T19:51:56.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (398, 12, CAST(N'2024-11-10T19:51:56.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (399, 1000000, CAST(N'2024-11-10T19:52:33.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (400, 1000000, CAST(N'2024-11-10T19:52:33.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (401, 12, CAST(N'2024-11-10T20:00:17.0000000' AS DateTime2), N'Intento fallido de incio de sesión', N'WARN')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (402, 12, CAST(N'2024-11-10T20:00:17.0000000' AS DateTime2), N'Usuario bloquado', N'CRIT')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (403, 12, CAST(N'2024-11-10T20:00:53.0000000' AS DateTime2), N'Email de recuperacion enviado a  - pablo@gmail.com', N'WARN')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (405, 12, CAST(N'2024-11-10T20:01:04.0000000' AS DateTime2), N'Cambio de contraseña', N'WARN')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (406, 1000000, CAST(N'2024-11-10T20:04:34.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (407, 1000000, CAST(N'2024-11-10T20:04:34.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (408, 1000000, CAST(N'2024-11-10T20:04:53.0000000' AS DateTime2), N'Cargar reclamos', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (409, 1, CAST(N'2024-11-10T20:26:27.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (410, 1, CAST(N'2024-11-10T20:26:27.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (411, 1, CAST(N'2024-11-10T20:26:53.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (412, 1, CAST(N'2024-11-10T20:34:28.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (413, 1, CAST(N'2024-11-10T20:34:28.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (414, 1, CAST(N'2024-11-10T20:34:32.0000000' AS DateTime2), N'Cargar favoritos', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (415, 1, CAST(N'2024-11-10T20:34:34.0000000' AS DateTime2), N'Cargar autores', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (416, 1, CAST(N'2024-11-10T20:34:38.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (417, 1, CAST(N'2024-11-10T20:34:41.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (418, 1, CAST(N'2024-11-11T08:22:12.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (419, 1, CAST(N'2024-11-11T08:22:13.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (420, 1, CAST(N'2024-11-11T08:26:17.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (421, 1, CAST(N'2024-11-11T08:26:18.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (422, 1, CAST(N'2024-11-11T08:31:05.0000000' AS DateTime2), N'Intento fallido de incio de sesión', N'WARN')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (423, 1, CAST(N'2024-11-11T08:31:06.0000000' AS DateTime2), N'Intento fallido de incio de sesión', N'WARN')
GO
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (424, 1, CAST(N'2024-11-11T08:31:06.0000000' AS DateTime2), N'Usuario bloquado', N'CRIT')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (425, 1, CAST(N'2024-11-11T08:31:32.0000000' AS DateTime2), N'Email de recuperacion enviado a  - hugo.alconada@gmail.com', N'WARN')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (427, 1, CAST(N'2024-11-11T08:31:46.0000000' AS DateTime2), N'Cambio de contraseña', N'WARN')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (428, 1, CAST(N'2024-11-11T08:33:57.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (429, 1, CAST(N'2024-11-11T08:33:57.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (430, 1, CAST(N'2024-11-11T08:40:37.0000000' AS DateTime2), N'Publicacion actualizada ', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (431, 1, CAST(N'2024-11-11T08:40:44.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (432, 1, CAST(N'2024-11-11T08:40:49.0000000' AS DateTime2), N'Cargar top publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (433, 1, CAST(N'2024-11-11T08:41:04.0000000' AS DateTime2), N'Cierre de sesion', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (434, 1, CAST(N'2024-11-11T08:43:08.0000000' AS DateTime2), N'Intento fallido de incio de sesión', N'WARN')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (435, 1, CAST(N'2024-11-11T08:44:14.0000000' AS DateTime2), N'Intento fallido de incio de sesión', N'WARN')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (436, 1, CAST(N'2024-11-11T08:45:06.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (437, 1, CAST(N'2024-11-11T08:45:07.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (448, 1000000, CAST(N'2024-11-11T09:08:07.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (449, 1000000, CAST(N'2024-11-11T09:08:08.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (450, 1000000, CAST(N'2024-11-11T09:08:33.0000000' AS DateTime2), N'Cargar reclamos', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (451, 1000000, CAST(N'2024-11-11T09:08:35.0000000' AS DateTime2), N'Cargar reclamos', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (452, 1000000, CAST(N'2024-11-11T09:08:41.0000000' AS DateTime2), N'Cargar reclamos', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (499, 1, CAST(N'2024-11-11T10:05:13.0000000' AS DateTime2), N'Inicio de sesión', N'INFO')
INSERT [dbo].[bitacora] ([bitacoraid], [usuarioid], [fecha], [accion], [criticidad]) VALUES (500, 1, CAST(N'2024-11-11T10:05:13.0000000' AS DateTime2), N'Cargar publicaciones', N'INFO')
SET IDENTITY_INSERT [dbo].[bitacora] OFF
GO
SET IDENTITY_INSERT [dbo].[categorias] ON 

INSERT [dbo].[categorias] ([categoriaid], [nombre], [imagen]) VALUES (1, N'Política', N'img/casa-rosada.jpg')
INSERT [dbo].[categorias] ([categoriaid], [nombre], [imagen]) VALUES (2, N'Economía', N'img/dolar2.jpg')
INSERT [dbo].[categorias] ([categoriaid], [nombre], [imagen]) VALUES (3, N'Deportes', N'img/messi.jpg')
INSERT [dbo].[categorias] ([categoriaid], [nombre], [imagen]) VALUES (4, N'Tecnología', N'img/robot.jpg')
INSERT [dbo].[categorias] ([categoriaid], [nombre], [imagen]) VALUES (5, N'Viajes', N'img/viajes.jpeg')
INSERT [dbo].[categorias] ([categoriaid], [nombre], [imagen]) VALUES (6, N'Negocio', N'img/acciones.jpeg')
SET IDENTITY_INSERT [dbo].[categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[estados] ON 

INSERT [dbo].[estados] ([estadoid], [nombre]) VALUES (1, N'activo')
INSERT [dbo].[estados] ([estadoid], [nombre]) VALUES (2, N'pausado')
INSERT [dbo].[estados] ([estadoid], [nombre]) VALUES (3, N'borrador')
INSERT [dbo].[estados] ([estadoid], [nombre]) VALUES (4, N'bloqueado')
SET IDENTITY_INSERT [dbo].[estados] OFF
GO
SET IDENTITY_INSERT [dbo].[favoritos] ON 

INSERT [dbo].[favoritos] ([favoritoid], [usuarioid], [publicacionid], [fechaagregado]) VALUES (1, 1, 1, CAST(N'2024-06-05T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[favoritos] ([favoritoid], [usuarioid], [publicacionid], [fechaagregado]) VALUES (2, 2, 2, CAST(N'2024-06-06T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[favoritos] ([favoritoid], [usuarioid], [publicacionid], [fechaagregado]) VALUES (3, 3, 3, CAST(N'2024-06-07T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[favoritos] ([favoritoid], [usuarioid], [publicacionid], [fechaagregado]) VALUES (6, 1, 21, CAST(N'2024-11-02T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[favoritos] ([favoritoid], [usuarioid], [publicacionid], [fechaagregado]) VALUES (7, 10, 44, CAST(N'2024-11-07T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[favoritos] ([favoritoid], [usuarioid], [publicacionid], [fechaagregado]) VALUES (8, 12, 44, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[favoritos] ([favoritoid], [usuarioid], [publicacionid], [fechaagregado]) VALUES (9, 12, 21, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[favoritos] OFF
GO
SET IDENTITY_INSERT [dbo].[publicaciones] ON 

INSERT [dbo].[publicaciones] ([publicacionid], [titulo], [subtitulo], [contenido], [imagen], [fechapublicacion], [autorid], [categoriaid], [estadoid], [contador_total], [contador_semanal], [id_tipo_letra], [id_tipo_tamano], [parrafos]) VALUES (1, N'Caso Chocolate: ordenaron la inhibición general de todo el patrimonio de los Albini', N'Investigación sobre el caso Albini', N'Detalles sobre el caso Chocolate y la intervención judicial.', N'img/chocolate.jpg', CAST(N'2024-06-04T00:00:00.0000000' AS DateTime2), 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[publicaciones] ([publicacionid], [titulo], [subtitulo], [contenido], [imagen], [fechapublicacion], [autorid], [categoriaid], [estadoid], [contador_total], [contador_semanal], [id_tipo_letra], [id_tipo_tamano], [parrafos]) VALUES (2, N'El contrato de Mbappé en el Real Madrid es impresionante', N'Mbappé en el Real Madrid', N'Un análisis del nuevo contrato de Mbappé con el club.', N'img/mbappe.jpg', CAST(N'2024-06-04T00:00:00.0000000' AS DateTime2), 3, 3, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[publicaciones] ([publicacionid], [titulo], [subtitulo], [contenido], [imagen], [fechapublicacion], [autorid], [categoriaid], [estadoid], [contador_total], [contador_semanal], [id_tipo_letra], [id_tipo_tamano], [parrafos]) VALUES (3, N'Karina Milei manejó una sociedad en Miami que compró cuatro propiedades por unos US$2,7 millones', N'Investigación sobre Karina Milei', N'Un reportaje sobre las propiedades adquiridas por Karina Milei.', N'img/karina-milei.jpg', CAST(N'2024-06-04T00:00:00.0000000' AS DateTime2), 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[publicaciones] ([publicacionid], [titulo], [subtitulo], [contenido], [imagen], [fechapublicacion], [autorid], [categoriaid], [estadoid], [contador_total], [contador_semanal], [id_tipo_letra], [id_tipo_tamano], [parrafos]) VALUES (18, N'Las criptomonedas y su impacto', N'¿Es el futuro financiero digital?', N'Las criptomonedas están ganando terreno en el mundo financiero, y muchos expertos creen que podrían transformar la economía global. Sin embargo, también existen riesgos asociados a su volatilidad y regulaciones que aún no están completamente claras.', N'img2/imagen_1.jpg', CAST(N'2024-01-15T00:00:00.0000000' AS DateTime2), 1, 2, 1, 150, 10, 1, 1, 1)
INSERT [dbo].[publicaciones] ([publicacionid], [titulo], [subtitulo], [contenido], [imagen], [fechapublicacion], [autorid], [categoriaid], [estadoid], [contador_total], [contador_semanal], [id_tipo_letra], [id_tipo_tamano], [parrafos]) VALUES (19, N'El mercado laboral post-pandemia123123', N'Nuevas oportunidades y retos', N'Con la pandemia de COVID-19, el mercado laboral ha sufrido grandes cambios. Nuevas modalidades de trabajo como el teletrabajo han llegado para quedarse, mientras que algunas industrias enfrentan retos importantes en su recuperación.', N'img2/imagen_2.jpg', CAST(N'2024-10-17T00:00:00.0000000' AS DateTime2), 1, 3, 3, 120, 15, 3, 6, 1)
INSERT [dbo].[publicaciones] ([publicacionid], [titulo], [subtitulo], [contenido], [imagen], [fechapublicacion], [autorid], [categoriaid], [estadoid], [contador_total], [contador_semanal], [id_tipo_letra], [id_tipo_tamano], [parrafos]) VALUES (20, N'La IA en la educación', N'Revolucionando la forma de aprender', N'La inteligencia artificial está revolucionando la educación, desde herramientas personalizadas de aprendizaje hasta tutores virtuales que mejoran la experiencia educativa. Sin embargo, también plantea interrogantes sobre la adaptación de los docentes.', N'img2/imagen_3.jpg', CAST(N'2024-03-12T00:00:00.0000000' AS DateTime2), 3, 4, 1, 200, 25, 1, 1, 1)
INSERT [dbo].[publicaciones] ([publicacionid], [titulo], [subtitulo], [contenido], [imagen], [fechapublicacion], [autorid], [categoriaid], [estadoid], [contador_total], [contador_semanal], [id_tipo_letra], [id_tipo_tamano], [parrafos]) VALUES (21, N'El cambio climático y sus efectos', N'¿Podemos detenerlo?', N'Este es el párrafo 1. Puedes editar este contenido.,El cambio climático es uno de los mayores desafíos de nuestro tiempo. Desde el aumento del nivel del mar hasta los fenómenos meteorológicos extremos, el impacto es global y requiere acciones inmediatas para mitigar sus efectos.

Escribe el contenido del segundo párrafo aquí.

Escribe el contenido del tercer párrafo aquí.', N'img2/imagen_4.jpg', CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), 1, 1, 1, 505, 55, 1, 1, 1)
INSERT [dbo].[publicaciones] ([publicacionid], [titulo], [subtitulo], [contenido], [imagen], [fechapublicacion], [autorid], [categoriaid], [estadoid], [contador_total], [contador_semanal], [id_tipo_letra], [id_tipo_tamano], [parrafos]) VALUES (22, N'Los avances en medicina genética', N'¿Una cura para el cáncer?', N'La medicina genética ha permitido avances impresionantes en el tratamiento de enfermedades hereditarias y cáncer. Los ensayos clínicos actuales han mostrado resultados esperanzadores, lo que podría cambiar el panorama de la medicina moderna.', N'img2/imagen_5.jpg', CAST(N'2024-04-25T00:00:00.0000000' AS DateTime2), 2, 5, 1, 300, 20, 1, 1, 1)
INSERT [dbo].[publicaciones] ([publicacionid], [titulo], [subtitulo], [contenido], [imagen], [fechapublicacion], [autorid], [categoriaid], [estadoid], [contador_total], [contador_semanal], [id_tipo_letra], [id_tipo_tamano], [parrafos]) VALUES (23, N'Nuevas tecnologías para la agricultura', N'El futuro de los alimentos', N'La tecnología ha permitido mejorar los procesos agrícolas, optimizando el uso de agua y nutrientes. Estas innovaciones están siendo clave para garantizar la seguridad alimentaria y enfrentar el cambio climático que amenaza las cosechas globales.', N'img2/imagen_6.jpg', CAST(N'2024-05-10T00:00:00.0000000' AS DateTime2), 3, 1, 1, 400, 30, 1, 1, 1)
INSERT [dbo].[publicaciones] ([publicacionid], [titulo], [subtitulo], [contenido], [imagen], [fechapublicacion], [autorid], [categoriaid], [estadoid], [contador_total], [contador_semanal], [id_tipo_letra], [id_tipo_tamano], [parrafos]) VALUES (24, N'El papel del 5G en la conectividad global', N'Más allá de la velocidad', N'La red 5G no solo promete mayor velocidad de conexión, sino que también impulsará la automatización, el Internet de las cosas y las ciudades inteligentes. Su implementación global será clave para la transformación digital en los próximos años.', N'img2/imagen_7.jpg', CAST(N'2024-06-15T00:00:00.0000000' AS DateTime2), 1, 2, 1, 250, 18, 1, 1, 1)
INSERT [dbo].[publicaciones] ([publicacionid], [titulo], [subtitulo], [contenido], [imagen], [fechapublicacion], [autorid], [categoriaid], [estadoid], [contador_total], [contador_semanal], [id_tipo_letra], [id_tipo_tamano], [parrafos]) VALUES (25, N'La carrera hacia Marte', N'Nuevas fronteras espaciales', N'Las agencias espaciales están inmersas en una carrera para llegar a Marte. El planeta rojo representa el próximo gran desafío de la humanidad en la exploración espacial, y los planes para enviar humanos en la próxima década están avanzando rápidamente.', N'img2/imagen_8.jpg', CAST(N'2024-07-02T00:00:00.0000000' AS DateTime2), 2, 3, 1, 350, 22, 1, 1, 1)
INSERT [dbo].[publicaciones] ([publicacionid], [titulo], [subtitulo], [contenido], [imagen], [fechapublicacion], [autorid], [categoriaid], [estadoid], [contador_total], [contador_semanal], [id_tipo_letra], [id_tipo_tamano], [parrafos]) VALUES (26, N'La revolución de los autos eléctricos', N'¿Fin de la era del petróleo?', N'Los autos eléctricos están transformando la industria automotriz. Con cada vez más fabricantes apostando por estos vehículos, la transición hacia un transporte más limpio y sostenible parece inevitable, aunque quedan retos por superar, como la infraestructura de carga.', N'img2/imagen_9.jpg', CAST(N'2024-07-30T00:00:00.0000000' AS DateTime2), 3, 4, 1, 400, 25, 1, 1, 1)
INSERT [dbo].[publicaciones] ([publicacionid], [titulo], [subtitulo], [contenido], [imagen], [fechapublicacion], [autorid], [categoriaid], [estadoid], [contador_total], [contador_semanal], [id_tipo_letra], [id_tipo_tamano], [parrafos]) VALUES (27, N'El futuro del trabajo remoto', N'Nuevas tendencias post-pandemia', N'Este es el párrafo 1. Puedes editar este contenido.,El trabajo remoto ha llegado para quedarse, y muchas empresas están adoptando modelos híbridos. Este cambio representa nuevas oportunidades para trabajadores y empresas, pero también trae consigo desafíos en términos de productividad y gestión del personal.

Escribe el contenido del segundo párrafo aquí.

Escribe el contenido del tercer párrafo aquí.', N'img2/imagen_10.jpg', CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), 1, 5, 1, 180, 12, 1, 1, 1)
INSERT [dbo].[publicaciones] ([publicacionid], [titulo], [subtitulo], [contenido], [imagen], [fechapublicacion], [autorid], [categoriaid], [estadoid], [contador_total], [contador_semanal], [id_tipo_letra], [id_tipo_tamano], [parrafos]) VALUES (28, N'Inteligencia artificial y ética', N'Desafíos y debates actuales', N'La creciente implementación de inteligencia artificial ha planteado importantes preguntas éticas sobre el uso de datos, la toma de decisiones automatizadas y los sesgos. Las empresas tecnológicas deben equilibrar la innovación con la responsabilidad.', N'img2/imagen_11.jpg', CAST(N'2024-08-25T00:00:00.0000000' AS DateTime2), 2, 1, 1, 210, 14, 1, 1, 1)
INSERT [dbo].[publicaciones] ([publicacionid], [titulo], [subtitulo], [contenido], [imagen], [fechapublicacion], [autorid], [categoriaid], [estadoid], [contador_total], [contador_semanal], [id_tipo_letra], [id_tipo_tamano], [parrafos]) VALUES (29, N'Blockchain más allá de las criptomonedas', N'Nuevas aplicaciones emergentes', N'Aunque el blockchain es conocido por su relación con las criptomonedas, su potencial va mucho más allá. Desde sistemas de votación seguros hasta la trazabilidad en cadenas de suministro, esta tecnología está comenzando a transformar diversos sectores.', N'img2/imagen_12.jpg', CAST(N'2024-09-05T00:00:00.0000000' AS DateTime2), 3, 2, 1, 300, 28, 1, 1, 1)
INSERT [dbo].[publicaciones] ([publicacionid], [titulo], [subtitulo], [contenido], [imagen], [fechapublicacion], [autorid], [categoriaid], [estadoid], [contador_total], [contador_semanal], [id_tipo_letra], [id_tipo_tamano], [parrafos]) VALUES (30, N'La salud mental en la era digital', N'El impacto de las redes sociales', N'El uso masivo de redes sociales ha generado un impacto significativo en la salud mental, especialmente entre los jóvenes. Los expertos advierten sobre los riesgos de la adicción y los problemas de autoestima derivados de la exposición continua en estas plataformas.', N'img2/imagen_13.jpg', CAST(N'2024-09-12T00:00:00.0000000' AS DateTime2), 1, 3, 3, 500, 32, 1, 1, 1)
INSERT [dbo].[publicaciones] ([publicacionid], [titulo], [subtitulo], [contenido], [imagen], [fechapublicacion], [autorid], [categoriaid], [estadoid], [contador_total], [contador_semanal], [id_tipo_letra], [id_tipo_tamano], [parrafos]) VALUES (31, N'El auge del comercio electrónico', N'Nuevos hábitos de consumo', N'El comercio electrónico ha crecido de manera exponencial en los últimos años. La facilidad de acceso y la comodidad han cambiado los hábitos de consumo de las personas, llevando a las empresas a adaptarse a esta nueva realidad digital.', N'img2/imagen_14.jpg', CAST(N'2024-09-18T00:00:00.0000000' AS DateTime2), 2, 4, 1, 320, 22, 1, 1, 1)
INSERT [dbo].[publicaciones] ([publicacionid], [titulo], [subtitulo], [contenido], [imagen], [fechapublicacion], [autorid], [categoriaid], [estadoid], [contador_total], [contador_semanal], [id_tipo_letra], [id_tipo_tamano], [parrafos]) VALUES (32, N'Tecnologías verdes para un planeta sostenible', N'Innovación para el medio ambiente', N'La tecnología verde está jugando un papel crucial en la lucha contra el cambio climático. Innovaciones en energía renovable, gestión de residuos y conservación de recursos naturales están ayudando a crear un futuro más sostenible para todos.', N'img2/imagen_15.jpg', CAST(N'2024-09-25T00:00:00.0000000' AS DateTime2), 3, 5, 1, 280, 19, 1, 1, 1)
INSERT [dbo].[publicaciones] ([publicacionid], [titulo], [subtitulo], [contenido], [imagen], [fechapublicacion], [autorid], [categoriaid], [estadoid], [contador_total], [contador_semanal], [id_tipo_letra], [id_tipo_tamano], [parrafos]) VALUES (33, N'Economía circular: una alternativa al modelo lineal', N'Reducir, reutilizar y reciclar', N'La economía circular busca reemplazar el actual modelo de producción y consumo lineal. Se enfoca en reducir el desperdicio, reutilizar productos y reciclar materiales, ofreciendo una solución más sostenible para el futuro del planeta.', N'img2/imagen_16.jpg', CAST(N'2024-10-08T00:00:00.0000000' AS DateTime2), 1, 1, 1, 410, 35, 1, 1, 1)
INSERT [dbo].[publicaciones] ([publicacionid], [titulo], [subtitulo], [contenido], [imagen], [fechapublicacion], [autorid], [categoriaid], [estadoid], [contador_total], [contador_semanal], [id_tipo_letra], [id_tipo_tamano], [parrafos]) VALUES (34, N'El rol de la ciberseguridad en la era digital', N'Protegiendo la información en línea', N'La ciberseguridad se ha convertido en una prioridad para empresas y gobiernos a medida que los ataques cibernéticos son más frecuentes y sofisticados. Proteger la información sensible es clave para mantener la confianza en el mundo digital.', N'img2/imagen_17.jpg', CAST(N'2024-09-12T00:00:00.0000000' AS DateTime2), 2, 2, 1, 290, 18, 1, 1, 1)
INSERT [dbo].[publicaciones] ([publicacionid], [titulo], [subtitulo], [contenido], [imagen], [fechapublicacion], [autorid], [categoriaid], [estadoid], [contador_total], [contador_semanal], [id_tipo_letra], [id_tipo_tamano], [parrafos]) VALUES (35, N'La digitalización del sistema financiero', N'Bancos digitales y fintechs', N'La digitalización del sistema financiero está transformando la forma en que las personas interactúan con los servicios bancarios. Las fintechs han ganado popularidad por su enfoque en la experiencia del usuario y la agilidad en sus procesos.', N'img2/imagen_18.jpg', CAST(N'2024-09-18T00:00:00.0000000' AS DateTime2), 3, 3, 1, 330, 20, 1, 1, 1)
INSERT [dbo].[publicaciones] ([publicacionid], [titulo], [subtitulo], [contenido], [imagen], [fechapublicacion], [autorid], [categoriaid], [estadoid], [contador_total], [contador_semanal], [id_tipo_letra], [id_tipo_tamano], [parrafos]) VALUES (36, N'El desafío del transporte sostenible', N'Movilidad urbana en el siglo XXI', N'El transporte sostenible es uno de los grandes retos para las ciudades modernas. Con el aumento de la población urbana, es fundamental encontrar soluciones de movilidad que reduzcan la contaminación y el tráfico, como el transporte eléctrico y los vehículos compartidos.', N'img2/imagen_19.jpg', CAST(N'2024-10-05T00:00:00.0000000' AS DateTime2), 1, 4, 1, 450, 40, 1, 1, 1)
INSERT [dbo].[publicaciones] ([publicacionid], [titulo], [subtitulo], [contenido], [imagen], [fechapublicacion], [autorid], [categoriaid], [estadoid], [contador_total], [contador_semanal], [id_tipo_letra], [id_tipo_tamano], [parrafos]) VALUES (37, N'El futuro del entretenimiento con realidad virtual', N'Una nueva forma de vivir experiencias', N'La realidad virtual está cambiando la forma en que las personas disfrutan del entretenimiento. Desde videojuegos inmersivos hasta experiencias culturales, la tecnología VR tiene el potencial de transformar por completo la industria del entretenimiento.', N'img2/imagen_20.jpg', CAST(N'2024-09-12T00:00:00.0000000' AS DateTime2), 2, 5, 1, 380, 30, 1, 1, 1)
INSERT [dbo].[publicaciones] ([publicacionid], [titulo], [subtitulo], [contenido], [imagen], [fechapublicacion], [autorid], [categoriaid], [estadoid], [contador_total], [contador_semanal], [id_tipo_letra], [id_tipo_tamano], [parrafos]) VALUES (38, N'VIDEOS y FOTOS del huracán Milton: Así se sintió la fuerza del ciclón en Yucatán, Quintana Roo y Campeche', N'En menos de 24 horas, el huracán Milton llegó a ser de categoría 5, la máxima en la escala Saffir Simpson ', N'A las 00:01 horas del 8 de octubre de 2024, el huracán Milton se degradó a categoría 4, así lo informó la Comisión Nacional del Agua (Conagua). El ciclón, que llegó a ser de categoría 5, la máxima en la escala Saffir-Simpson, cambió su cono de incertidumbre, desplazándose 30 km al norte por lo que se descartó que habrá un impacto directo del centro del huracán en la costa de Yucatán. ', N'img2/imagen_13.jpg', CAST(N'2024-10-16T00:00:00.0000000' AS DateTime2), 1, 5, 3, 0, 0, 1, 1, 1)
INSERT [dbo].[publicaciones] ([publicacionid], [titulo], [subtitulo], [contenido], [imagen], [fechapublicacion], [autorid], [categoriaid], [estadoid], [contador_total], [contador_semanal], [id_tipo_letra], [id_tipo_tamano], [parrafos]) VALUES (39, N'El Gobierno busca bloquear los proyectos que intentan modificar la ley de DNU y amenaza con un veto', N'', N'En la Casa Rosada denuncian un intento de desestabilización contra un oficialismo en minoría legislativa, y apelarán a las inconsistencias entre las fuerzas que impulsan la reforma. Buscarán plantarse con ayuda de PRO tras el inicio del debate en la comisión de Asuntos Constitucionales, pero en la fuerza que conduce Macri dicen que no tienen una posición tomada', N'img2/imagen_9.jpg', CAST(N'2024-10-17T00:00:00.0000000' AS DateTime2), 1, 2, 3, 0, 0, 1, 1, 1)
INSERT [dbo].[publicaciones] ([publicacionid], [titulo], [subtitulo], [contenido], [imagen], [fechapublicacion], [autorid], [categoriaid], [estadoid], [contador_total], [contador_semanal], [id_tipo_letra], [id_tipo_tamano], [parrafos]) VALUES (44, N'Se permite usar multiples parrafos', N'A partir de ahora se pueden usar para las publicaciones', N'Este es el párrafo 1. Puedes editar este contenido.,Escribe el contenido del primer párrafo aquí.

Escribe el contenido del segundo párrafo aquí.

Escribe el contenido del tercer párrafo aquí.', N'img2/imagen_4.jpg', CAST(N'2024-10-18T00:00:00.0000000' AS DateTime2), 1, 1, 1, 1, 1, 4, 6, 3)
INSERT [dbo].[publicaciones] ([publicacionid], [titulo], [subtitulo], [contenido], [imagen], [fechapublicacion], [autorid], [categoriaid], [estadoid], [contador_total], [contador_semanal], [id_tipo_letra], [id_tipo_tamano], [parrafos]) VALUES (45, N'Como aprobar SAP y TFI', N'Pequeño detalle de lo que va a ser la cursada', N'Este es el párrafo 1. Puedes editar este contenido.,Este es el párrafo 1. Puedes editar este contenido.,Este es el párrafo 1. Puedes editar este contenido.,Este es el párrafo 1. Puedes editar este contenido.,Este es el párrafo 1. Puedes editar este contenido. Escribe el contenido del primer párrafo aquí.

Escribe el contenido del segundo párrafo aquí.

Escribe el contenido del tercer párrafo aquí.', N'Uploads/estudiosos.jpg', CAST(N'2024-11-10T19:27:18.0000000' AS DateTime2), 10, 5, 1, 4, 4, 2, 4, 1)
INSERT [dbo].[publicaciones] ([publicacionid], [titulo], [subtitulo], [contenido], [imagen], [fechapublicacion], [autorid], [categoriaid], [estadoid], [contador_total], [contador_semanal], [id_tipo_letra], [id_tipo_tamano], [parrafos]) VALUES (46, N'Nuevo cybermonday', N'Se viene una nueva entrega de ofertas', N'Se van hacer ofertas de viajes

y tambien ofertas de electrodomesticos.

Escribe el contenido del tercer párrafo aquí.', N'Uploads/electromesticos.jpg', CAST(N'2024-11-11T08:40:37.0000000' AS DateTime2), 1, 5, 1, 0, 0, 4, 5, 2)
SET IDENTITY_INSERT [dbo].[publicaciones] OFF
GO
SET IDENTITY_INSERT [dbo].[reclamos] ON 

INSERT [dbo].[reclamos] ([reclamoid], [usuarioid], [fecha], [estadoid], [descripcion], [nombre], [mail]) VALUES (1, 1, CAST(N'2024-06-05T00:00:00.0000000' AS DateTime2), 3, N'Problema con la visualización de la nota sobre política.', N'Juan Pérez', N'juan.perez@email.com')
INSERT [dbo].[reclamos] ([reclamoid], [usuarioid], [fecha], [estadoid], [descripcion], [nombre], [mail]) VALUES (2, 2, CAST(N'2024-06-06T00:00:00.0000000' AS DateTime2), 3, N'Error en el contenido de la publicación sobre economía.', N'María García', N'maria.garcia@email.com')
INSERT [dbo].[reclamos] ([reclamoid], [usuarioid], [fecha], [estadoid], [descripcion], [nombre], [mail]) VALUES (3, 3, CAST(N'2024-06-07T00:00:00.0000000' AS DateTime2), 2, N'Solicito corrección de información en la nota de deportes.', N'Carlos López', N'carlos.lopez@email.com')
INSERT [dbo].[reclamos] ([reclamoid], [usuarioid], [fecha], [estadoid], [descripcion], [nombre], [mail]) VALUES (5, 0, CAST(N'2024-10-05T00:00:00.0000000' AS DateTime2), 1, N'Problema con la visualización de la nota sobre política.', N'Juan Pérez', N'juan.perez@email.com')
INSERT [dbo].[reclamos] ([reclamoid], [usuarioid], [fecha], [estadoid], [descripcion], [nombre], [mail]) VALUES (6, 0, CAST(N'2024-11-01T00:00:00.0000000' AS DateTime2), 1, N'No me puedo registrar!', N'Damian Arata', N'dami@gmail.com')
SET IDENTITY_INSERT [dbo].[reclamos] OFF
GO
SET IDENTITY_INSERT [dbo].[reclamos_estados] ON 

INSERT [dbo].[reclamos_estados] ([estadoid], [nombre]) VALUES (1, N'Pendiente')
INSERT [dbo].[reclamos_estados] ([estadoid], [nombre]) VALUES (2, N'En Proceso')
INSERT [dbo].[reclamos_estados] ([estadoid], [nombre]) VALUES (3, N'Resuelto')
SET IDENTITY_INSERT [dbo].[reclamos_estados] OFF
GO
SET IDENTITY_INSERT [dbo].[tipo_letra] ON 

INSERT [dbo].[tipo_letra] ([id_tipo_letra], [nombre]) VALUES (1, N'Arial')
INSERT [dbo].[tipo_letra] ([id_tipo_letra], [nombre]) VALUES (2, N'Times New Roman')
INSERT [dbo].[tipo_letra] ([id_tipo_letra], [nombre]) VALUES (3, N'Verdana')
INSERT [dbo].[tipo_letra] ([id_tipo_letra], [nombre]) VALUES (4, N'Courier New')
INSERT [dbo].[tipo_letra] ([id_tipo_letra], [nombre]) VALUES (5, N'Georgia')
SET IDENTITY_INSERT [dbo].[tipo_letra] OFF
GO
SET IDENTITY_INSERT [dbo].[tipo_tamano] ON 

INSERT [dbo].[tipo_tamano] ([id_tipo_tamano], [nombre]) VALUES (1, N'8 pt')
INSERT [dbo].[tipo_tamano] ([id_tipo_tamano], [nombre]) VALUES (2, N'10 pt')
INSERT [dbo].[tipo_tamano] ([id_tipo_tamano], [nombre]) VALUES (3, N'12 pt')
INSERT [dbo].[tipo_tamano] ([id_tipo_tamano], [nombre]) VALUES (4, N'14 pt')
INSERT [dbo].[tipo_tamano] ([id_tipo_tamano], [nombre]) VALUES (5, N'16 pt')
INSERT [dbo].[tipo_tamano] ([id_tipo_tamano], [nombre]) VALUES (6, N'18 pt')
INSERT [dbo].[tipo_tamano] ([id_tipo_tamano], [nombre]) VALUES (7, N'20 pt')
SET IDENTITY_INSERT [dbo].[tipo_tamano] OFF
GO
SET IDENTITY_INSERT [dbo].[usuarios] ON 

INSERT [dbo].[usuarios] ([usuarioid], [nombre], [email], [contrasena], [fecharegistro], [admin], [blocked], [codigo], [retry]) VALUES (1, N'Hugo Alconada', N'hugo.alconada@gmail.com', N'SHVndWl0bzEyMyE=', CAST(N'2024-01-15T00:00:00.0000000' AS DateTime2), 0, 0, N'A', 0)
INSERT [dbo].[usuarios] ([usuarioid], [nombre], [email], [contrasena], [fecharegistro], [admin], [blocked], [codigo], [retry]) VALUES (2, N'Soledad Larghi', N'sole@gmail.com', N'MTIzNFNvbGUh', CAST(N'2024-03-22T00:00:00.0000000' AS DateTime2), 0, 0, N'D7VJ-6NR8-ETOL-267C', 0)
INSERT [dbo].[usuarios] ([usuarioid], [nombre], [email], [contrasena], [fecharegistro], [admin], [blocked], [codigo], [retry]) VALUES (3, N'Ernesto Tenembaum', N'ernesto@gmail.com', N'QVNERjEyMzQh', CAST(N'2024-05-10T00:00:00.0000000' AS DateTime2), 0, 0, N'A', 0)
INSERT [dbo].[usuarios] ([usuarioid], [nombre], [email], [contrasena], [fecharegistro], [admin], [blocked], [codigo], [retry]) VALUES (6, N'Damian Rodriguez', N'admin@admin.com', N'QVNERjEyMzQh', CAST(N'2024-01-01T00:00:00.0000000' AS DateTime2), 1, 0, N'A', 0)
INSERT [dbo].[usuarios] ([usuarioid], [nombre], [email], [contrasena], [fecharegistro], [admin], [blocked], [codigo], [retry]) VALUES (7, N'Carlos Pagni', N'charly@gmail.com', N'QVNERjEyMzQh', CAST(N'2024-02-02T00:00:00.0000000' AS DateTime2), 0, 0, N'A', 0)
INSERT [dbo].[usuarios] ([usuarioid], [nombre], [email], [contrasena], [fecharegistro], [admin], [blocked], [codigo], [retry]) VALUES (8, N'Pepito Perez', N'pepito@example.com', N'QVNERjEyMzQh', CAST(N'2024-11-01T00:00:00.0000000' AS DateTime2), 0, 1, N'A', 8)
INSERT [dbo].[usuarios] ([usuarioid], [nombre], [email], [contrasena], [fecharegistro], [admin], [blocked], [codigo], [retry]) VALUES (9, N'', N'leoparisi@gmail.com', N'QVNERjEyMzQh', CAST(N'2024-11-05T00:00:00.0000000' AS DateTime2), 0, 0, N'A', 0)
INSERT [dbo].[usuarios] ([usuarioid], [nombre], [email], [contrasena], [fecharegistro], [admin], [blocked], [codigo], [retry]) VALUES (10, N'', N'matinicolao@gmail.com', N'TWF0dXRlMTIzIQ==', CAST(N'2024-11-07T00:00:00.0000000' AS DateTime2), 0, 0, N'A', 0)
INSERT [dbo].[usuarios] ([usuarioid], [nombre], [email], [contrasena], [fecharegistro], [admin], [blocked], [codigo], [retry]) VALUES (11, N'', N'jorge@gmail.com', N'QVNERjEyMzQh', CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), 0, 0, N'A', 0)
INSERT [dbo].[usuarios] ([usuarioid], [nombre], [email], [contrasena], [fecharegistro], [admin], [blocked], [codigo], [retry]) VALUES (12, N'', N'pablo@gmail.com', N'UGFibGluMSE=', CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), 0, 0, N'A', 0)
INSERT [dbo].[usuarios] ([usuarioid], [nombre], [email], [contrasena], [fecharegistro], [admin], [blocked], [codigo], [retry]) VALUES (999999, N'Invitado', N'invitado@prensaverificada.ar', N'QVNERjEyMzQh', CAST(N'2024-11-01T00:00:00.0000000' AS DateTime2), 0, 0, N'A', 0)
INSERT [dbo].[usuarios] ([usuarioid], [nombre], [email], [contrasena], [fecharegistro], [admin], [blocked], [codigo], [retry]) VALUES (1000000, N'Administrador', N'administrador@prensaverificada.ar', N'YWRtaW5pc3RyYWRvcg==', CAST(N'2024-11-01T00:00:00.0000000' AS DateTime2), 1, 0, N'A', 0)
SET IDENTITY_INSERT [dbo].[usuarios] OFF
GO
ALTER TABLE [dbo].[autores] ADD  DEFAULT ('') FOR [medio]
GO
ALTER TABLE [dbo].[autores] ADD  DEFAULT ('') FOR [linkedin]
GO
ALTER TABLE [dbo].[autores] ADD  DEFAULT ('') FOR [facebook]
GO
ALTER TABLE [dbo].[autores] ADD  DEFAULT ('') FOR [youtube]
GO
ALTER TABLE [dbo].[comentarios] ADD  DEFAULT (getdate()) FOR [fecha]
GO
ALTER TABLE [dbo].[publicaciones] ADD  DEFAULT ((0)) FOR [contador_total]
GO
ALTER TABLE [dbo].[publicaciones] ADD  DEFAULT ((0)) FOR [contador_semanal]
GO
ALTER TABLE [dbo].[publicaciones] ADD  DEFAULT ((1)) FOR [id_tipo_letra]
GO
ALTER TABLE [dbo].[publicaciones] ADD  DEFAULT ((1)) FOR [id_tipo_tamano]
GO
ALTER TABLE [dbo].[publicaciones] ADD  DEFAULT ((1)) FOR [parrafos]
GO
ALTER TABLE [dbo].[usuarios] ADD  DEFAULT ((0)) FOR [admin]
GO
ALTER TABLE [dbo].[usuarios] ADD  DEFAULT ((0)) FOR [blocked]
GO
ALTER TABLE [dbo].[usuarios] ADD  CONSTRAINT [DF_usuarios_codigo]  DEFAULT ('A') FOR [codigo]
GO
ALTER TABLE [dbo].[usuarios] ADD  DEFAULT ((0)) FOR [retry]
GO
ALTER TABLE [dbo].[autores]  WITH CHECK ADD  CONSTRAINT [FK_Autores_Usuarios] FOREIGN KEY([usuarioid])
REFERENCES [dbo].[usuarios] ([usuarioid])
GO
ALTER TABLE [dbo].[autores] CHECK CONSTRAINT [FK_Autores_Usuarios]
GO
ALTER TABLE [dbo].[bitacora]  WITH CHECK ADD FOREIGN KEY([usuarioid])
REFERENCES [dbo].[usuarios] ([usuarioid])
GO
ALTER TABLE [dbo].[bitacora]  WITH CHECK ADD  CONSTRAINT [FK_Bitacora_Usuario] FOREIGN KEY([usuarioid])
REFERENCES [dbo].[usuarios] ([usuarioid])
GO
ALTER TABLE [dbo].[bitacora] CHECK CONSTRAINT [FK_Bitacora_Usuario]
GO
ALTER TABLE [dbo].[comentarios]  WITH CHECK ADD  CONSTRAINT [FK_Comentarios_Reclamos] FOREIGN KEY([reclamoid])
REFERENCES [dbo].[reclamos] ([reclamoid])
GO
ALTER TABLE [dbo].[comentarios] CHECK CONSTRAINT [FK_Comentarios_Reclamos]
GO
ALTER TABLE [dbo].[favoritos]  WITH CHECK ADD FOREIGN KEY([publicacionid])
REFERENCES [dbo].[publicaciones] ([publicacionid])
GO
ALTER TABLE [dbo].[favoritos]  WITH CHECK ADD FOREIGN KEY([usuarioid])
REFERENCES [dbo].[usuarios] ([usuarioid])
GO
ALTER TABLE [dbo].[publicaciones]  WITH CHECK ADD FOREIGN KEY([autorid])
REFERENCES [dbo].[autores] ([autorid])
GO
ALTER TABLE [dbo].[publicaciones]  WITH CHECK ADD FOREIGN KEY([categoriaid])
REFERENCES [dbo].[categorias] ([categoriaid])
GO
ALTER TABLE [dbo].[publicaciones]  WITH CHECK ADD FOREIGN KEY([estadoid])
REFERENCES [dbo].[estados] ([estadoid])
GO
ALTER TABLE [dbo].[publicaciones]  WITH CHECK ADD  CONSTRAINT [FK_publicaciones_tipo_letra] FOREIGN KEY([id_tipo_letra])
REFERENCES [dbo].[tipo_letra] ([id_tipo_letra])
GO
ALTER TABLE [dbo].[publicaciones] CHECK CONSTRAINT [FK_publicaciones_tipo_letra]
GO
ALTER TABLE [dbo].[publicaciones]  WITH CHECK ADD  CONSTRAINT [FK_publicaciones_tipo_tamano] FOREIGN KEY([id_tipo_tamano])
REFERENCES [dbo].[tipo_tamano] ([id_tipo_tamano])
GO
ALTER TABLE [dbo].[publicaciones] CHECK CONSTRAINT [FK_publicaciones_tipo_tamano]
GO
ALTER TABLE [dbo].[reclamos]  WITH CHECK ADD  CONSTRAINT [FK_reclamos_estados] FOREIGN KEY([estadoid])
REFERENCES [dbo].[reclamos_estados] ([estadoid])
GO
ALTER TABLE [dbo].[reclamos] CHECK CONSTRAINT [FK_reclamos_estados]
GO
ALTER TABLE [dbo].[publicaciones]  WITH CHECK ADD  CONSTRAINT [chk_parrafos] CHECK  (([parrafos]=(3) OR [parrafos]=(2) OR [parrafos]=(1)))
GO
ALTER TABLE [dbo].[publicaciones] CHECK CONSTRAINT [chk_parrafos]
GO
USE [master]
GO
ALTER DATABASE [PrensaVerificada] SET  READ_WRITE 
GO
