USE [master]
GO
/****** Object:  Database [Grev]    Script Date: 10/6/2024 09:51:07 ******/
CREATE DATABASE [Grev]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Grev', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Grev.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Grev_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Grev_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Grev] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Grev].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Grev] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Grev] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Grev] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Grev] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Grev] SET ARITHABORT OFF 
GO
ALTER DATABASE [Grev] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Grev] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Grev] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Grev] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Grev] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Grev] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Grev] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Grev] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Grev] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Grev] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Grev] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Grev] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Grev] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Grev] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Grev] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Grev] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Grev] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Grev] SET RECOVERY FULL 
GO
ALTER DATABASE [Grev] SET  MULTI_USER 
GO
ALTER DATABASE [Grev] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Grev] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Grev] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Grev] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Grev] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Grev', N'ON'
GO
ALTER DATABASE [Grev] SET QUERY_STORE = OFF
GO
USE [Grev]
GO
/****** Object:  User [alumno]    Script Date: 10/6/2024 09:51:07 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 10/6/2024 09:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleVenta]    Script Date: 10/6/2024 09:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleVenta](
	[idVenta] [int] NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[producto] [bit] NOT NULL,
	[cantidad] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DetalleVenta] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empresa]    Script Date: 10/6/2024 09:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empresa](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[razonSocial] [varchar](50) NOT NULL,
	[CUIT] [int] NOT NULL,
	[ubicacion] [geography] NOT NULL,
	[pais] [varchar](50) NOT NULL,
	[telefono] [int] NOT NULL,
	[ ] [bit] NOT NULL,
 CONSTRAINT [PK_Empresa] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ingrediente]    Script Date: 10/6/2024 09:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingrediente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
	[cantidad] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Ingrediente] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IngredientePlato]    Script Date: 10/6/2024 09:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IngredientePlato](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idPlato] [int] NOT NULL,
	[idIngrediente] [int] NOT NULL,
	[cantXPlato] [varchar](50) NOT NULL,
 CONSTRAINT [PK_IngredientePlato] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Plato]    Script Date: 10/6/2024 09:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plato](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[idCategoria] [int] NOT NULL,
 CONSTRAINT [PK_Plato] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PreguntasFrecuentes]    Script Date: 10/6/2024 09:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PreguntasFrecuentes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[pregunta] [varchar](50) NOT NULL,
	[respuesta] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PreguntasFrecuentes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 10/6/2024 09:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[contraseña] [varchar](50) NOT NULL,
	[empresa] [varchar](50) NOT NULL,
	[ ] [bit] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 10/6/2024 09:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NOT NULL,
	[importe] [int] NOT NULL,
 CONSTRAINT [PK_Ventas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([id], [nombre], [apellido], [email], [contraseña], [empresa]) VALUES (13, N'Lucas', N'Ruiz Barrea', 5, N'LucasRu@gmail.com', N'1234', N'Gerda Cafe')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD  CONSTRAINT [FK_DetalleVenta_Ventas] FOREIGN KEY([idVenta])
REFERENCES [dbo].[Ventas] ([id])
GO
ALTER TABLE [dbo].[DetalleVenta] CHECK CONSTRAINT [FK_DetalleVenta_Ventas]
GO
ALTER TABLE [dbo].[IngredientePlato]  WITH CHECK ADD  CONSTRAINT [FK_IngredientePlato_Ingrediente] FOREIGN KEY([idIngrediente])
REFERENCES [dbo].[Ingrediente] ([id])
GO
ALTER TABLE [dbo].[IngredientePlato] CHECK CONSTRAINT [FK_IngredientePlato_Ingrediente]
GO
ALTER TABLE [dbo].[IngredientePlato]  WITH CHECK ADD  CONSTRAINT [FK_IngredientePlato_Plato] FOREIGN KEY([idPlato])
REFERENCES [dbo].[Plato] ([id])
GO
ALTER TABLE [dbo].[IngredientePlato] CHECK CONSTRAINT [FK_IngredientePlato_Plato]
GO
ALTER TABLE [dbo].[Plato]  WITH CHECK ADD  CONSTRAINT [FK_Plato_Categorias] FOREIGN KEY([idCategoria])
REFERENCES [dbo].[Categorias] ([id])
GO
ALTER TABLE [dbo].[Plato] CHECK CONSTRAINT [FK_Plato_Categorias]
GO
ALTER DATABASE [Grev] SET  READ_WRITE 
GO
USE [Grev]
GO
CREATE PROCEDURE LoginUsuario
    @email VARCHAR(50),
    @contraseña VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;
        IF EXISTS (SELECT 1 FROM Usuario WHERE email = @email AND contraseña = @contraseña)
    BEGIN
        SELECT id, nombre, apellido, email, empresa
        FROM Usuario
        WHERE email = @email AND contraseña = @contraseña;
        RETURN 0; 
    END
    ELSE
    BEGIN
        RETURN -1; 
    END
END

GO

CREATE PROCEDURE ObtenerPlatos
AS
BEGIN
	SELECT *
	FROM Plato;
END
GO
CREATE PROCEDURE ObtenerPlatosPorCategoria
	@IdCategoria INT
AS
BEGIN
	SELECT *
	FROM Plato
	WHERE IdCategoria = @IdCategoria;
END
GO
CREATE PROCEDURE ObtenerPlatosPorNombre
	@Nombre NVARCHAR(50)
AS
BEGIN
	SELECT *
	FROM Plato
	WHERE Nombre = @Nombre;
END
GO
CREATE PROCEDURE ObtenerPlatosPorId
	@Id INT
AS
BEGIN
	SELECT *
	FROM Plato
	WHERE Id = @Id;
END
GO
CREATE PROCEDURE ObtenerIngredientesPorPlato
	@IdPlato INT
AS
BEGIN
	SELECT *
	FROM IngredientePlato
	WHERE IdPlato = @IdPlato;
END
GO
CREATE PROCEDURE ObtenerIngredientes
AS
BEGIN
	SELECT *
	FROM Ingrediente;
END
GO
CREATE PROCEDURE ObtenerIngredientesPorId
	@Id INT
AS
BEGIN
	SELECT *
	FROM Ingrediente
	WHERE Id = @Id;
END
GO
CREATE PROCEDURE ObtenerCategorias
AS
BEGIN
	SELECT *
	FROM Categorias;
END
GO
CREATE PROCEDURE ObtenerCategoriasPorId
	@Id INT
AS
BEGIN
	SELECT *
	FROM Categorias
	WHERE Id = @Id;
END
GO
CREATE PROCEDURE ObtenerVentas
AS
BEGIN
	SELECT *
	FROM Ventas;
END
GO
CREATE PROCEDURE ObtenerVentasPorId
	@Id INT
AS
BEGIN
	SELECT *
	FROM Ventas
	WHERE Id = @Id;
END
GO
CREATE PROCEDURE ObtenerVentasPorFecha
	@Fecha DATE
AS
BEGIN
	SELECT *
	FROM Ventas
	WHERE Fecha = @Fecha;
END
GO
CREATE PROCEDURE ObtenerVentasPorImporte
	@Importe INT
AS
BEGIN
	SELECT *
	FROM Ventas
	WHERE Importe = @Importe;
END
GO
CREATE PROCEDURE ObtenerVentasPorFechaEImporte
	@Fecha DATE,
	@Importe INT
AS
BEGIN
	SELECT *
	FROM Ventas
	WHERE Fecha = @Fecha AND Importe = @Importe;
END
GO
	CREATE PROCEDURE RegistrarUsuario
    @nombre VARCHAR(50),
    @apellido VARCHAR(50),
    @email VARCHAR(50),
    @contraseña VARCHAR(50),
    @empresa VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (SELECT 1 FROM Usuario WHERE email = @email)
    BEGIN
        RETURN -1;
    END
    INSERT INTO Usuario (nombre, apellido, email, contraseña, empresa)
    VALUES (@nombre, @apellido, @email, @contraseña, @empresa);
    SELECT SCOPE_IDENTITY() AS NuevoUsuarioID;
END
CREATE PROCEDURE GetUsuario
    @IdUsuario INT
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT IdUsuario, Nombre, Apellido, Email, Empresa
    FROM Usuario
    WHERE IdUsuario = @IdUsuario;
END