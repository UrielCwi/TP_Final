using Dapper;
using System.Data.SqlClient;
using System.Data;
using System.Collections.Generic;
namespace TP_FINAL.Models;

public class BD{
    private static string _connectionString = @"Server=.; Database=TopodiarioBD; Trusted_Connection=True";
    public static List<Tareas> GetTareas(int IdUsuario){
        List<Tareas> Tareas = null;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sp = "GetTareas";
            Tareas = db.Query<Tareas>(sp, new{IdUsuario = IdUsuario}, commandType: CommandType.StoredProcedure).ToList();
        }
        return Tareas;
    }
    public static List<Categorias> GetCategorias(int IdUsuario){
        List<Categorias> Categorias = null;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sp = "GetCategorias";
            Categorias = db.Query<Categorias>(sp, new{IdUsuario = IdUsuario}, commandType: CommandType.StoredProcedure).ToList();
        }
        return Categorias;
    }
    public static Usuarios LoginUsuario(string Nombre, string Contraseña){
        Usuarios Usuarios = null;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sp = "LoginUsuario";
            Usuarios = db.QueryFirstOrDefault<Usuarios>(sp, new{Nombre = Nombre, Contraseña = Contraseña}, commandType: CommandType.StoredProcedure);
        }
        return Usuarios;
    }
    public static Usuarios GetUsuario(int IdUsuario){
        Usuarios Usuarios = null;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sp = "GetUsuario";
            Usuarios = db.QueryFirstOrDefault<Usuarios>(sp, new{IdUsuario = IdUsuario}, commandType: CommandType.StoredProcedure);
        }
        return Usuarios;
    }
    public static Tareas VerDetalleTarea(int IdTarea){
        Tareas tarea = null;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sp = "VerDetalleTarea";
            tarea = db.QueryFirstOrDefault<Tareas>(sp, new{IdTarea = IdTarea}, commandType: CommandType.StoredProcedure);
        }
        return tarea;
    }
    public static List<Categorias> GetCategoriaById(int IdCategoria){
        List<Categorias> Categorias = null;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sp = "GetCategoriaById";
            Categorias = db.Query<Categorias>(sp, new{IdCategoria = IdCategoria}, commandType: CommandType.StoredProcedure).ToList();
        }
        return Categorias;
    }
    public static void RegistrarUsuario(Usuarios Usuario){
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sp = "RegistrarUsuario";
            db.Execute(sp, new{Nombre = Usuario.Nombre, Contraseña = Usuario.Contraseña, FechaNacimiento = Usuario.FechaNacimiento, Codigo = Usuario.Codigo}, commandType: CommandType.StoredProcedure);
        }
    }    
    public static void EditarTarea(Tareas Tarea){
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sp = "EditarTarea";
            db.Execute(sp, new{IdTarea = Tarea.IdTarea, IdCategoria = Tarea.IdCategoria,
            Nombre = Tarea.Nombre, FechaRealizacion = Tarea.FechaRealizacion, Descripcion = Tarea.Descripcion}, commandType: CommandType.StoredProcedure);
        }
    }
    public static void BorrarTarea(int IdTarea){
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sp = "BorrarTarea";
            db.Execute(sp, new{IdTarea = IdTarea}, commandType: CommandType.StoredProcedure);
        }
    }
    public static void RecuperarContraseña(string Usuario, string Codigo,string NuevaContraseña){
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sp = "RecuperarContraseña";
            db.Execute(sp, new{Usuario = Usuario, Codigo=Codigo, NuevaContraseña = NuevaContraseña}, commandType: CommandType.StoredProcedure);
        }
    }
     public static void AgregarTarea(Tareas Tarea){
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sp = "AgregarTarea";
            db.Execute(sp, new{IdUsuario = Tarea.IdUsuario, IdCategoria = Tarea.IdCategoria, Nombre = Tarea.Nombre, FechaRealizacion = Tarea.FechaRealizacion, Descripcion = Tarea.Descripcion}, commandType: CommandType.StoredProcedure);
        }
    }
     public static void AgregarCategoria(Categorias Categoria){
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sp = "AgregarCategoria";
            db.Execute(sp, new{IdUsuario = Categoria.IdUsuario, Nombre = Categoria.Nombre}, commandType: CommandType.StoredProcedure);
        }
    }
    public static List<Tareas> BuscarTareaPorNombre(int IdUsuario, string nombre)
    {
    List <Tareas> tarea = new List<Tareas>(); 
    using (SqlConnection db = new SqlConnection(_connectionString))
    {
        string sp = "BuscarTareaPorNombre"; 
        tarea = db.Query<Tareas>(sp, new { IdUsuario = IdUsuario, Nombre = nombre }, commandType: CommandType.StoredProcedure).ToList();
    }
    return tarea;
    }
    public static void Hecho(int IdTarea)
    {
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sp = "MarcarComoHecho";
            db.Execute(sp, new{IdTarea = IdTarea}, commandType: CommandType.StoredProcedure);
        }
    }
}