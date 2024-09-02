using Microsoft.AspNetCore.Mvc;
using TP_FINAL.Models;
namespace TP_FINAL.Controllers
{
    public class IngredientesController : Controller
    {
        public IActionResult Index(int idUsuario)
        {
            ViewBag.BarraBusqueda = true;
            ViewBag.Usuario=BD.GetUsuario(idUsuario);
            ViewBag.Ingredientes=BD.GetIngredientes();
            List<Ingrediente> ingredientes = BD.GetIngredientes();
            return View(ingredientes);
        }

        public IActionResult Crear(int idUsuario)
        {
            ViewBag.Usuario=BD.GetUsuario(idUsuario);
            ViewBag.BarraBusqueda = true;
            return View();
        }

        [HttpPost]
        public IActionResult Crear(Ingrediente ingrediente)
        {
            if (ModelState.IsValid)
            {
                BD.InsertarIngrediente(ingrediente);
                return RedirectToAction(nameof(Index));
            }
            return View(ingrediente);
        }

        public IActionResult Editar(int id, int idUsuario)
        {
            ViewBag.Usuario=BD.GetUsuario(idUsuario);
            ViewBag.BarraBusqueda = true;
            Ingrediente ingrediente = BD.GetIngrediente(id);
            if (ingrediente == null)
            {
                return NotFound();
            }
            return View(ingrediente);
        }

        [HttpPost]
        public IActionResult Editar(Ingrediente ingrediente)
        {
            if (ModelState.IsValid)
            {
                BD.ActualizarIngrediente(ingrediente);
                return RedirectToAction(nameof(Index));
            }
            return View(ingrediente);
        }

      
        [HttpPost]
        public IActionResult Eliminar(int id, int idUsuario)
        {
            //validar q no este en un plato
            try{
            BD.EliminarIngrediente(id);
            }catch(Exception)
            {
                ViewBag.ErrorEliminar = "No se puede eliminar el ingrediente";
            }
            
            ViewBag.BarraBusqueda = true;
            ViewBag.Usuario=BD.GetUsuario(idUsuario);
            ViewBag.Ingredientes=BD.GetIngredientes();
            List<Ingrediente> ingredientes = BD.GetIngredientes();
            return View("Index",ingredientes);
        }
    }
    }
