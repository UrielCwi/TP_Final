USE [master]
GO
/****** Object:  Database [Grev]    Script Date: 19/8/2024 11:26:05 ******/
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
/****** Object:  User [alumno]    Script Date: 19/8/2024 11:26:05 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 19/8/2024 11:26:05 ******/
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
/****** Object:  Table [dbo].[DetalleVenta]    Script Date: 19/8/2024 11:26:05 ******/
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
/****** Object:  Table [dbo].[Empresa]    Script Date: 19/8/2024 11:26:05 ******/
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
/****** Object:  Table [dbo].[Ingrediente]    Script Date: 19/8/2024 11:26:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingrediente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
	[cantidad] [varchar](50) NOT NULL,
	[valorUnidad] [int] NOT NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_Ingrediente] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IngredientePlato]    Script Date: 19/8/2024 11:26:05 ******/
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
/****** Object:  Table [dbo].[Plato]    Script Date: 19/8/2024 11:26:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plato](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[idCategoria] [int] NOT NULL,
	[precio] [int] NOT NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_Plato] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PreguntasFrecuentes]    Script Date: 19/8/2024 11:26:05 ******/
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 19/8/2024 11:26:05 ******/
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
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 19/8/2024 11:26:05 ******/
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
SET IDENTITY_INSERT [dbo].[Categorias] ON 

INSERT [dbo].[Categorias] ([id], [nombre]) VALUES (1, N'sandwiches')
SET IDENTITY_INSERT [dbo].[Categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[Ingrediente] ON 

INSERT [dbo].[Ingrediente] ([id], [descripcion], [cantidad], [valorUnidad], [activo]) VALUES (1, N'tomate', N'50', 300, 1)
INSERT [dbo].[Ingrediente] ([id], [descripcion], [cantidad], [valorUnidad], [activo]) VALUES (2, N'lechuga', N'50', 300, 1)
INSERT [dbo].[Ingrediente] ([id], [descripcion], [cantidad], [valorUnidad], [activo]) VALUES (3, N'pan', N'1000', 100, 1)
INSERT [dbo].[Ingrediente] ([id], [descripcion], [cantidad], [valorUnidad], [activo]) VALUES (4, N'carne', N'300', 300, 1)
INSERT [dbo].[Ingrediente] ([id], [descripcion], [cantidad], [valorUnidad], [activo]) VALUES (5, N'queso', N'300', 300, 1)
INSERT [dbo].[Ingrediente] ([id], [descripcion], [cantidad], [valorUnidad], [activo]) VALUES (6, N'jamon', N'6', 5000, 1)
INSERT [dbo].[Ingrediente] ([id], [descripcion], [cantidad], [valorUnidad], [activo]) VALUES (7, N'pepe', N'34', 900, 1)
INSERT [dbo].[Ingrediente] ([id], [descripcion], [cantidad], [valorUnidad], [activo]) VALUES (8, N'Lorem ipsum es el texto que se usa habitualmente e', N'10', 34343, 1)
SET IDENTITY_INSERT [dbo].[Ingrediente] OFF
GO
SET IDENTITY_INSERT [dbo].[IngredientePlato] ON 

INSERT [dbo].[IngredientePlato] ([id], [idPlato], [idIngrediente], [cantXPlato]) VALUES (1, 1, 3, N'1')
INSERT [dbo].[IngredientePlato] ([id], [idPlato], [idIngrediente], [cantXPlato]) VALUES (2, 1, 4, N'1')
INSERT [dbo].[IngredientePlato] ([id], [idPlato], [idIngrediente], [cantXPlato]) VALUES (3, 1, 5, N'1')
INSERT [dbo].[IngredientePlato] ([id], [idPlato], [idIngrediente], [cantXPlato]) VALUES (4, 2, 1, N'1')
INSERT [dbo].[IngredientePlato] ([id], [idPlato], [idIngrediente], [cantXPlato]) VALUES (5, 2, 2, N'1')
INSERT [dbo].[IngredientePlato] ([id], [idPlato], [idIngrediente], [cantXPlato]) VALUES (6, 2, 3, N'1')
INSERT [dbo].[IngredientePlato] ([id], [idPlato], [idIngrediente], [cantXPlato]) VALUES (7, 2, 4, N'1')
SET IDENTITY_INSERT [dbo].[IngredientePlato] OFF
GO
SET IDENTITY_INSERT [dbo].[Plato] ON 

INSERT [dbo].[Plato] ([id], [nombre], [idCategoria], [precio], [activo]) VALUES (1, N'Hamburguesa con queso', 1, 3333, 1)
INSERT [dbo].[Plato] ([id], [nombre], [idCategoria], [precio], [activo]) VALUES (2, N'hamburguesa con lechuga y tomate', 1, 15000, 1)
INSERT [dbo].[Plato] ([id], [nombre], [idCategoria], [precio], [activo]) VALUES (3, N'Hamburguesa con queso', 1, 44444, 1)
INSERT [dbo].[Plato] ([id], [nombre], [idCategoria], [precio], [activo]) VALUES (4, N'Hamburguesa con qu', 1, 44444, 1)
INSERT [dbo].[Plato] ([id], [nombre], [idCategoria], [precio], [activo]) VALUES (5, N'hmaburgues quesptwre', 1, 34234, 1)
INSERT [dbo].[Plato] ([id], [nombre], [idCategoria], [precio], [activo]) VALUES (6, N'Plato nuevo creado por Dario', 1, 1503, NULL)
SET IDENTITY_INSERT [dbo].[Plato] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([id], [nombre], [apellido], [email], [contraseña], [empresa]) VALUES (1, N'Lucas', N'Ruiz Barrea', N'LucasRu@gmail.com', N'1234', N'Gerda Cafe')
INSERT [dbo].[Usuario] ([id], [nombre], [apellido], [email], [contraseña], [empresa]) VALUES (2, N'Eitan', N'Toporovskaja', N'1@gil.com', N'123456', N'bygctfctf')
INSERT [dbo].[Usuario] ([id], [nombre], [apellido], [email], [contraseña], [empresa]) VALUES (3, N'Dario', N'Snieg', N'dsnieg@ort.edu.ar', N'12345', N'Hola')
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
/****** Object:  StoredProcedure [dbo].[ActualizarIngrediente]    Script Date: 19/8/2024 11:26:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarIngrediente]
    @id INT,
    @descripcion VARCHAR(50),
    @cantidad VARCHAR(50),
	@valorUnidad INT,
	@activo BIT
AS
BEGIN
    UPDATE Ingrediente
    SET descripcion = @descripcion, cantidad = @cantidad, valorUnidad = @valorUnidad, @activo = activo
    WHERE id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarPlato]    Script Date: 19/8/2024 11:26:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarPlato]
    @id INT,
    @nombre VARCHAR(50),
    @idCategoria INT,
	@precio INT,
	@activo BIT
AS
BEGIN
    UPDATE Plato
    SET nombre = @nombre, idCategoria = @idCategoria, precio = @precio, activo = @activo
    WHERE id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[BuscarPlato]    Script Date: 19/8/2024 11:26:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BuscarPlato]
    @nombre VARCHAR(50)
AS
BEGIN
    SELECT * FROM Plato
    WHERE nombre LIKE '%' + @nombre + '%';
END
GO
/****** Object:  StoredProcedure [dbo].[EliminarIngrediente]    Script Date: 19/8/2024 11:26:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarIngrediente]
    @id INT
AS
BEGIN
    DELETE FROM Ingrediente
    WHERE id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[EliminarPlato]    Script Date: 19/8/2024 11:26:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarPlato]
    @id INT
AS
BEGIN
    DELETE FROM Plato
    WHERE id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[GetUsuario]    Script Date: 19/8/2024 11:26:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUsuario]
    @IdUsuario INT
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT id, Nombre, Apellido, Email, Empresa
    FROM Usuario
    WHERE id = @IdUsuario;
END
GO
/****** Object:  StoredProcedure [dbo].[InsertarIngrediente]    Script Date: 19/8/2024 11:26:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarIngrediente]
    @descripcion VARCHAR(50),
    @cantidad VARCHAR(50),
	@valorUnidad INT,
	@activo BIT
AS
BEGIN
    INSERT INTO Ingrediente (descripcion, cantidad, valorUnidad, activo)
    VALUES (@descripcion, @cantidad, @valorUnidad, @activo);
END
GO
/****** Object:  StoredProcedure [dbo].[InsertarPlato]    Script Date: 19/8/2024 11:26:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarPlato]
    @nombre VARCHAR(50),
    @idCategoria INT,
	@precio INT,
	@activo BIT
AS
BEGIN
    INSERT INTO Plato (nombre, idCategoria, precio, activo)
    VALUES (@nombre, @idCategoria, @precio, @activo);
END
GO
/****** Object:  StoredProcedure [dbo].[LoginUsuario]    Script Date: 19/8/2024 11:26:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LoginUsuario]
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
/****** Object:  StoredProcedure [dbo].[ObtenerCategorias]    Script Date: 19/8/2024 11:26:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerCategorias]
AS
BEGIN
	SELECT *
	FROM Categorias;
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerCategoriasPorId]    Script Date: 19/8/2024 11:26:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerCategoriasPorId]
	@Id INT
AS
BEGIN
	SELECT *
	FROM Categorias
	WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerIngredientes]    Script Date: 19/8/2024 11:26:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerIngredientes]
AS
BEGIN
	SELECT *
	FROM Ingrediente;
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerIngredientesPorId]    Script Date: 19/8/2024 11:26:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerIngredientesPorId]
	@Id INT
AS
BEGIN
	SELECT *
	FROM Ingrediente
	WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerIngredientesPorPlato]    Script Date: 19/8/2024 11:26:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerIngredientesPorPlato]
	@IdPlato INT
AS
BEGIN
	SELECT *
	FROM IngredientePlato
	WHERE IdPlato = @IdPlato;
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerPlatos]    Script Date: 19/8/2024 11:26:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ObtenerPlatos]
AS
BEGIN
	SELECT *
	FROM Plato;
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerPlatosPorCategoria]    Script Date: 19/8/2024 11:26:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerPlatosPorCategoria]
	@IdCategoria INT
AS
BEGIN
	SELECT *
	FROM Plato
	WHERE IdCategoria = @IdCategoria;
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerPlatosPorId]    Script Date: 19/8/2024 11:26:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerPlatosPorId]
	@Id INT
AS
BEGIN
	SELECT *
	FROM Plato
	WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerPlatosPorNombre]    Script Date: 19/8/2024 11:26:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerPlatosPorNombre]
	@Nombre NVARCHAR(50)
AS
BEGIN
	SELECT *
	FROM Plato
	WHERE Nombre = @Nombre;
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerVentas]    Script Date: 19/8/2024 11:26:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerVentas]
AS
BEGIN
	SELECT *
	FROM Ventas;
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerVentasPorFecha]    Script Date: 19/8/2024 11:26:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerVentasPorFecha]
	@Fecha DATE
AS
BEGIN
	SELECT *
	FROM Ventas
	WHERE Fecha = @Fecha;
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerVentasPorFechaEImporte]    Script Date: 19/8/2024 11:26:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerVentasPorFechaEImporte]
	@Fecha DATE,
	@Importe INT
AS
BEGIN
	SELECT *
	FROM Ventas
	WHERE Fecha = @Fecha AND Importe = @Importe;
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerVentasPorId]    Script Date: 19/8/2024 11:26:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerVentasPorId]
	@Id INT
AS
BEGIN
	SELECT *
	FROM Ventas
	WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerVentasPorImporte]    Script Date: 19/8/2024 11:26:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerVentasPorImporte]
	@Importe INT
AS
BEGIN
	SELECT *
	FROM Ventas
	WHERE Importe = @Importe;
END
GO
/****** Object:  StoredProcedure [dbo].[RegistrarUsuario]    Script Date: 19/8/2024 11:26:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[RegistrarUsuario]
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
GO
USE [master]
GO
ALTER DATABASE [Grev] SET  READ_WRITE 
GO
CREATE PROCEDURE DesactivarIngrediente
    @Id INT
AS
BEGIN
    UPDATE Ingredientes
    SET activo = 0
    WHERE id = @Id;
END