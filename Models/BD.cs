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
            db.Execute(sp, new{Nombre = Usuario.Nombre, Contraseña = Usuario.Contraseña,
             FechaNacimiento = Usuario.FechaNacimiento}, commandType: CommandType.StoredProcedure);
        }
    }    
    public static void EditarTarea(Tareas Tarea){
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sp = "EditarTarea";
            db.Execute(sp, new{IdTarea = Tarea.IdTarea, IdCategoria = Tarea.IdCategoria,
            Nombre = Tarea.Nombre, Descripcion = Tarea.Descripcion}, commandType: CommandType.StoredProcedure);
        }
    }
    public static void BorrarTarea(int IdTarea){
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sp = "BorrarTarea";
            db.Execute(sp, new{IdTarea = IdTarea}, commandType: CommandType.StoredProcedure);
        }
    }
    public static void RecuperarContraseña(string Usuario, string Contraseña, string NuevaContraseña){
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sp = "RecuperarContraseña";
            db.Execute(sp, new{Usuario = Usuario, Contraseña = Contraseña, NuevaContraseña = NuevaContraseña}, commandType: CommandType.StoredProcedure);
        }
    }
     public static void AgregarTarea(Tareas Tarea){
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sp = "AgregarTarea";
            db.Execute(sp, new{IdTarea = Tarea.IdTarea, IdCategoria = Tarea.IdCategoria,
            Nombre = Tarea.Nombre, Descripcion = Tarea.Descripcion}, commandType: CommandType.StoredProcedure);
        }
    }
}