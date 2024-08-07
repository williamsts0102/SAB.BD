USE [master]
GO
/****** Object:  Database [SABDB]    Script Date: 7/07/2024 20:53:12 ******/
CREATE DATABASE [SABDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SABDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SABDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SABDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SABDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SABDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SABDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SABDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SABDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SABDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SABDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SABDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SABDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SABDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SABDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SABDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SABDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SABDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SABDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SABDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SABDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SABDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SABDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SABDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SABDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SABDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SABDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SABDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SABDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SABDB] SET RECOVERY FULL 
GO
ALTER DATABASE [SABDB] SET  MULTI_USER 
GO
ALTER DATABASE [SABDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SABDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SABDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SABDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SABDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SABDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SABDB', N'ON'
GO
ALTER DATABASE [SABDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [SABDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SABDB]
GO
/****** Object:  Table [dbo].[tblAlerta]    Script Date: 7/07/2024 20:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAlerta](
	[intIdAlerta] [int] IDENTITY(1,1) NOT NULL,
	[strCodAlerta] [varchar](20) NULL,
	[strDepartamento] [varchar](20) NULL,
	[strProvincia] [varchar](20) NULL,
	[strDistrito] [varchar](20) NULL,
	[strDireccion] [varchar](50) NULL,
	[strLatitud] [varchar](200) NULL,
	[strLongitud] [varchar](200) NULL,
	[strDescripcion] [varchar](200) NULL,
	[bitEstado] [bit] NULL,
	[bitActivo] [bit] NULL,
	[bitEliminado] [bit] NULL,
	[intIdUsuarioRegistro] [int] NULL,
	[dtmFechaRegistro] [datetime] NULL,
	[intIdUsuarioModificacion] [int] NULL,
	[dtmFechaModificacion] [datetime] NULL,
	[intIdUsuarioEliminacion] [int] NULL,
	[dtmFechaEliminacion] [datetime] NULL,
	[intIdGrupoPersonal] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[intIdAlerta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCiudadano]    Script Date: 7/07/2024 20:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCiudadano](
	[intIdCiudadano] [int] IDENTITY(1,1) NOT NULL,
	[strCodCiudadano] [varchar](20) NULL,
	[strNombres] [varchar](50) NULL,
	[strApellidos] [varchar](50) NULL,
	[strDNI] [varchar](8) NULL,
	[strDireccion] [varchar](50) NULL,
	[strTelefono] [varchar](9) NULL,
	[strCorreo] [varchar](50) NULL,
	[bitEstado] [bit] NULL,
	[bitActivo] [bit] NULL,
	[bitEliminado] [bit] NULL,
	[intIdUsuarioRegistro] [int] NULL,
	[dtmFechaRegistro] [datetime] NULL,
	[intIdUsuarioModificacion] [int] NULL,
	[dtmFechaModificacion] [datetime] NULL,
	[intIdUsuarioEliminacion] [int] NULL,
	[dtmFechaEliminacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[intIdCiudadano] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblGrupoPersonal]    Script Date: 7/07/2024 20:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGrupoPersonal](
	[intIdGrupoPersonal] [int] IDENTITY(1,1) NOT NULL,
	[strCodGrupoPersonal] [varchar](20) NULL,
	[strNombreGrupoPersonal] [varchar](50) NULL,
	[strDescripcionGrupoPersonal] [varchar](200) NULL,
	[bitEstado] [bit] NULL,
	[bitActivo] [bit] NULL,
	[bitEliminado] [bit] NULL,
	[intIdUsuarioRegistro] [int] NULL,
	[dtmFechaRegistro] [datetime] NULL,
	[intIdUsuarioModificacion] [int] NULL,
	[dtmFechaModificacion] [datetime] NULL,
	[intIdUsuarioEliminacion] [int] NULL,
	[dtmFechaEliminacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[intIdGrupoPersonal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPersonal]    Script Date: 7/07/2024 20:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPersonal](
	[intIdPersonal] [int] IDENTITY(1,1) NOT NULL,
	[intIdGrupoPersonal] [int] NULL,
	[strCodPersonal] [varchar](20) NULL,
	[strNombres] [varchar](50) NULL,
	[strApellidos] [varchar](50) NULL,
	[strDNI] [varchar](8) NULL,
	[strDireccion] [varchar](50) NULL,
	[strTelefono] [varchar](9) NULL,
	[strCorreo] [varchar](50) NULL,
	[strUsuario] [varchar](20) NULL,
	[strContrasena] [varchar](20) NULL,
	[bitEstado] [bit] NULL,
	[bitActivo] [bit] NULL,
	[bitEliminado] [bit] NULL,
	[intIdUsuarioRegistro] [int] NULL,
	[dtmFechaRegistro] [datetime] NULL,
	[intIdUsuarioModificacion] [int] NULL,
	[dtmFechaModificacion] [datetime] NULL,
	[intIdUsuarioEliminacion] [int] NULL,
	[dtmFechaEliminacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[intIdPersonal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRol]    Script Date: 7/07/2024 20:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRol](
	[intIdRol] [int] IDENTITY(1,1) NOT NULL,
	[strNombreRol] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[intIdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsuario]    Script Date: 7/07/2024 20:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsuario](
	[intIdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[strUsuario] [varchar](100) NULL,
	[strContrasena] [varchar](max) NULL,
	[intIdRol] [int] NULL,
	[intIdPersonal] [int] NULL,
	[intIdCiudadano] [int] NULL,
	[bitEstado] [bit] NULL,
	[bitActivo] [bit] NULL,
	[bitEliminado] [bit] NULL,
	[dtmFechaRegistro] [datetime] NULL,
	[dtmFechaModificacion] [datetime] NULL,
	[dtmFechaEliminacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[intIdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblAlerta] ON 

INSERT [dbo].[tblAlerta] ([intIdAlerta], [strCodAlerta], [strDepartamento], [strProvincia], [strDistrito], [strDireccion], [strLatitud], [strLongitud], [strDescripcion], [bitEstado], [bitActivo], [bitEliminado], [intIdUsuarioRegistro], [dtmFechaRegistro], [intIdUsuarioModificacion], [dtmFechaModificacion], [intIdUsuarioEliminacion], [dtmFechaEliminacion], [intIdGrupoPersonal]) VALUES (1, N'ALERTA001', N'Lima', N'Lima', N'Miraflores', N'Av. Larco 123', N'-12.120987', N'-77.028654', N'Incendio en multicentro. Se requiere apoyo urgente.', 1, 1, 0, 1, CAST(N'2024-06-29T19:41:37.293' AS DateTime), 2, CAST(N'2024-07-04T18:07:11.487' AS DateTime), NULL, NULL, 3)
INSERT [dbo].[tblAlerta] ([intIdAlerta], [strCodAlerta], [strDepartamento], [strProvincia], [strDistrito], [strDireccion], [strLatitud], [strLongitud], [strDescripcion], [bitEstado], [bitActivo], [bitEliminado], [intIdUsuarioRegistro], [dtmFechaRegistro], [intIdUsuarioModificacion], [dtmFechaModificacion], [intIdUsuarioEliminacion], [dtmFechaEliminacion], [intIdGrupoPersonal]) VALUES (2, N'ALERTA002', N'Lima', N'Lima', N'Santiago de Surco', N'Fundo Monterrico Chico, Av. Circunvalación', N'-12.089765', N'-76.980432', N'Accidente vehicular grave. Necesidad de extracción de víctimas.', 1, 1, 0, 2, CAST(N'2024-07-04T18:10:37.923' AS DateTime), 2, CAST(N'2024-07-04T19:25:33.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[tblAlerta] ([intIdAlerta], [strCodAlerta], [strDepartamento], [strProvincia], [strDistrito], [strDireccion], [strLatitud], [strLongitud], [strDescripcion], [bitEstado], [bitActivo], [bitEliminado], [intIdUsuarioRegistro], [dtmFechaRegistro], [intIdUsuarioModificacion], [dtmFechaModificacion], [intIdUsuarioEliminacion], [dtmFechaEliminacion], [intIdGrupoPersonal]) VALUES (3, N'ALERTA003', N'Lima', N'Lima', N'San Isidro', N'Av. Salaverry 123', N'-12.096754', N'-77.035432', N'Emergencia médica. Persona inconsciente en vía pública.', 1, 1, 0, 2, CAST(N'2024-07-04T18:10:37.927' AS DateTime), 2, CAST(N'2024-07-04T18:33:32.837' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[tblAlerta] ([intIdAlerta], [strCodAlerta], [strDepartamento], [strProvincia], [strDistrito], [strDireccion], [strLatitud], [strLongitud], [strDescripcion], [bitEstado], [bitActivo], [bitEliminado], [intIdUsuarioRegistro], [dtmFechaRegistro], [intIdUsuarioModificacion], [dtmFechaModificacion], [intIdUsuarioEliminacion], [dtmFechaEliminacion], [intIdGrupoPersonal]) VALUES (4, N'ALERTA004', N'Lima', N'Lima', N'San Isidro', N'Av. Paseo de la República 1234', N'-12.106805', N'-77.034445', N'Accidente vehicular cerca de Av. Gral. Salaverry.', 1, 1, 0, 2, CAST(N'2024-07-04T18:10:37.927' AS DateTime), 2, CAST(N'2024-07-07T16:30:36.663' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[tblAlerta] ([intIdAlerta], [strCodAlerta], [strDepartamento], [strProvincia], [strDistrito], [strDireccion], [strLatitud], [strLongitud], [strDescripcion], [bitEstado], [bitActivo], [bitEliminado], [intIdUsuarioRegistro], [dtmFechaRegistro], [intIdUsuarioModificacion], [dtmFechaModificacion], [intIdUsuarioEliminacion], [dtmFechaEliminacion], [intIdGrupoPersonal]) VALUES (5, N'ALERTA005', N'Lima', N'Lima', N'San Isidro', N'Av. Canaval y Moreyra 567', N'-12.098964', N'-77.028603', N'Incendio en edificio de oficinas cerca de Av. Gral. Salaverry.', 1, 1, 0, 2, CAST(N'2024-07-04T18:36:13.927' AS DateTime), 2, CAST(N'2024-07-07T16:30:48.330' AS DateTime), NULL, NULL, 2)
INSERT [dbo].[tblAlerta] ([intIdAlerta], [strCodAlerta], [strDepartamento], [strProvincia], [strDistrito], [strDireccion], [strLatitud], [strLongitud], [strDescripcion], [bitEstado], [bitActivo], [bitEliminado], [intIdUsuarioRegistro], [dtmFechaRegistro], [intIdUsuarioModificacion], [dtmFechaModificacion], [intIdUsuarioEliminacion], [dtmFechaEliminacion], [intIdGrupoPersonal]) VALUES (6, N'ALERTA006', N'Lima', N'Lima', N'San Isidro', N'Av. Javier Prado Oeste 2345', N'-12.094653', N'-77.032784', N'Emergencia médica en centro comercial cercano a Av. Gral. Salaverry.', 1, 1, 0, 2, CAST(N'2024-07-04T18:36:13.930' AS DateTime), 2, CAST(N'2024-07-07T16:31:00.933' AS DateTime), NULL, NULL, 2)
INSERT [dbo].[tblAlerta] ([intIdAlerta], [strCodAlerta], [strDepartamento], [strProvincia], [strDistrito], [strDireccion], [strLatitud], [strLongitud], [strDescripcion], [bitEstado], [bitActivo], [bitEliminado], [intIdUsuarioRegistro], [dtmFechaRegistro], [intIdUsuarioModificacion], [dtmFechaModificacion], [intIdUsuarioEliminacion], [dtmFechaEliminacion], [intIdGrupoPersonal]) VALUES (7, N'ALERTA007', N'Lima', N'Lima', N'San Isidro', N'Av. República de Panamá 101', N'-12.102369', N'-77.034823', N'Fuga de gas cerca de Av. Gral. Salaverry.', 1, 1, 0, 2, CAST(N'2024-07-04T18:36:13.930' AS DateTime), 2, CAST(N'2024-07-07T16:31:36.130' AS DateTime), NULL, NULL, 2)
INSERT [dbo].[tblAlerta] ([intIdAlerta], [strCodAlerta], [strDepartamento], [strProvincia], [strDistrito], [strDireccion], [strLatitud], [strLongitud], [strDescripcion], [bitEstado], [bitActivo], [bitEliminado], [intIdUsuarioRegistro], [dtmFechaRegistro], [intIdUsuarioModificacion], [dtmFechaModificacion], [intIdUsuarioEliminacion], [dtmFechaEliminacion], [intIdGrupoPersonal]) VALUES (8, N'ALERTA008', N'Lima', N'Lima', N'Miraflores', N'Av. Larco 567', N'-12.122345', N'-77.028654', N'Deslizamiento de tierra en zona residencial. Peligro para viviendas cercanas.', 1, 1, 0, 2, CAST(N'2024-07-04T18:36:13.930' AS DateTime), NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[tblAlerta] OFF
GO
SET IDENTITY_INSERT [dbo].[tblGrupoPersonal] ON 

INSERT [dbo].[tblGrupoPersonal] ([intIdGrupoPersonal], [strCodGrupoPersonal], [strNombreGrupoPersonal], [strDescripcionGrupoPersonal], [bitEstado], [bitActivo], [bitEliminado], [intIdUsuarioRegistro], [dtmFechaRegistro], [intIdUsuarioModificacion], [dtmFechaModificacion], [intIdUsuarioEliminacion], [dtmFechaEliminacion]) VALUES (1, N'GRP001', N'Grupo de Rescate Nº 1', N'Grupo dedicado a labores de rescate y emergencias.', 1, 1, 0, 1, CAST(N'2024-07-02T20:52:43.180' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[tblGrupoPersonal] ([intIdGrupoPersonal], [strCodGrupoPersonal], [strNombreGrupoPersonal], [strDescripcionGrupoPersonal], [bitEstado], [bitActivo], [bitEliminado], [intIdUsuarioRegistro], [dtmFechaRegistro], [intIdUsuarioModificacion], [dtmFechaModificacion], [intIdUsuarioEliminacion], [dtmFechaEliminacion]) VALUES (2, N'GRP002', N'Grupo de Extinción de Incendios Nº 2', N'Grupo especializado en la extinción de incendios y control de materiales peligrosos.', 1, 1, 0, 2, CAST(N'2024-07-07T16:08:44.160' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[tblGrupoPersonal] ([intIdGrupoPersonal], [strCodGrupoPersonal], [strNombreGrupoPersonal], [strDescripcionGrupoPersonal], [bitEstado], [bitActivo], [bitEliminado], [intIdUsuarioRegistro], [dtmFechaRegistro], [intIdUsuarioModificacion], [dtmFechaModificacion], [intIdUsuarioEliminacion], [dtmFechaEliminacion]) VALUES (3, N'GRP003', N'Grupo de Atención Médica de Emergencias Nº 3', N'Grupo dedicado a brindar atención médica de emergencia y soporte vital avanzado.', 1, 1, 0, 2, CAST(N'2024-07-07T16:08:44.163' AS DateTime), NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblGrupoPersonal] OFF
GO
SET IDENTITY_INSERT [dbo].[tblPersonal] ON 

INSERT [dbo].[tblPersonal] ([intIdPersonal], [intIdGrupoPersonal], [strCodPersonal], [strNombres], [strApellidos], [strDNI], [strDireccion], [strTelefono], [strCorreo], [strUsuario], [strContrasena], [bitEstado], [bitActivo], [bitEliminado], [intIdUsuarioRegistro], [dtmFechaRegistro], [intIdUsuarioModificacion], [dtmFechaModificacion], [intIdUsuarioEliminacion], [dtmFechaEliminacion]) VALUES (1, 1, N'COD1234', N'Williams', N'Toro', N'12345678', N'Incas 342 Independencia', N'123456789', N'williams.toro@example.com', N'', N'', 1, 1, 0, 1, CAST(N'2024-07-02T20:52:56.097' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[tblPersonal] ([intIdPersonal], [intIdGrupoPersonal], [strCodPersonal], [strNombres], [strApellidos], [strDNI], [strDireccion], [strTelefono], [strCorreo], [strUsuario], [strContrasena], [bitEstado], [bitActivo], [bitEliminado], [intIdUsuarioRegistro], [dtmFechaRegistro], [intIdUsuarioModificacion], [dtmFechaModificacion], [intIdUsuarioEliminacion], [dtmFechaEliminacion]) VALUES (2, 1, N'COD1235', N'Laura', N'Gomez', N'87654321', N'Av. Libertad 123', N'987654321', N'laura.gomez@example.com', N'', N'', 1, 1, 0, 1, CAST(N'2024-07-07T16:12:05.363' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[tblPersonal] ([intIdPersonal], [intIdGrupoPersonal], [strCodPersonal], [strNombres], [strApellidos], [strDNI], [strDireccion], [strTelefono], [strCorreo], [strUsuario], [strContrasena], [bitEstado], [bitActivo], [bitEliminado], [intIdUsuarioRegistro], [dtmFechaRegistro], [intIdUsuarioModificacion], [dtmFechaModificacion], [intIdUsuarioEliminacion], [dtmFechaEliminacion]) VALUES (3, 1, N'COD1236', N'Carlos', N'Fernandez', N'56781234', N'Calle Sol 456', N'765432189', N'carlos.fernandez@example.com', N'', N'', 1, 1, 0, 1, CAST(N'2024-07-07T16:12:05.363' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[tblPersonal] ([intIdPersonal], [intIdGrupoPersonal], [strCodPersonal], [strNombres], [strApellidos], [strDNI], [strDireccion], [strTelefono], [strCorreo], [strUsuario], [strContrasena], [bitEstado], [bitActivo], [bitEliminado], [intIdUsuarioRegistro], [dtmFechaRegistro], [intIdUsuarioModificacion], [dtmFechaModificacion], [intIdUsuarioEliminacion], [dtmFechaEliminacion]) VALUES (4, 1, N'COD1237', N'Maria', N'Lopez', N'43215678', N'Jr. Lima 789', N'654321987', N'maria.lopez@example.com', N'', N'', 1, 1, 0, 1, CAST(N'2024-07-07T16:12:05.363' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[tblPersonal] ([intIdPersonal], [intIdGrupoPersonal], [strCodPersonal], [strNombres], [strApellidos], [strDNI], [strDireccion], [strTelefono], [strCorreo], [strUsuario], [strContrasena], [bitEstado], [bitActivo], [bitEliminado], [intIdUsuarioRegistro], [dtmFechaRegistro], [intIdUsuarioModificacion], [dtmFechaModificacion], [intIdUsuarioEliminacion], [dtmFechaEliminacion]) VALUES (5, 2, N'COD2234', N'Juan', N'Perez', N'23456789', N'Calle Fuego 123', N'234567891', N'juan.perez@example.com', N'', N'', 1, 1, 0, 2, CAST(N'2024-07-07T16:12:32.133' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[tblPersonal] ([intIdPersonal], [intIdGrupoPersonal], [strCodPersonal], [strNombres], [strApellidos], [strDNI], [strDireccion], [strTelefono], [strCorreo], [strUsuario], [strContrasena], [bitEstado], [bitActivo], [bitEliminado], [intIdUsuarioRegistro], [dtmFechaRegistro], [intIdUsuarioModificacion], [dtmFechaModificacion], [intIdUsuarioEliminacion], [dtmFechaEliminacion]) VALUES (6, 2, N'COD2235', N'Ana', N'Martinez', N'98765432', N'Av. Salvación 456', N'876543219', N'ana.martinez@example.com', N'', N'', 1, 1, 0, 2, CAST(N'2024-07-07T16:12:32.133' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[tblPersonal] ([intIdPersonal], [intIdGrupoPersonal], [strCodPersonal], [strNombres], [strApellidos], [strDNI], [strDireccion], [strTelefono], [strCorreo], [strUsuario], [strContrasena], [bitEstado], [bitActivo], [bitEliminado], [intIdUsuarioRegistro], [dtmFechaRegistro], [intIdUsuarioModificacion], [dtmFechaModificacion], [intIdUsuarioEliminacion], [dtmFechaEliminacion]) VALUES (7, 2, N'COD2236', N'Luis', N'Hernandez', N'34567890', N'Jr. Rescate 789', N'345678912', N'luis.hernandez@example.com', N'', N'', 1, 1, 0, 2, CAST(N'2024-07-07T16:12:32.133' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[tblPersonal] ([intIdPersonal], [intIdGrupoPersonal], [strCodPersonal], [strNombres], [strApellidos], [strDNI], [strDireccion], [strTelefono], [strCorreo], [strUsuario], [strContrasena], [bitEstado], [bitActivo], [bitEliminado], [intIdUsuarioRegistro], [dtmFechaRegistro], [intIdUsuarioModificacion], [dtmFechaModificacion], [intIdUsuarioEliminacion], [dtmFechaEliminacion]) VALUES (8, 2, N'COD2237', N'Isabel', N'Ramirez', N'45678901', N'Calle Llama 321', N'456789012', N'isabel.ramirez@example.com', N'', N'', 1, 1, 0, 2, CAST(N'2024-07-07T16:12:32.133' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[tblPersonal] ([intIdPersonal], [intIdGrupoPersonal], [strCodPersonal], [strNombres], [strApellidos], [strDNI], [strDireccion], [strTelefono], [strCorreo], [strUsuario], [strContrasena], [bitEstado], [bitActivo], [bitEliminado], [intIdUsuarioRegistro], [dtmFechaRegistro], [intIdUsuarioModificacion], [dtmFechaModificacion], [intIdUsuarioEliminacion], [dtmFechaEliminacion]) VALUES (9, 3, N'COD3234', N'Pedro', N'Rodriguez', N'56789012', N'Av. Salud 123', N'567890123', N'pedro.rodriguez@example.com', N'', N'', 1, 1, 0, 2, CAST(N'2024-07-07T16:12:48.683' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[tblPersonal] ([intIdPersonal], [intIdGrupoPersonal], [strCodPersonal], [strNombres], [strApellidos], [strDNI], [strDireccion], [strTelefono], [strCorreo], [strUsuario], [strContrasena], [bitEstado], [bitActivo], [bitEliminado], [intIdUsuarioRegistro], [dtmFechaRegistro], [intIdUsuarioModificacion], [dtmFechaModificacion], [intIdUsuarioEliminacion], [dtmFechaEliminacion]) VALUES (10, 3, N'COD3235', N'Lucia', N'Garcia', N'78901234', N'Jr. Médico 456', N'789012345', N'lucia.garcia@example.com', N'', N'', 1, 1, 0, 2, CAST(N'2024-07-07T16:12:48.683' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[tblPersonal] ([intIdPersonal], [intIdGrupoPersonal], [strCodPersonal], [strNombres], [strApellidos], [strDNI], [strDireccion], [strTelefono], [strCorreo], [strUsuario], [strContrasena], [bitEstado], [bitActivo], [bitEliminado], [intIdUsuarioRegistro], [dtmFechaRegistro], [intIdUsuarioModificacion], [dtmFechaModificacion], [intIdUsuarioEliminacion], [dtmFechaEliminacion]) VALUES (11, 3, N'COD3236', N'Diego', N'Sanchez', N'89012345', N'Calle Emergencia 789', N'890123456', N'diego.sanchez@example.com', N'', N'', 1, 1, 0, 2, CAST(N'2024-07-07T16:12:48.683' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[tblPersonal] ([intIdPersonal], [intIdGrupoPersonal], [strCodPersonal], [strNombres], [strApellidos], [strDNI], [strDireccion], [strTelefono], [strCorreo], [strUsuario], [strContrasena], [bitEstado], [bitActivo], [bitEliminado], [intIdUsuarioRegistro], [dtmFechaRegistro], [intIdUsuarioModificacion], [dtmFechaModificacion], [intIdUsuarioEliminacion], [dtmFechaEliminacion]) VALUES (12, 3, N'COD3237', N'Elena', N'Morales', N'90123456', N'Av. Primeros Auxilios 321', N'901234567', N'elena.morales@example.com', N'', N'', 1, 1, 0, 2, CAST(N'2024-07-07T16:12:48.683' AS DateTime), NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblPersonal] OFF
GO
SET IDENTITY_INSERT [dbo].[tblRol] ON 

INSERT [dbo].[tblRol] ([intIdRol], [strNombreRol]) VALUES (2, N'Ciudadano')
INSERT [dbo].[tblRol] ([intIdRol], [strNombreRol]) VALUES (1, N'Personal')
SET IDENTITY_INSERT [dbo].[tblRol] OFF
GO
SET IDENTITY_INSERT [dbo].[tblUsuario] ON 

INSERT [dbo].[tblUsuario] ([intIdUsuario], [strUsuario], [strContrasena], [intIdRol], [intIdPersonal], [intIdCiudadano], [bitEstado], [bitActivo], [bitEliminado], [dtmFechaRegistro], [dtmFechaModificacion], [dtmFechaEliminacion]) VALUES (2, N'12345678', N'240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9', 1, 1, NULL, 1, 1, 0, CAST(N'2024-07-02T20:53:32.950' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblUsuario] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tblAlert__6A15B40BD7665C88]    Script Date: 7/07/2024 20:53:13 ******/
ALTER TABLE [dbo].[tblAlerta] ADD UNIQUE NONCLUSTERED 
(
	[strCodAlerta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tblCiuda__648D6E3204E16F5F]    Script Date: 7/07/2024 20:53:13 ******/
ALTER TABLE [dbo].[tblCiudadano] ADD UNIQUE NONCLUSTERED 
(
	[strCodCiudadano] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tblGrupo__FCD77870D26A9076]    Script Date: 7/07/2024 20:53:13 ******/
ALTER TABLE [dbo].[tblGrupoPersonal] ADD UNIQUE NONCLUSTERED 
(
	[strCodGrupoPersonal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tblPerso__09FF3BD19631CEC9]    Script Date: 7/07/2024 20:53:13 ******/
ALTER TABLE [dbo].[tblPersonal] ADD UNIQUE NONCLUSTERED 
(
	[strCodPersonal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tblRol__B4620D99BA073DB3]    Script Date: 7/07/2024 20:53:13 ******/
ALTER TABLE [dbo].[tblRol] ADD UNIQUE NONCLUSTERED 
(
	[strNombreRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tblUsuar__784B73C8D6FB9A97]    Script Date: 7/07/2024 20:53:13 ******/
ALTER TABLE [dbo].[tblUsuario] ADD UNIQUE NONCLUSTERED 
(
	[strUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAlerta]  WITH CHECK ADD FOREIGN KEY([intIdGrupoPersonal])
REFERENCES [dbo].[tblGrupoPersonal] ([intIdGrupoPersonal])
GO
ALTER TABLE [dbo].[tblPersonal]  WITH CHECK ADD FOREIGN KEY([intIdGrupoPersonal])
REFERENCES [dbo].[tblGrupoPersonal] ([intIdGrupoPersonal])
GO
ALTER TABLE [dbo].[tblUsuario]  WITH CHECK ADD FOREIGN KEY([intIdRol])
REFERENCES [dbo].[tblRol] ([intIdRol])
GO
ALTER TABLE [dbo].[tblUsuario]  WITH CHECK ADD FOREIGN KEY([intIdPersonal])
REFERENCES [dbo].[tblPersonal] ([intIdPersonal])
GO
ALTER TABLE [dbo].[tblUsuario]  WITH CHECK ADD FOREIGN KEY([intIdCiudadano])
REFERENCES [dbo].[tblCiudadano] ([intIdCiudadano])
GO
/****** Object:  StoredProcedure [dbo].[SP_SAB_ActualizarAlerta]    Script Date: 7/07/2024 20:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------------------------------------------------------------------
-- PROCEDIMIENTO: SP_SAB_ActualizarAlerta
-- DESCRIPCIÓN: Este procedimiento actualiza el grupo personal y el estado
--              de una alerta en la tabla tblAlerta.
-- ENTRADAS:
--     @pintIdGrupoPersonal: ID del grupo personal a asignar.
--                           Tipo de dato: INT.
--     @pstrCodAlerta: Código de alerta a actualizar.
--                     Tipo de dato: VARCHAR(20).
-- SALIDAS:
--     @codigo: Código de estado HTTP (200 = OK, 400 = Error de validación, 500 = Error del servidor).
--              Tipo de dato: INT.
--     @descripcion: Descripción del resultado de la operación.
--                   Tipo de dato: VARCHAR(255).
-- USO:
--     EXEC SP_SAB_ActualizarAlerta @pintIdGrupoPersonal = 1, @pstrCodAlerta = 'CODIGOALERTA00001';
-- DESARROLLO: WILLIAMS TORO SUSANIBAR
-- FECHA: 6 DE JULIO DEL 2024
-----------------------------------------------------------------------------  
CREATE PROCEDURE [dbo].[SP_SAB_ActualizarAlerta]
    @pintIdGrupoPersonal INT,
    @pstrCodAlerta VARCHAR(20)
AS
BEGIN
    DECLARE @codigo INT;
    DECLARE @descripcion VARCHAR(255);

    -- Iniciar la transacción
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Verificar que el grupo no esté asignado a otra alerta activa
        IF NOT EXISTS (
            SELECT 1 
            FROM tblAlerta 
            WHERE intIdGrupoPersonal = @pintIdGrupoPersonal 
              AND bitEstado = 1 
              AND strCodAlerta != @pstrCodAlerta
        )
        BEGIN
            -- Actualizar el grupo personal y el estado de la alerta
            UPDATE tblAlerta
            SET intIdGrupoPersonal = @pintIdGrupoPersonal,
                bitEstado = 0
            WHERE strCodAlerta = @pstrCodAlerta;

            -- Confirmar la transacción
            COMMIT TRANSACTION;

            -- Establecer código y descripción de éxito
            SET @codigo = 200;
            SET @descripcion = 'La alerta ha sido actualizada exitosamente.';
        END
        ELSE
        BEGIN
            -- Revertir la transacción
            ROLLBACK TRANSACTION;

            -- Establecer código y descripción de error de validación
            SET @codigo = 400;
            SET @descripcion = 'El grupo personal ya está asignado a otra alerta activa.';
        END
    END TRY
    BEGIN CATCH
        -- Revertir la transacción en caso de error
        ROLLBACK TRANSACTION;

        -- Establecer código y descripción de error del servidor
        SET @codigo = 500;
        SET @descripcion = ERROR_MESSAGE();
    END CATCH

    -- Retornar el código y la descripción
    SELECT @codigo AS codigo, @descripcion AS descripcion;
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_SAB_DescartarAlerta]    Script Date: 7/07/2024 20:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------------------------------------------------------------------
-- PROCEDIMIENTO: SP_SAB_DescartarAlerta
-- DESCRIPCIÓN: Este procedimiento descarta una alerta en la tabla tblAlerta.
-- ENTRADAS:
--     @pstrCodAlerta: Código de alerta a descartar.
--                     Tipo de dato: VARCHAR(20).
-- SALIDAS:
--     @codigo: Código de estado HTTP (200 = OK, 500 = Error del servidor).
--              Tipo de dato: INT.
--     @descripcion: Descripción del resultado de la operación.
--                   Tipo de dato: VARCHAR(255).
-- USO:
--     EXEC SP_SAB_DescartarAlerta @pstrCodAlerta = 'CODIGOALERTA00001';
-- DESARROLLO: WILLIAMS TORO SUSANIBAR
-- FECHA: 6 DE JULIO DEL 2024
-----------------------------------------------------------------------------  
CREATE PROCEDURE [dbo].[SP_SAB_DescartarAlerta]
    @pstrCodAlerta VARCHAR(20)
AS
BEGIN
    DECLARE @codigo INT;
    DECLARE @descripcion VARCHAR(255);

    -- Iniciar la transacción
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Actualizar la alerta para marcarla como descartada
        UPDATE tblAlerta
        SET bitActivo = 0,
            bitEliminado = 1
        WHERE strCodAlerta = @pstrCodAlerta;

        -- Confirmar la transacción
        COMMIT TRANSACTION;

        -- Establecer código y descripción de éxito
        SET @codigo = 200;
        SET @descripcion = 'La alerta ha sido descartada exitosamente.';
    END TRY
    BEGIN CATCH
        -- Revertir la transacción en caso de error
        ROLLBACK TRANSACTION;

        -- Establecer código y descripción de error del servidor
        SET @codigo = 500;
        SET @descripcion = ERROR_MESSAGE();
    END CATCH

    -- Retornar el código y la descripción
    SELECT @codigo AS codigo, @descripcion AS descripcion;
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_SAB_DetalleAlerta]    Script Date: 7/07/2024 20:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SAB_DetalleAlerta]
    @pstrCodAlerta VARCHAR(20)
AS
BEGIN
    -- Retorno de la alerta si se encuentra el código
    SELECT 
        strCodAlerta,
        strDepartamento,
        strProvincia,
        strDistrito,
        strDireccion,
        strDescripcion,
        strLatitud,
        strLongitud,
        intIdGrupoPersonal,
        bitEstado
    FROM tblAlerta
    WHERE strCodAlerta = @pstrCodAlerta;
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_SAB_DTS_RegistrarAlerta]    Script Date: 7/07/2024 20:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SAB_DTS_RegistrarAlerta]
    @pstrDepartamento VARCHAR(20),
    @pstrProvincia VARCHAR(20),
    @pstrDistrito VARCHAR(20),
    @pstrDireccion VARCHAR(50),
    @pstrLatitud VARCHAR(200) = NULL,
    @pstrLongitud VARCHAR(200) = NULL,
    @pstrDescripcion VARCHAR(200),
    @pbitEstado BIT,
    @pintIdUsuarioRegistro INTEGER
AS
BEGIN
    DECLARE @codigo INT = 400;
    DECLARE @descripcion VARCHAR(400) = '';
    DECLARE @flgError BIT = 0;
    DECLARE @ultimoId INT;
    DECLARE @nuevoCodigo VARCHAR(20) = NULL;

    -- Validación de parámetros obligatorios
    IF @pstrDepartamento IS NULL OR LTRIM(RTRIM(@pstrDepartamento)) = ''
    BEGIN
        SET @codigo = 400;
        SET @descripcion = 'El departamento es obligatorio.';
        SET @flgError = 1;
    END

    IF @flgError = 0 AND (@pstrProvincia IS NULL OR LTRIM(RTRIM(@pstrProvincia)) = '')
    BEGIN
        SET @codigo = 400;
        SET @descripcion = 'La provincia es obligatoria.';
        SET @flgError = 1;
    END

    IF @flgError = 0 AND (@pstrDistrito IS NULL OR LTRIM(RTRIM(@pstrDistrito)) = '')
    BEGIN
        SET @codigo = 400;
        SET @descripcion = 'El distrito es obligatorio.';
        SET @flgError = 1;
    END

    IF @flgError = 0 AND (@pstrDireccion IS NULL OR LTRIM(RTRIM(@pstrDireccion)) = '')
    BEGIN
        SET @codigo = 400;
        SET @descripcion = 'La dirección es obligatoria.';
        SET @flgError = 1;
    END

    IF @flgError = 0 AND (@pstrDescripcion IS NULL OR LTRIM(RTRIM(@pstrDescripcion)) = '')
    BEGIN
        SET @codigo = 400;
        SET @descripcion = 'La descripción es obligatoria.';
        SET @flgError = 1;
    END

    IF @flgError = 0 AND (@pintIdUsuarioRegistro IS NULL OR LTRIM(RTRIM(CAST(@pintIdUsuarioRegistro AS VARCHAR))) = '')
    BEGIN
        SET @codigo = 400;
        SET @descripcion = 'El ID del usuario de registro es obligatorio.';
        SET @flgError = 1;
    END

    -- Registro de la alerta
    IF @flgError = 0
    BEGIN
        BEGIN TRANSACTION
        BEGIN TRY
            -- Obtención del último ID de alerta
            SELECT @ultimoId = ISNULL(MAX(intIdAlerta), 0) FROM tblAlerta;

            -- Generación del nuevo código de alerta
            DECLARE @numeroAlerta VARCHAR(20);
            SET @numeroAlerta = CAST(@ultimoId + 1 AS VARCHAR);

            -- Calcular cuántos ceros se necesitan
            DECLARE @ceros VARCHAR(20);
            SET @ceros = REPLICATE('0', 20 - LEN('CODIGOALERTA') - LEN(@numeroAlerta));

            -- Formar el nuevo código de alerta
            SET @nuevoCodigo = 'CODIGOALERTA' + @ceros + @numeroAlerta;

            INSERT INTO tblAlerta (
                strCodAlerta,
                strDepartamento,
                strProvincia,
                strDistrito,
                strDireccion,
                strLatitud,
                strLongitud,
                strDescripcion,
                bitEstado,
                bitActivo,
                bitEliminado,
                intIdUsuarioRegistro,
                dtmFechaRegistro)
            VALUES (
                @nuevoCodigo,
                @pstrDepartamento,
                @pstrProvincia,
                @pstrDistrito,
                @pstrDireccion,
                @pstrLatitud,
                @pstrLongitud,
                @pstrDescripcion,
                @pbitEstado,
                1,  -- bitActivo
                0,  -- bitEliminado
                @pintIdUsuarioRegistro,
                GETDATE()  -- dtmFechaRegistro
            );

            COMMIT;
            SET @codigo = 200;
            SET @descripcion = 'Alerta registrada exitosamente, guarde su código de alerta "' + @nuevoCodigo + '".';
        END TRY
        BEGIN CATCH
            ROLLBACK;
            IF ERROR_NUMBER() = 2627  -- Violación de restricción de unicidad
            BEGIN
                SET @codigo = 409;
                SET @descripcion = 'El código de alerta ya existe.';
            END
            ELSE
            BEGIN
                SET @codigo = 500;
                SET @descripcion = 'Error transaccional, no se pudo registrar la alerta. ' + ERROR_MESSAGE() + ' LINEA: ' + CONVERT(VARCHAR(5), ERROR_LINE());
            END
        END CATCH
    END

    -- Retorno de resultado
    SELECT @codigo AS codigo, @descripcion AS descripcion, @nuevoCodigo AS codigoAlerta;
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_SAB_ListarAlerta]    Script Date: 7/07/2024 20:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SAB_ListarAlerta]
AS
BEGIN
    SET NOCOUNT ON;

    -- Selección de columnas específicas de la tabla tblAlerta
    SELECT
        strCodAlerta,
        strDepartamento,
        strProvincia,
        strDistrito,
        strDireccion,
        strDescripcion,
        strLatitud,
        strLongitud,
        intIdGrupoPersonal,
        bitEstado
    FROM
        tblAlerta
    WHERE
        bitEliminado = 0  -- Considerando que bitEliminado = 0 significa que la alerta no está eliminada
    ORDER BY
        strCodAlerta DESC;  -- Ordenar de forma descendente por el campo strCodAlerta
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_SAB_ListarAlertasFull]    Script Date: 7/07/2024 20:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------------------------------------------------------------------
-- PROCEDIMIENTO: SP_SAB_ListarAlertasFull
-- DESCRIPCIÓN: Este procedimiento lista todos los estados y estados de eliminación
--              lógica de las alertas en la tabla tblAlerta.
-- RETORNA:
--     bitEstado: Estado de la alerta (1 = Activa, 0 = Inactiva).
--     bitEliminado: Estado de eliminación lógica de la alerta (1 = Eliminada, 0 = No eliminada).
-- USO:
--     EXEC SP_SAB_ListarAlertasFull;
-- DESARROLLO: WILLIAMS TORO SUSANIBAR
-- FECHA: 7 DE JULIO DEL 2024
-----------------------------------------------------------------------------  
CREATE PROCEDURE [dbo].[SP_SAB_ListarAlertasFull]
AS
BEGIN
    -- Selección de los campos bitEstado y bitEliminado de tblAlerta
    SELECT 
        bitEstado,
        bitEliminado
    FROM tblAlerta;
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_SAB_ListarGruposPersonales]    Script Date: 7/07/2024 20:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------------------------------------------------------------------
-- PROCEDIMIENTO: SP_SAB_ListarGruposPersonales
-- DESCRIPCIÓN: Este procedimiento lista los códigos, nombres y descripciones
--              de todos los grupos personales en la tabla tblGrupoPersonal.
-- RETORNA:
--     strCodGrupoPersonal: Código del grupo personal.
--     strNombreGrupoPersonal: Nombre del grupo personal.
--     strDescripcionGrupoPersonal: Descripción del grupo personal.
-- USO:
--     EXEC SP_SAB_ListarGruposPersonales;
-- DESARROLLO: WILLIAMS TORO SUSANIBAR
-- FECHA: 7 DE JULIO DEL 2024
-----------------------------------------------------------------------------  
CREATE PROCEDURE [dbo].[SP_SAB_ListarGruposPersonales]
AS
BEGIN
    -- Selección de los campos strCodGrupoPersonal, strNombreGrupoPersonal y strDescripcionGrupoPersonal de tblGrupoPersonal
    SELECT 
        strCodGrupoPersonal,
        strNombreGrupoPersonal,
        strDescripcionGrupoPersonal
    FROM tblGrupoPersonal;
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_SAB_ListarPersonalPorGrupo]    Script Date: 7/07/2024 20:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------------------------------------------------------------------
-- PROCEDIMIENTO: SP_SAB_ListarPersonalPorGrupo
-- DESCRIPCIÓN: Este procedimiento lista el personal basado en un código de grupo
--              personal especificado.
-- ENTRADAS:
--     @pstrCodGrupoPersonal: Código del grupo personal a buscar.
--                            Tipo de dato: VARCHAR(20).
-- RETORNA:
--     strCodPersonal: Código del personal.
--     strNombreCompleto: Nombre completo del personal (concatenación de strNombres y strApellidos).
--     strDNI: DNI del personal.
--     strDireccion: Dirección del personal.
--     strTelefono: Teléfono del personal.
--     strCorreo: Correo electrónico del personal.
-- USO:
--     EXEC SP_SAB_ListarPersonalPorGrupo @pstrCodGrupoPersonal = 'CODIGOGRUPO001';
-- DESARROLLO: WILLIAMS TORO SUSANIBAR
-- FECHA: 7 DE JULIO DEL 2024
-----------------------------------------------------------------------------  
CREATE PROCEDURE [dbo].[SP_SAB_ListarPersonalPorGrupo]
    @pstrCodGrupoPersonal VARCHAR(20)
AS
BEGIN
    -- Obtener el intIdGrupoPersonal basado en @pstrCodGrupoPersonal
    DECLARE @intIdGrupoPersonal INT;
    SELECT @intIdGrupoPersonal = intIdGrupoPersonal 
    FROM tblGrupoPersonal 
    WHERE strCodGrupoPersonal = @pstrCodGrupoPersonal;

    -- Selección de los campos de tblPersonal basado en @intIdGrupoPersonal
    SELECT 
        strCodPersonal,
        CONCAT(strNombres, ' ', strApellidos) AS strNombreCompleto,
        strDNI,
        strDireccion,
        strTelefono,
        strCorreo
    FROM tblPersonal 
    WHERE intIdGrupoPersonal = @intIdGrupoPersonal;
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_SAB_ObtenerAlertaPorPersonal]    Script Date: 7/07/2024 20:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SAB_ObtenerAlertaPorPersonal]
    @pintIdPersonal INTEGER
AS
BEGIN
    -- Obtener la alerta activa y no eliminada asociada al grupo personal del personal especificado
    SELECT 
        a.strCodAlerta,
        a.strDepartamento,
        a.strProvincia,
        a.strDistrito,
        a.strDireccion,
        a.strLatitud,
        a.strLongitud,
        a.strDescripcion,
        gp.strNombreGrupoPersonal
    FROM tblAlerta a
    INNER JOIN tblGrupoPersonal gp ON a.intIdGrupoPersonal = gp.intIdGrupoPersonal
    INNER JOIN tblPersonal p ON gp.intIdGrupoPersonal = p.intIdGrupoPersonal
    WHERE p.intIdPersonal = @pintIdPersonal
      AND a.bitActivo = 1
      AND a.bitEliminado = 0;
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_SAB_ObtenerGruposPersonalesActivos]    Script Date: 7/07/2024 20:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------------------------------------------------------------------
-- PROCEDIMIENTO: SP_SAB_ObtenerGruposPersonalesActivos
-- DESCRIPCIÓN: Este procedimiento obtiene los grupos personales activos
--              de la tabla tblGrupoPersonal que no están asignados a una alerta
--              en la tabla tblAlerta con bitActivo = 1 y bitEliminado = 0.
-- RETORNA:
--     intIdGrupoPersonal: ID del grupo personal.
--     strNombreGrupoPersonal: Nombre del grupo personal.
-- NOTAS:
--     - Solo se retornan los grupos personales que están activos, no eliminados
--       y no asignados a una alerta activa y no eliminada.
-- USO:
--     EXEC SP_SAB_ObtenerGruposPersonalesActivos;
-- DESARROLLO: WILLIAMS TORO SUSANIBAR
-- FECHA: 6 DE JULIO DEL 2024
-----------------------------------------------------------------------------  
CREATE PROCEDURE [dbo].[SP_SAB_ObtenerGruposPersonalesActivos]
AS
BEGIN
    -- Selección de grupos personales activos, no eliminados y no asignados a alertas activas y no eliminadas
    SELECT 
        gp.intIdGrupoPersonal,
        gp.strNombreGrupoPersonal
    FROM tblGrupoPersonal gp
    LEFT JOIN tblAlerta a ON gp.intIdGrupoPersonal = a.intIdGrupoPersonal
        AND a.bitActivo = 1
        AND a.bitEliminado = 0
    WHERE gp.bitEstado = 1 
      AND gp.bitActivo = 1 
      AND gp.bitEliminado = 0
      AND a.intIdGrupoPersonal IS NULL;
END;
GO
USE [master]
GO
ALTER DATABASE [SABDB] SET  READ_WRITE 
GO
