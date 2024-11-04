public class Ventas
{
    public int id { get; set; }
    public int idPlato { get; set; }
    public int cantidad { get; set; }    
    public double precioUnitario { get; set; }
    public DateTime fecha { get; set; }
    public string? NombrePlato {get;set;}
    public double totalVenta {get;set;}
}
