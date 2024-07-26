using Microsoft.AspNetCore.Mvc;
using TP_FINAL.Models;
using System.Collections.Generic;

namespace TP_FINAL.Controllers
{
    public class PlatosController : Controller
    {
        public IActionResult Index()
        {
            List<Plato> plato = BD.GetPlatos();
            return View(plato);
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
                return RedirectToAction(nameof(Index));
            }
            return View(plato);
        }

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
