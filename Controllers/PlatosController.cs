using Microsoft.AspNetCore.Mvc;
using TP_FINAL.Models;
namespace TP_FINAL.Controllers
{
    public class PlatosController : Controller
    {
        public IActionResult Index(int idUsuario)
        {
            ViewBag.BarraBusqueda = true;
            ViewBag.Usuario=BD.GetUsuario(idUsuario);
            ViewBag.Platos=BD.GetPlatos();
            List<Plato> platos = BD.GetPlatos();            
            return View(platos);
    
        }

        public IActionResult Crear(int idUsuario)
        {
            ViewBag.Usuario=BD.GetUsuario(idUsuario);
            ViewBag.BarraBusqueda = true;
            ViewBag.Usuario = BD.GetUsuario(idUsuario);
            ViewBag.Categorias=BD.GetCategorias();
            return View();
        }

        [HttpPost]
        public IActionResult Crear(Plato plato)
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
            ViewBag.BarraBusqueda = true;
            ViewBag.Usuario = BD.GetUsuario(idUsuario);
            if (plato == null)
            {
                return NotFound();
            }
            ViewBag.Categorias = BD.GetCategorias(plato.id);
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
              try{
            BD.EliminarPlato(id);
            }catch(Exception)
            {
                ViewBag.ErrorEliminar = "No se puede eliminar el Plato";
            }
            
            ViewBag.BarraBusqueda = true;
            ViewBag.Usuario=BD.GetUsuario(idUsuario);
            ViewBag.Platos=BD.GetPlatos();
            List<Plato> platos = BD.GetPlatos();
            return View("Index",platos);
        }

        [HttpPost, ActionName("Eliminar")]
        public IActionResult DeleteConfirmed(int id)
        {
            BD.EliminarPlato(id);
            return RedirectToAction(nameof(Index));
        }
         public IActionResult CrearCategoria()
        {
            ViewBag.BarraBusqueda = true;
            return View();
        }

        [HttpPost]
        public IActionResult CrearCategoria(Categorias categoria)
        {
            if (ModelState.IsValid)
            {
                BD.AgregarCategoria(categoria);
                return RedirectToAction("Index");
            }
            return View(categoria);
        }
    }
}
