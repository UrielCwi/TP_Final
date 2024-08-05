using Microsoft.AspNetCore.Mvc;
using TP_FINAL.Models;
using System.Collections.Generic;

namespace TP_FINAL.Controllers
{
    public class PlatosController : Controller
    {
        public IActionResult Index()
        {
            List<Plato> platos = BD.GetPlatos();
            return View(platos);
        }

        public IActionResult Create()
        {
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

        public IActionResult Editar(int id)
        {
            Plato plato = BD.GetPlato(id);
            if (plato == null)
            {
                return NotFound();
            }
            return View(plato);
        }

        [HttpPost]
        public IActionResult Editar(Plato plato)
        {
            if (ModelState.IsValid)
            {
                BD.ActualizarPlato(plato);
                ViewBag.Categorias=BD.GetCategorias(plato.id);
                return RedirectToAction(nameof(Index));
            }
            return View(plato);
        }

        [HttpPost]
        public IActionResult Eliminar(int id)
        {
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
    }
}
