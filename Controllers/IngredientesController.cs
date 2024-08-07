using Microsoft.AspNetCore.Mvc;
using TP_FINAL.Models;
namespace TP_FINAL.Controllers
{
    public class IngredientesController : Controller
    {
        public IActionResult Index()
        {
            List<Ingrediente> ingredientes = BD.GetIngredientes();
            return View(ingredientes);
        }

        public IActionResult Create(int idUsuario)
        {
            ViewBag.Usuario=BD.GetUsuario(idUsuario);
            return View();
        }

        [HttpPost]
        public IActionResult Create(Ingrediente ingrediente)
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
            ViewBag.Usuario=BD.GetUsuario(idUsuario);
            Ingrediente ingrediente = BD.GetIngrediente(id);
            if (ingrediente == null)
            {
                return NotFound();
            }
            return View(ingrediente);
        }

        [HttpPost, ActionName("Eliminar")]
        public IActionResult DeleteConfirmed(int id)
        {
            BD.EliminarIngrediente(id);
            return RedirectToAction(nameof(Index));
        }
    }
}
