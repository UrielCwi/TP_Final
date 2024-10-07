using System.ComponentModel.DataAnnotations;

public class Plato
{
    public int id { get; set; }
    [Required(ErrorMessage = "El nombre es obligatoria")]
    public string nombre { get; set; }
    public int idCategoria { get; set; }
    [Required(ErrorMessage = "Debe ser un número mayor a 0")]
    [Range(1, double.MaxValue, ErrorMessage = "Debe ser un número mayor a 0")]
    public double precio { get; set; }
    public int cantidadVendida { get; set; }
    public bool activo { get; set; }
}
