using System.ComponentModel.DataAnnotations;

public class IngredientePlato
{
    public int id { get; set; }
    public string descripcion { get; set; }
    public int idIngrediente { get; set; }
    public int idPlato { get; set; }
    public string cantXPlato { get; set; }
}