using Dapper;
using System.Data.SqlClient;
using System.Data;
using System.Collections.Generic;

namespace TP_FINAL.Models;
public class BD{
    private static string _connectionString =  @"Server=.; Database=Grev; Trusted_Connection=True";
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
    public static Usuario LoginUsuario(string email, string contraseña)
        {
            Usuario usuario = null;
            try
            {
                using (SqlConnection db = new SqlConnection(_connectionString))
                {
                    string sp = "LoginUsuario";
                    usuario = db.QueryFirstOrDefault<Usuario>(sp, new { email = email, contraseña = contraseña }, commandType: CommandType.StoredProcedure);
                }
            }
            catch (SqlException ex)
            {
                Console.WriteLine($"SQL Error: {ex.Message}");
                throw;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"General Error: {ex.Message}");
                throw;
            }
            return usuario;
        }
    public static Usuario GetUsuario(int id){
        Usuario Usuario = null;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sp = "ObtenerUsuario";
            Usuario = db.QueryFirstOrDefault<Usuario>(sp, new{IDo = id}, commandType: CommandType.StoredProcedure);
        }
        return Usuario;
    }
    public static List<Plato> GetPlatos()
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sp = "ObtenerPlatos";
                return db.Query<Plato>(sp, commandType: CommandType.StoredProcedure).ToList();
            }
        }
        public static List<Ingrediente> GetIngredientes()
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sp = "ObtenerIngredientes";
                return db.Query<Ingrediente>(sp, commandType: CommandType.StoredProcedure).ToList();
            }
        }


        public static Plato GetPlato(int id)
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sp = "ObtenerPlatosPorId";
                return db.QueryFirstOrDefault<Plato>(sp, new { Id = id }, commandType: CommandType.StoredProcedure);
            }
        }
         public static Ingrediente GetIngrediente(int id)
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sp = "ObtenerIngrediente";
                return db.QueryFirstOrDefault<Ingrediente>(sp, new { Id = id }, commandType: CommandType.StoredProcedure);
            }
        }

        public static void InsertarPlato(Plato plato)
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sp = "InsertarPlato";
                db.Execute(sp, new { plato.nombre, plato.idCategoria, plato.precio }, commandType: CommandType.StoredProcedure);
            }
        }

         public static void InsertarIngrediente(Ingrediente ingrediente)
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sp = "InsertarIngrediente";
                db.Execute(sp, new { ingrediente.descripcion, ingrediente.cantidad, ingrediente.valorUnidad}, commandType: CommandType.StoredProcedure);
            }
        }

        public static void ActualizarPlato(Plato plato)
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sp = "ActualizarPlato";
                db.Execute(sp, new { plato.id, plato.nombre, plato.idCategoria, plato.precio }, commandType: CommandType.StoredProcedure);
            }
        }
        public static void ActualizarIngrediente(Ingrediente ingrediente)
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sp = "ActualizarIngrediente";
                db.Execute(sp, new { ingrediente.id, ingrediente.descripcion, ingrediente.cantidad, ingrediente.valorUnidad }, commandType: CommandType.StoredProcedure);
            }
        }

        public static void EliminarPlato(int id)
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sp = "EliminarPlato";
                db.Execute(sp, new { Id = id }, commandType: CommandType.StoredProcedure);
            }
        }
        public static void EliminarIngrediente(int id)
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sp = "EliminarIngrediente";
                db.Execute(sp, new { Id = id }, commandType: CommandType.StoredProcedure);
            }
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
    public static int RegistrarUsuario(Usuario usuario){
        int nuevoUsuarioId = -1;
        try{
            using(SqlConnection db = new SqlConnection(_connectionString)){
                string sp = "RegistrarUsuario";
                var parameters = db.QueryFirstOrDefault<int>(sp, new{ Nombre = usuario.nombre, Apellido = usuario.apellido, Email = usuario.email, Contraseña = usuario.contraseña, Empresa = usuario.empresa, }, commandType: CommandType.StoredProcedure);
                nuevoUsuarioId = db.QuerySingleOrDefault<int>(sp, parameters, commandType: CommandType.StoredProcedure);}
        }
          catch (SqlException ex)
            {
                Console.WriteLine($"SQL Error: {ex.Message}");
                throw;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"General Error: {ex.Message}");
                throw;
            }
            return nuevoUsuarioId;
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

    public static void InsertarUsuario(Usuario usuario)
    {
        using (var connection = new SqlConnection(_connectionString))
        {
            connection.Open();
            string query = @"INSERT INTO Usuario (nombre, apellido, email, contraseña, empresa) VALUES (@Nombre, @Apellido, @Email, @Contraseña, @Empresa)";
            connection.Execute(query, usuario);
        }
    }
    
}