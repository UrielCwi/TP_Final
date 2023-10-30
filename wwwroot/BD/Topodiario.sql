USE [master]
GO
/****** Object:  Database [TopodiarioBD]    Script Date: 30/10/2023 08:52:23 ******/
CREATE DATABASE [TopodiarioBD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TopodiarioBD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TopodiarioBD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TopodiarioBD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TopodiarioBD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TopodiarioBD] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TopodiarioBD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TopodiarioBD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TopodiarioBD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TopodiarioBD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TopodiarioBD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TopodiarioBD] SET ARITHABORT OFF 
GO
ALTER DATABASE [TopodiarioBD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TopodiarioBD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TopodiarioBD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TopodiarioBD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TopodiarioBD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TopodiarioBD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TopodiarioBD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TopodiarioBD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TopodiarioBD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TopodiarioBD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TopodiarioBD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TopodiarioBD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TopodiarioBD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TopodiarioBD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TopodiarioBD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TopodiarioBD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TopodiarioBD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TopodiarioBD] SET RECOVERY FULL 
GO
ALTER DATABASE [TopodiarioBD] SET  MULTI_USER 
GO
ALTER DATABASE [TopodiarioBD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TopodiarioBD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TopodiarioBD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TopodiarioBD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TopodiarioBD] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TopodiarioBD', N'ON'
GO
ALTER DATABASE [TopodiarioBD] SET QUERY_STORE = OFF
GO
USE [TopodiarioBD]
GO
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
	[Color] [nvarchar](10) NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tareas](
	[IdTarea] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[IdCategoria] [int] NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[FechaRealizacion] [date] NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Tarea] PRIMARY KEY CLUSTERED 
(
	[IdTarea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](500) NOT NULL,
	[Contraseña] [nvarchar](500) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Categorias]  WITH CHECK ADD  CONSTRAINT [FK_Categorias_Usuarios] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[Categorias] CHECK CONSTRAINT [FK_Categorias_Usuarios]
GO
ALTER TABLE [dbo].[Tareas]  WITH CHECK ADD  CONSTRAINT [FK_Tareas_Categorias] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categorias] ([IdCategoria])
GO
ALTER TABLE [dbo].[Tareas] CHECK CONSTRAINT [FK_Tareas_Categorias]
GO
ALTER TABLE [dbo].[Tareas]  WITH CHECK ADD  CONSTRAINT [FK_Tareas_Usuarios] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[Tareas] CHECK CONSTRAINT [FK_Tareas_Usuarios]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BorrarTarea]
	(
		@IdTarea int
	)
AS
BEGIN
	SET NOCOUNT ON;
DELETE FROM [dbo].[Tareas]
      WHERE IdTarea = @IdTarea
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EditarTarea] 
	(
		@IdTarea int,
		@IdCategoria int,
		@Nombre nvarchar(500),
		@Descripcion nvarchar(MAX)
	)
AS
BEGIN
	SET NOCOUNT ON;
UPDATE [dbo].[Tareas]
   SET [IdCategoria] = @IdCategoria
      ,[Nombre] = @Nombre
      ,[Descripcion] = @Descripcion
 WHERE IdTarea = @IdTarea
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCategoriaById]
	(
		@IdCategoria int
	)
AS
BEGIN
	SET NOCOUNT ON;
SELECT [IdCategoria]
      ,[IdUsuario]
      ,[Nombre]
      ,[Descripcion]
      ,[Color]
  FROM [dbo].[Categorias]
  WHERE IdCategoria = @IdCategoria
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCategorias] 
	(
		@IdUsuario int
	)
AS
BEGIN
	SET NOCOUNT ON;
SELECT [IdCategoria]
      ,[IdUsuario]
      ,[Nombre]
      ,[Descripcion]
      ,[Color]
  FROM [dbo].[Categorias]
  WHERE IdUsuario = @IdUsuario
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTareas]
	(
		@IdUsuario int
	)
AS
BEGIN
	SET NOCOUNT ON;
SELECT [IdTarea]
      ,[IdUsuario]
      ,[IdCategoria]
      ,[Nombre]
      ,[FechaRealizacion]
      ,[Descripcion]
  FROM [dbo].[Tareas]
  WHERE IdUsuario = @IdUsuario
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LoginUsuario]
	(
		@Nombre nvarchar(500),
		@Contraseña nvarchar(500)
	)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT [IdUsuario]
		,[Nombre]
		,[Contraseña]
		,[FechaNacimiento]
	FROM [dbo].[Usuarios]
	WHERE Nombre = @Nombre AND Contraseña = @Contraseña
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RegistrarUsuario]
	(
		@Nombre nvarchar(500),
		@Contraseña nvarchar(500),
		@FechaNacimiento date
	)
AS
BEGIN
	SET NOCOUNT ON;
INSERT INTO [dbo].[Usuarios]
           ([Nombre]
           ,[Contraseña]
           ,[FechaNacimiento])
     VALUES
           (@Nombre,
		   @Contraseña,
		   @FechaNacimiento)
END
GO
USE [master]
GO
ALTER DATABASE [TopodiarioBD] SET  READ_WRITE 
GO
