using Dapper;
using System.Data.SqlClient;
using System.Data;
using System.Collections.Generic;
namespace TP_FINAL.Models;

public class BD{
    private static string _connectionString = @"Server=.; Database=Grev; Trusted_Connection=True";
    /*public static List<Tareas> GetTareas(int IdUsuario){
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
    }*/
    public static Usuario LoginUsuario(string Email, string Contraseña){
        Usuario Usuario = null;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sp = "LoginUsuario";
            Usuario = db.QueryFirstOrDefault<Usuario>(sp, new{email = Email, contraseña = Contraseña}, commandType: CommandType.StoredProcedure);
        }
        return Usuario;
    }
    public static Usuario GetUsuario(int idUsuario){
        Usuario Usuario = null;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sp = "GetUsuario";
            Usuario = db.QueryFirstOrDefault<Usuario>(sp, new{IdUsuario = idUsuario}, commandType: CommandType.StoredProcedure);
        }
        return Usuario;
    }
   /* public static Tareas VerDetalleTarea(int IdTarea){
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
    }*/
    public static void RegistrarUsuario(Usuario Usuario){
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sp = "RegistrarUsuario";
            db.Execute(sp, new{ Nombre = Usuario.nombre, Apellido = Usuario.apellido, Email = Usuario.email, Contraseña = Usuario.contraseña, Empresa = Usuario.empresa, }, commandType: CommandType.StoredProcedure);
        }
    }    
   /* public static void EditarTarea(Tareas Tarea){
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
            db.Execute(sp, new{IdUsuario = Categoria.IdUsuario, Nombre = Categoria.nombre}, commandType: CommandType.StoredProcedure);
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
    }*/

    public Usuario GetUsuarioPorId(int id)
    {
        using (var connection = new SqlConnection(_connectionString))
        {
            connection.Open();
            string query = "SELECT * FROM Usuario WHERE id = @Id";
            return connection.QueryFirstOrDefault<Usuario>(query, new { Id = id });
        }
    }

    public void InsertarUsuario(Usuario usuario)
    {
        using (var connection = new SqlConnection(_connectionString))
        {
            connection.Open();
            string query = @"INSERT INTO Usuario (nombre, apellido, email, contraseña, empresa) VALUES (@Nombre, @Apellido, @Email, @Contraseña, @Empresa)";
            connection.Execute(query, usuario);
        }
    }
}