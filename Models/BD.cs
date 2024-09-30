using Dapper;
using System.Data.SqlClient;
using System.Data;
using System.Collections.Generic;

namespace TP_FINAL.Models;
public class BD{
    private static string _connectionString =  @"Server=.; Database=Grev; Trusted_Connection=True";
    
    public static List<Categorias> GetCategorias(){
        List<Categorias> Categorias = new List<Categorias>();
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sp = "ObtenerCategorias";
            Categorias = db.Query<Categorias>(sp, commandType: CommandType.StoredProcedure).ToList();
        }
        return Categorias;
    }
    public static List<Categorias> GetCategorias(int id)
{
    List<Categorias> Categorias = new List<Categorias>();
    using(SqlConnection db = new SqlConnection(_connectionString))
    {
        string sp = "ObtenerCategoriasPorId";
        Categorias = db.Query<Categorias>(sp, new { id = id }, commandType: CommandType.StoredProcedure).ToList();
    }
    return Categorias;
}
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
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sp = "GetUsuario";
            var Usuario = db.QueryFirstOrDefault<Usuario>(sp, new{IdUsuario = id}, commandType: CommandType.StoredProcedure);
            return Usuario;
        }
    }
    public static List<Plato> GetPlatos()
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sp = "ObtenerPlatos";
                return db.Query<Plato>(sp, commandType: CommandType.StoredProcedure).ToList();
            }
        }
        public static List<Unidad> GetUnidad()
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sp = "ObtenerUnidad";
                return db.Query<Unidad>(sp, commandType: CommandType.StoredProcedure).ToList();
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
                string sp = "ObtenerIngredientesPorId";
                return db.QueryFirstOrDefault<Ingrediente>(sp, new { Id = id }, commandType: CommandType.StoredProcedure);
            }
        }
            public static void InsertarIngredientePlato(int idPlato, int idIngrediente, string cantXPlato)
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sp = "InsertarIngredientePlato";
                db.Execute(sp, new { IdPlato = idPlato, IdIngrediente = idIngrediente, CantXPlato = cantXPlato }, commandType: CommandType.StoredProcedure);
            }
        }        
        public static void InsertarPlato(Plato plato)
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sp = "InsertarPlato";
                db.Execute(sp, new { plato.nombre, plato.idCategoria, plato.precio, plato.activo }, commandType: CommandType.StoredProcedure);
            }
        }
         public static void InsertarIngrediente(Ingrediente ingrediente)
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sp = "InsertarIngrediente";
                db.Execute(sp, new { ingrediente.descripcion, ingrediente.cantidad, ingrediente.valorUnidad, ingrediente.activo}, commandType: CommandType.StoredProcedure);
            }
        }
        public static void ActualizarPlato(Plato plato)
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sp = "ActualizarPlato";
                db.Execute(sp, new {plato.id, plato.nombre, plato.idCategoria, plato.precio, plato.activo }, commandType: CommandType.StoredProcedure);
            }
        }
        public static void ActualizarIngrediente(Ingrediente ingrediente)
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sp = "ActualizarIngrediente";
                db.Execute(sp, new {ingrediente.id, ingrediente.descripcion, ingrediente.cantidad, ingrediente.valorUnidad, ingrediente.activo, ingrediente.idUnidad}, commandType: CommandType.StoredProcedure);
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
 */
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
   /*
    public static void RecuperarContraseña(string Usuario, string Codigo,string NuevaContraseña){
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sp = "RecuperarContraseña";
            db.Execute(sp, new{Usuario = Usuario, Codigo=Codigo, NuevaContraseña = NuevaContraseña}, commandType: CommandType.StoredProcedure);
        }
    }
    }*/
     public static void AgregarCategoria(Categorias Categoria){
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sp = "AgregarCategoria";
            db.Execute(sp, new{Nombre = Categoria.nombre}, commandType: CommandType.StoredProcedure);
        }
    }
    public static List<Plato> BuscarPlatoPorNombre(string nombre)
    {
    List <Plato> plato = new List<Plato>(); 
    using (SqlConnection db = new SqlConnection(_connectionString))
    {
        string sp = "BuscarPlato"; 
        plato = db.Query<Plato>(sp, new {Nombre = nombre }, commandType: CommandType.StoredProcedure).ToList();
    }
    return plato;
    }
   /* public static void Hecho(int IdTarea)
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
public static Usuario GetUsuarioPorEmail(string email)
{
    using (SqlConnection db = new SqlConnection(_connectionString))
    {
        return db.QueryFirstOrDefault<Usuario>(
            "GetUsuarioPorEmail",
            new { Email = email },
            commandType: CommandType.StoredProcedure);
    }
}


 
}