using System.ComponentModel.DataAnnotations;

public class Ingrediente
{
    public int id { get; set; }
    
    [Required(ErrorMessage = "La descripción es obligatoria")]
    public string descripcion { get; set; } = string.Empty; 
    
    [Required(ErrorMessage = "Debe ser un número mayor a 0")]
    [Range(1, double.MaxValue, ErrorMessage = "Debe ser un número mayor a 0")]
    public double cantidad { get; set; }
    
    [Required(ErrorMessage = "Debe ser un número mayor a 0")]
    [Range(1, double.MaxValue, ErrorMessage = "Debe ser un número mayor a 0")]
    public double valorUnidad { get; set; }
    
    public bool activo { get; set; }
    
    public int idUnidad { get; set; }
}
