using Microsoft.AspNetCore.Mvc;
using TP_FINAL.Models;
namespace TP_FINAL.Controllers
{
    public class PlatosController : Controller
    {
        public IActionResult Index(int idUsuario)
        {
            ViewBag.Usuario = BD.GetUsuario(idUsuario);
            var platos = BD.GetPlatos();
            ViewBag.BarraBusqueda=true;
            ViewBag.Categorias = BD.GetCategorias();
            var listaIngredientes = new List<IngredientePlato>();
            foreach(var plato in platos)
            {
                listaIngredientes.AddRange(BD.GetIngredientesPorPlato(plato.id));
            }
            ViewBag.IngredientesPlato = listaIngredientes;
            return View(platos);
        }

        public IActionResult Crear(int idUsuario)
        {
            ViewBag.Usuario=BD.GetUsuario(idUsuario);
            ViewBag.BarraBusqueda = true;
            ViewBag.Ingrediente = BD.GetIngredientes();
            ViewBag.Categorias=BD.GetCategorias();
            return View();
        }

        [HttpPost]
        public IActionResult Crear(Plato plato, List<int> ingredientesSeleccionados, int idUsuario)
        {
            if (ModelState.IsValid)
            {
                BD.InsertarPlato(plato);
                foreach (var ingredienteId in ingredientesSeleccionados)
            {
                BD.InsertarIngredientePlato(plato.id, ingredienteId, "1");
            }
                ViewBag.Categorias=BD.GetCategorias(plato.id);
                return RedirectToAction(nameof(Index), new { idUsuario = idUsuario });
            }
            ViewBag.Usuario=BD.GetUsuario(idUsuario);
            ViewBag.BarraBusqueda = true;
            ViewBag.Unidad=BD.GetUnidad();
            ViewBag.Categorias=BD.GetCategorias();
            ViewBag.Ingredientes = BD.GetIngredientes();
            return View(plato);
        }

        public IActionResult Editar(int id, int idUsuario)
        {
            Plato plato = BD.GetPlato(id);
            ViewBag.BarraBusqueda = true;
            ViewBag.Usuario = BD.GetUsuario(idUsuario);
            ViewBag.Ingrediente = BD.GetIngredientes();
            if (plato == null)
            {
                return NotFound();
            }
            ViewBag.Categorias = BD.GetCategorias();
            return View(plato);
        }

        [HttpPost]
        public IActionResult Editar(Plato plato, int idUsuario, IngredientePlato ingredientePlato) 
        {
            if (ModelState.IsValid)
            {
                BD.ActualizarPlato(plato, ingredientePlato);
                return RedirectToAction(nameof(Index), new { idUsuario = idUsuario });
            }
            ViewBag.Usuario = BD.GetUsuario(idUsuario);
            ViewBag.BarraBusqueda = true;
            ViewBag.Unidad = BD.GetUnidad();
            ViewBag.Categorias = BD.GetCategorias();
            ViewBag.Ingredientes = BD.GetIngredientes();
            return View(plato);
        }
            [HttpPost]
            [HttpGet]
        public IActionResult Eliminar(int id, int idUsuario)
        {
            //validar q no este en un plato
            try{
            BD.EliminarPlato(id);
            }catch(Exception ex)
            {
                ViewBag.ErrorEliminar = "No se puede eliminar el plato: " + ex.Message;
            }
            
            ViewBag.BarraBusqueda = true;
            ViewBag.Usuario=BD.GetUsuario(idUsuario);
            List<Plato> platos = BD.GetPlatos();
             ViewBag.Categorias = BD.GetCategorias();
            var listaIngredientes = new List<IngredientePlato>();
            foreach(var plato in platos)
            {
                listaIngredientes.AddRange(BD.GetIngredientesPorPlato(plato.id));
            }
            ViewBag.IngredientesPlato = listaIngredientes;
            return View("Index",platos);
        }
        public IActionResult CrearCategoria(int idUsuario)   
        {
            ViewBag.BarraBusqueda = true;
            ViewBag.Usuario=BD.GetUsuario(idUsuario);
            ViewBag.Categoria=BD.GetCategorias();
            List<Categorias> categorias = BD.GetCategorias();            
            return View();
    
        }
        [HttpPost]
        public IActionResult CrearCategoria(Categorias categoria, int idUsuario)
        {
            if (ModelState.IsValid)
            {
                BD.AgregarCategoria(categoria);
                return RedirectToAction("Index", new { idUsuario = idUsuario });
            }
            ViewBag.Usuario=BD.GetUsuario(idUsuario);
            ViewBag.BarraBusqueda = true;
            ViewBag.Unidad=BD.GetUnidad();
            ViewBag.Categorias=BD.GetCategorias();
            ViewBag.Ingredientes = BD.GetIngredientes();
            return View(categoria);
        }
    }
}
