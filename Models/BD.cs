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
                return db.QueryFirstOrDefault<Usuario>(sp, new { IdUsuario = id }, commandType: CommandType.StoredProcedure);

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

public static int RegistrarVenta(int idUsuario, DateTime fecha, double total)
{
    using (SqlConnection db = new SqlConnection(_connectionString))
    {
        string sp = "RegistrarVenta";
        return db.QuerySingle<int>(sp, new { idUsuario, fecha, total }, commandType: CommandType.StoredProcedure);
    }
}

public static void RegistrarDetalleVenta(int idVenta, int idPlato, int cantidad, double precioUnitario)
{
    using (SqlConnection db = new SqlConnection(_connectionString))
    {
        string sp = "RegistrarDetalleVenta";
        db.Execute(sp, new { idVenta, idPlato, cantidad, precioUnitario }, commandType: CommandType.StoredProcedure);
    }
}
public static void InsertarVenta(int idPlato, int cantidad, double precioUnitario)
{
    using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "InsertarVenta";  // Procedimiento almacenado para registrar una venta
            db.Execute(sp, new { idPlato = idPlato, cantidad = cantidad, precioUnitario = precioUnitario }, commandType: CommandType.StoredProcedure);
        }
}
 public static void InsertarDetalleVenta(int idVenta, int idUsuario, DateTime fecha, double total)
    {
        using (SqlConnection connection = new SqlConnection(_connectionString))
        {
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = "InsertarDetalleVenta"; // Llama al procedimiento almacenado
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@idVenta", idVenta);
            command.Parameters.AddWithValue("@idUsuario", idUsuario);
            command.Parameters.AddWithValue("@fecha", fecha);
            command.Parameters.AddWithValue("@total", total);
            connection.Open();
            command.ExecuteNonQuery();
        }
    }
public static void VenderPlato(int idPlato, int idUsuario, int cantidadVendida)
{
    using (SqlConnection connection = new SqlConnection(_connectionString))
    {
        SqlCommand command = new SqlCommand("RegistrarVenta", connection); // Procedimiento almacenado para registrar la venta
        command.CommandType = CommandType.StoredProcedure;
        command.Parameters.AddWithValue("@idPlato", idPlato);
        command.Parameters.AddWithValue("@idUsuario", idUsuario);
        command.Parameters.AddWithValue("@cantidad", cantidadVendida);
        connection.Open();
        command.ExecuteNonQuery();
    }
}
public static List<Ventas> GetVentas()
{
    using (SqlConnection db = new SqlConnection(_connectionString))
    {
        string sp = "ObtenerVentas";
        return db.Query<Ventas>(sp, commandType: CommandType.StoredProcedure).ToList();
    }
}

public static Ventas GetVentaPorPlato(int idPlato)
{
    using (SqlConnection db = new SqlConnection(_connectionString))
    {
        string sp = "ObtenerVentaPorPlato";
        return db.QueryFirstOrDefault<Ventas>(sp, new { IdPlato = idPlato }, commandType: CommandType.StoredProcedure);
    }
}

public static void ActualizarVenta(Ventas venta)
{
    using (SqlConnection db = new SqlConnection(_connectionString))
    {
        string sp = "ActualizarVenta";
        db.Execute(sp, new { venta.id, venta.idPlato, venta.cantidad, venta.precioUnitario }, commandType: CommandType.StoredProcedure);
    }
}

public static void RegistrarVenta(Ventas venta)
{
    using (SqlConnection db = new SqlConnection(_connectionString))
    {
        string sp = "RegistrarVenta";
        db.Execute(sp, new { venta.idPlato, venta.cantidad, venta.precioUnitario }, commandType: CommandType.StoredProcedure);
    }
}

 public static List<Plato> ObtenerPlatosConVentas()
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sp = "ObtenerPlatosConVentas";  // Procedimiento almacenado para obtener platos con ventas
                return db.Query<Plato>(sp, commandType: CommandType.StoredProcedure).ToList();
            }
        }


}