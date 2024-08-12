using Microsoft.AspNetCore.Mvc;
using TP_FINAL.Models;
namespace TP_FINAL.Controllers
{
    public class PlatosController : Controller
    {
        public IActionResult Index()
        {
            List<Plato> platos = BD.GetPlatos();
            return View(platos);
        }

        public IActionResult Create(int idUsuario)
        {
            ViewBag.Usuario=BD.GetUsuario(idUsuario);
            return View();
        }

        [HttpPost]
        public IActionResult Create(Plato plato)
        {
            if (ModelState.IsValid)
            {
                BD.InsertarPlato(plato);
                ViewBag.Categorias=BD.GetCategorias(plato.id);
                return RedirectToAction(nameof(Index));
            }
            return View(plato);
        }

        public IActionResult Editar(int id, int idUsuario)
        {
            Plato plato = BD.GetPlato(id);
            ViewBag.Usuario=BD.GetUsuario(idUsuario);
            if (plato == null)
            {
                return NotFound();
            }
            ViewBag.Categorias=BD.GetCategorias(plato.id);
            return View(plato);
        }

        [HttpPost]
        public IActionResult Editar(Plato plato)
        {
            if (ModelState.IsValid)
            {
                BD.ActualizarPlato(plato);
                return RedirectToAction(nameof(Index));
            }
            return View(plato);
        }

        [HttpPost]
        public IActionResult Eliminar(int id, int idUsuario)
        {
            ViewBag.Usuario=BD.GetUsuario(idUsuario);
            Plato plato = BD.GetPlato(id);
            if (plato == null)
            {
                return NotFound();
            }
            return View(plato);
        }

        [HttpPost, ActionName("Eliminar")]
        public IActionResult DeleteConfirmed(int id)
        {
            BD.EliminarPlato(id);
            return RedirectToAction(nameof(Index));
        }

        public IActionResult BuscarPlatoPorNombre(string nombre, int idUsuario)
        {
        ViewBag.BarraBusqueda = false;
        ViewBag.Platos = BD.GetPlato(idUsuario); 
        if (!string.IsNullOrEmpty(nombre))
        {
            ViewBag.Platos = BD.BuscarPlatoPorNombre(idUsuario, nombre);
        }
        ViewBag.Categorias = BD.GetCategorias(idUsuario);
        ViewBag.Usuario = BD.GetUsuario(idUsuario);
        return View("Home");
        }
    }
}
