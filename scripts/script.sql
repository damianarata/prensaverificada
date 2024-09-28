USE [master]
GO
/****** Object:  Database [PrensaVerificada]    Script Date: 28/09/2024 13:37:51 ******/
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
/****** Object:  Table [dbo].[autores]    Script Date: 28/09/2024 13:37:51 ******/
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
PRIMARY KEY CLUSTERED 
(
	[autorid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bitacora]    Script Date: 28/09/2024 13:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bitacora](
	[bitacoraid] [int] IDENTITY(1,1) NOT NULL,
	[usuarioid] [int] NULL,
	[fecha] [date] NOT NULL,
	[accion] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[bitacoraid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categorias]    Script Date: 28/09/2024 13:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categorias](
	[categoriaid] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[categoriaid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[estados]    Script Date: 28/09/2024 13:37:51 ******/
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
/****** Object:  Table [dbo].[favoritos]    Script Date: 28/09/2024 13:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[favoritos](
	[favoritoid] [int] IDENTITY(1,1) NOT NULL,
	[usuarioid] [int] NULL,
	[publicacionid] [int] NULL,
	[fechaagregado] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[favoritoid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[publicaciones]    Script Date: 28/09/2024 13:37:51 ******/
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
	[fechapublicacion] [date] NOT NULL,
	[autorid] [int] NULL,
	[categoriaid] [int] NULL,
	[estadoid] [int] NULL,
	[contador_total] [int] NULL,
	[contador_semanal] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[publicacionid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reclamos]    Script Date: 28/09/2024 13:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reclamos](
	[reclamoid] [int] IDENTITY(1,1) NOT NULL,
	[usuarioid] [int] NULL,
	[fecha] [date] NOT NULL,
	[estado] [nvarchar](50) NOT NULL,
	[descripcion] [text] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[reclamoid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 28/09/2024 13:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[usuarioid] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](255) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[contrasena] [nvarchar](255) NOT NULL,
	[fecharegistro] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[usuarioid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[publicaciones] ADD  DEFAULT ((0)) FOR [contador_total]
GO
ALTER TABLE [dbo].[publicaciones] ADD  DEFAULT ((0)) FOR [contador_semanal]
GO
ALTER TABLE [dbo].[bitacora]  WITH CHECK ADD FOREIGN KEY([usuarioid])
REFERENCES [dbo].[usuarios] ([usuarioid])
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
ALTER TABLE [dbo].[reclamos]  WITH CHECK ADD FOREIGN KEY([usuarioid])
REFERENCES [dbo].[usuarios] ([usuarioid])
GO
USE [master]
GO
ALTER DATABASE [PrensaVerificada] SET  READ_WRITE 
GO
