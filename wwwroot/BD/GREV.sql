USE [master]
GO
/****** Object:  Database [Grev]    Script Date: 4/11/2024 08:19:13 ******/
CREATE DATABASE [Grev]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Grev', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Grev.mdf', SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Grev_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Grev_log.ldf', SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
/****** Object:  User [alumno]    Script Date: 4/11/2024 08:19:13 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 4/11/2024 08:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleVenta]    Script Date: 4/11/2024 08:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleVenta](
	[idVenta] [int] NOT NULL,
	[idUsuario] [int] NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NOT NULL,
	[total] [float] NOT NULL,
 CONSTRAINT [PK_DetalleVenta] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empresa]    Script Date: 4/11/2024 08:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empresa](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](20) NOT NULL,
	[razonSocial] [varchar](50) NOT NULL,
	[CUIT] [int] NOT NULL,
	[ubicacion] [geography] NOT NULL,
	[pais] [varchar](20) NOT NULL,
	[telefono] [int] NOT NULL,
	[ ] [bit] NOT NULL,
 CONSTRAINT [PK_Empresa] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ingrediente]    Script Date: 4/11/2024 08:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingrediente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](35) NOT NULL,
	[cantidad] [float] NOT NULL,
	[valorUnidad] [float] NOT NULL,
	[activo] [bit] NULL,
	[idUnidad] [int] NULL,
 CONSTRAINT [PK_Ingrediente] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IngredientePlato]    Script Date: 4/11/2024 08:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IngredientePlato](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idPlato] [int] NOT NULL,
	[idIngrediente] [int] NOT NULL,
	[cantXPlato] [varchar](10) NOT NULL,
 CONSTRAINT [PK_IngredientePlato] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Plato]    Script Date: 4/11/2024 08:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plato](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](35) NOT NULL,
	[idCategoria] [int] NOT NULL,
	[precio] [float] NOT NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_Plato] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PreguntasFrecuentes]    Script Date: 4/11/2024 08:19:13 ******/
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
/****** Object:  Table [dbo].[Unidad]    Script Date: 4/11/2024 08:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unidad](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[unidad] [varchar](10) NULL,
 CONSTRAINT [PK_Unidad] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 4/11/2024 08:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
	[apellido] [varchar](20) NOT NULL,
	[email] [varchar](40) NOT NULL,
	[contraseña] [varchar](30) NOT NULL,
	[empresa] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 4/11/2024 08:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idPlato] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precioUnitario] [float] NOT NULL,
	[fecha] [date] NULL,
	[NombrePlato] [varchar](60) NULL,
 CONSTRAINT [PK_Ventas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categorias] ON 

INSERT [dbo].[Categorias] ([id], [nombre]) VALUES (1, N'sandwiches')
INSERT [dbo].[Categorias] ([id], [nombre]) VALUES (2, N'que')
INSERT [dbo].[Categorias] ([id], [nombre]) VALUES (3, N'Alah')
INSERT [dbo].[Categorias] ([id], [nombre]) VALUES (4, N'Cafe')
INSERT [dbo].[Categorias] ([id], [nombre]) VALUES (5, N'pepep')
SET IDENTITY_INSERT [dbo].[Categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[Ingrediente] ON 

INSERT [dbo].[Ingrediente] ([id], [descripcion], [cantidad], [valorUnidad], [activo], [idUnidad]) VALUES (1, N'azucar', 33, 5644, 1, 1)
INSERT [dbo].[Ingrediente] ([id], [descripcion], [cantidad], [valorUnidad], [activo], [idUnidad]) VALUES (2, N'lechuga', 50, 300, 1, 1)
INSERT [dbo].[Ingrediente] ([id], [descripcion], [cantidad], [valorUnidad], [activo], [idUnidad]) VALUES (3, N'pan', 1000, 100, 1, 1)
INSERT [dbo].[Ingrediente] ([id], [descripcion], [cantidad], [valorUnidad], [activo], [idUnidad]) VALUES (4, N'carne', 300, 300, 1, 1)
INSERT [dbo].[Ingrediente] ([id], [descripcion], [cantidad], [valorUnidad], [activo], [idUnidad]) VALUES (5, N'queso', 300, 300, 1, 1)
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

INSERT [dbo].[Plato] ([id], [nombre], [idCategoria], [precio], [activo]) VALUES (1, N'epp', 1, 907, 1)
INSERT [dbo].[Plato] ([id], [nombre], [idCategoria], [precio], [activo]) VALUES (2, N'hamburguesa con lechuga y tomate', 1, 15000, 1)
INSERT [dbo].[Plato] ([id], [nombre], [idCategoria], [precio], [activo]) VALUES (3, N'Hamburguesa con queso', 1, 44444, 1)
SET IDENTITY_INSERT [dbo].[Plato] OFF
GO
SET IDENTITY_INSERT [dbo].[Unidad] ON 

INSERT [dbo].[Unidad] ([id], [unidad]) VALUES (1, N'kg')
INSERT [dbo].[Unidad] ([id], [unidad]) VALUES (2, N'l')
INSERT [dbo].[Unidad] ([id], [unidad]) VALUES (3, N'Cm3')
INSERT [dbo].[Unidad] ([id], [unidad]) VALUES (4, N'gr')
INSERT [dbo].[Unidad] ([id], [unidad]) VALUES (5, N'cant')
SET IDENTITY_INSERT [dbo].[Unidad] OFF
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
ALTER TABLE [dbo].[Ingrediente]  WITH CHECK ADD  CONSTRAINT [FK_Ingrediente_Unidad] FOREIGN KEY([idUnidad])
REFERENCES [dbo].[Unidad] ([id])
GO
ALTER TABLE [dbo].[Ingrediente] CHECK CONSTRAINT [FK_Ingrediente_Unidad]
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
/****** Object:  StoredProcedure [dbo].[ActualizarIngrediente]    Script Date: 4/11/2024 08:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarIngrediente]
    @id INT,
    @descripcion VARCHAR(25),
    @cantidad FLOAT,
	@valorUnidad FLOAT,
	@activo BIT,
	@idUnidad INT
AS
BEGIN
    UPDATE Ingrediente
    SET descripcion = @descripcion, cantidad = @cantidad, valorUnidad = @valorUnidad, activo = @activo, idUnidad = @idUnidad
    WHERE id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarPlato]    Script Date: 4/11/2024 08:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarPlato]
    @id INT,
    @nombre VARCHAR(35),
    @idCategoria INT,
	@precio FLOAT,
	@activo BIT
AS
BEGIN
    UPDATE Plato
    SET nombre = @nombre, idCategoria = @idCategoria, precio = @precio, activo = @activo
    WHERE id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarVenta]    Script Date: 4/11/2024 08:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarVenta]
    @Id INT,
    @IdPlato INT,
    @Cantidad INT,
    @PrecioUnitario DECIMAL(18, 2),
    @Fecha Date
AS
BEGIN
    UPDATE Ventas SET cantidad = @Cantidad WHERE id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[AgregarCategoria]    Script Date: 4/11/2024 08:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[AgregarCategoria]
    @nombre VARCHAR(25)
AS
BEGIN
    INSERT INTO Categorias (nombre)
    VALUES (@nombre);
END
GO
/****** Object:  StoredProcedure [dbo].[BuscarPlato]    Script Date: 4/11/2024 08:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BuscarPlato]
    @nombre VARCHAR(35)
AS
BEGIN
    SELECT * FROM Plato
    WHERE nombre LIKE '%' + @nombre + '%';
END
GO
/****** Object:  StoredProcedure [dbo].[EliminarIngrediente]    Script Date: 4/11/2024 08:19:13 ******/
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
/****** Object:  StoredProcedure [dbo].[EliminarPlato]    Script Date: 4/11/2024 08:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarPlato]
    @id INT
AS
BEGIN
	DELETE FROM IngredientePlato WHERE IngredientePlato.idPlato = @id
    DELETE FROM Plato
    WHERE id = @id;
END
/****** Object:  StoredProcedure [dbo].[GetPlatoConCategoria]    Script Date: 28/10/2024 08:15:29 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[GetPlatoConCategoria]    Script Date: 4/11/2024 08:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPlatoConCategoria]
    @PlatoId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        P.id AS PlatoId,
        P.nombre AS PlatoNombre,
        P.precio AS PlatoPrecio,
        P.activo AS PlatoActivo,
        C.nombre AS CategoriaNombre
    FROM 
        Plato P
    INNER JOIN 
        PlatoCategoria PC ON P.id = PC.PlatoId
    INNER JOIN 
        Categorias C ON PC.CategoriaId = C.id
    WHERE 
        P.id = @PlatoId;
END
GO
/****** Object:  StoredProcedure [dbo].[GetUsuario]    Script Date: 4/11/2024 08:19:13 ******/
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
/****** Object:  StoredProcedure [dbo].[InsertarDetalleVenta]    Script Date: 4/11/2024 08:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarDetalleVenta]
    @idVenta INT,
    @idUsuario INT,
    @fecha DATE,
    @total FLOAT
AS
BEGIN
    INSERT INTO DetalleVenta (idVenta, idUsuario, fecha, total)
    VALUES (@idVenta, @idUsuario, @fecha, @total)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertarIngrediente]    Script Date: 4/11/2024 08:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarIngrediente]
    @descripcion VARCHAR(25),
    @cantidad FLOAT,
	@valorUnidad FLOAT,
	@activo BIT,
    @idUnidad INT
AS
BEGIN
    INSERT INTO Ingrediente (descripcion, cantidad, valorUnidad, activo, idUnidad)
    VALUES (@descripcion, @cantidad, @valorUnidad, @activo, @idUnidad);
END
GO
/****** Object:  StoredProcedure [dbo].[InsertarIngredientePlato]    Script Date: 4/11/2024 08:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarIngredientePlato]
    @IdPlato INT,
    @IdIngrediente INT,
    @CantXPlato VARCHAR(25)
AS
BEGIN
    INSERT INTO IngredientePlato (idPlato, idIngrediente, cantXPlato)
    VALUES (@IdPlato, @IdIngrediente, @CantXPlato);
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertarPlato]    Script Date: 4/11/2024 08:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarPlato]
    @nombre VARCHAR(35),
    @idCategoria INT,
	@precio FLOAT,
	@activo BIT
AS
BEGIN
    INSERT INTO Plato (nombre, idCategoria, precio, activo)
    VALUES (@nombre, @idCategoria, @precio, @activo);
END
GO
/****** Object:  StoredProcedure [dbo].[InsertarVenta]    Script Date: 4/11/2024 08:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarVenta]
    @idPlato INT,
    @cantidad INT,
    @precioUnitario FLOAT,
	@fecha DATETIME,
    @nombrePlato VARCHAR(60)
AS
BEGIN
    INSERT INTO Ventas (idPlato, cantidad, precioUnitario, fecha, NombrePlato)
    VALUES (@idPlato, @cantidad, @precioUnitario, @fecha, @nombrePlato)
    update Ingrediente set cantidad = cantidad - (select @cantidad * cantXPlato from IngredientePlato where idPlato=@idPlato and idIngrediente=Ingrediente.id) 
	WHERE Ingrediente.id IN (SELECT IdIngrediente from IngredientePlato where IngredientePlato.idPlato = @idPlato)
END
GO
/****** Object:  StoredProcedure [dbo].[LoginUsuario]    Script Date: 4/11/2024 08:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LoginUsuario]
    @email VARCHAR(40),
    @contraseña VARCHAR(20)
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
/****** Object:  StoredProcedure [dbo].[ObtenerCategorias]    Script Date: 4/11/2024 08:19:13 ******/
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
/****** Object:  StoredProcedure [dbo].[ObtenerCategoriasPorId]    Script Date: 4/11/2024 08:19:13 ******/
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
CREATE PROCEDURE [dbo].[ObtenerUnidadesPorId]
	@Id INT
AS
BEGIN
	SELECT *
	FROM Unidad
	WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerIngredientes]    Script Date: 4/11/2024 08:19:13 ******/
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
/****** Object:  StoredProcedure [dbo].[ObtenerIngredientesPorId]    Script Date: 4/11/2024 08:19:13 ******/
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
/****** Object:  StoredProcedure [dbo].[ObtenerIngredientesPorPlato]    Script Date: 4/11/2024 08:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[ObtenerIngredientesPorPlato]
    @idPlato INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        ip.id AS IngredientePlatoId, 
        ip.idIngrediente, 
        ip.idPlato, 
        ip.cantXPlato, 
        i.descripcion
    FROM IngredientePlato ip
    INNER JOIN Ingrediente i ON ip.idIngrediente = i.id
    WHERE ip.idPlato = @idPlato;
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerPlatos]    Script Date: 4/11/2024 08:19:13 ******/
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
/****** Object:  StoredProcedure [dbo].[ObtenerPlatosConVentas]    Script Date: 4/11/2024 08:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerPlatosConVentas]
AS
BEGIN
    SELECT 
        p.id AS IdPlato,
        p.nombre AS NombrePlato,
        p.precio AS precioUnitario,
        ISNULL(SUM(v.cantidad), 0) AS cantidad,
        ISNULL(SUM(v.cantidad * v.precioUnitario), 0) AS totalVenta,
        MAX(v.fecha) AS fecha -- Fecha de la última venta del plato
    FROM Plato p
    LEFT JOIN Ventas v ON p.id = v.idPlato
    GROUP BY p.id, p.nombre, p.precio;
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerPlatosPorCategoria]    Script Date: 4/11/2024 08:19:13 ******/
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
/****** Object:  StoredProcedure [dbo].[ObtenerPlatosPorId]    Script Date: 4/11/2024 08:19:13 ******/
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
/****** Object:  StoredProcedure [dbo].[ObtenerPlatosPorNombre]    Script Date: 4/11/2024 08:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerPlatosPorNombre]
	@Nombre NVARCHAR(35)
AS
BEGIN
	SELECT *
	FROM Plato
	WHERE Nombre = @Nombre;
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerUnidad]    Script Date: 4/11/2024 08:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[ObtenerUnidad]
AS
BEGIN
	SELECT *
	FROM Unidad;
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerVentaPorPlato]    Script Date: 4/11/2024 08:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerVentaPorPlato]
    @IdPlato INT
AS
BEGIN
    SELECT * FROM Ventas WHERE idPlato = @IdPlato;
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerVentas]    Script Date: 4/11/2024 08:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerVentas]
AS
BEGIN
	SELECT Ventas.*, Plato.nombre as NombrePlato
	FROM Ventas inner join Plato on Plato.id=Ventas.idPlato;
END
/****** Object:  StoredProcedure [dbo].[ObtenerVentasPorFecha]    Script Date: 28/10/2024 08:15:29 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[ObtenerVentasPorFecha]    Script Date: 4/11/2024 08:19:13 ******/
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
/****** Object:  StoredProcedure [dbo].[ObtenerVentasPorFechaEImporte]    Script Date: 4/11/2024 08:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerVentasPorFechaEImporte]
	@Fecha DATE,
	@precioUnitario INT
AS
BEGIN
	SELECT *
	FROM Ventas
	WHERE Fecha = @Fecha AND precioUnitario = @precioUnitario;
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerVentasPorFechaYPrecioUnitario]    Script Date: 4/11/2024 08:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerVentasPorFechaYPrecioUnitario]
	@Fecha DATE,
	@precioUnitario INT
AS
BEGIN
	SELECT *
	FROM Ventas
	WHERE Fecha = @Fecha AND precioUnitario = @precioUnitario;
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerVentasPorId]    Script Date: 4/11/2024 08:19:13 ******/
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
/****** Object:  StoredProcedure [dbo].[ObtenerVentasPorPlato]    Script Date: 4/11/2024 08:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerVentasPorPlato]
    @idPlato INT
AS
BEGIN
    SELECT * 
    FROM Ventas
    WHERE idPlato = @idPlato;
END
GO
/****** Object:  StoredProcedure [dbo].[RegistrarDetalleVenta]    Script Date: 4/11/2024 08:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RegistrarDetalleVenta]
    @idVenta INT,
    @idPlato INT,
    @cantidad INT,
    @precioUnitario DECIMAL(18, 2)
AS
BEGIN
    INSERT INTO DetalleVentas (idVenta, idPlato, cantidad, precioUnitario)
    VALUES (@idVenta, @idPlato, @cantidad, @precioUnitario);
END
GO
/****** Object:  StoredProcedure [dbo].[RegistrarUsuario]    Script Date: 4/11/2024 08:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[RegistrarUsuario]
    @nombre VARCHAR(30),
    @apellido VARCHAR(20),
    @email VARCHAR(40),
    @contraseña VARCHAR(30),
    @empresa VARCHAR(20)
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
/****** Object:  StoredProcedure [dbo].[VenderPlato]    Script Date: 4/11/2024 08:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VenderPlato]
    @idPlato INT,
    @idUsuario INT,
    @cantidadVendida INT
AS
BEGIN
    DECLARE @precio FLOAT;
    DECLARE @total FLOAT;

    SELECT @precio = precio FROM Platos WHERE id = @idPlato;

    SET @total = @cantidadVendida * @precio;

    INSERT INTO DetalleVenta (idVenta, idUsuario, fecha, total)
    VALUES (@idPlato, @idUsuario, GETDATE(), @total);
END
GO
USE [master]
GO
ALTER DATABASE [Grev] SET  READ_WRITE 
GO
CREATE PROCEDURE [dbo].[ObtenerIngredientesPorUnidad]
	@IdUnidad INT
AS
BEGIN
	SELECT *
	FROM Ingrediente
	WHERE idUnidad = @IdUnidad;
END
GO