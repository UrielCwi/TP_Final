using Microsoft.AspNetCore.Mvc;
using TP_FINAL.Models;
using System.Collections.Generic;
using System.Linq;

namespace TP_FINAL.Controllers
{
    public class VentasController : Controller
    {
        public IActionResult IndexVentas(int idUsuario)
        {
            ViewBag.Usuario = BD.GetUsuario(idUsuario);
            List<Plato> platos = BD.GetPlatos();
            ViewBag.BarraBusqueda = true;

            var platosConVentas = platos.Select(plato => new
            {
                Plato = plato,
                CantidadVendida = 0, // Inicia con 0 ya que no se han vendido
                TotalAcumulado = 0.0 // Total inicial
            }).ToList();

            return View(platosConVentas);
        }

        [HttpPost]
        public IActionResult VenderPlato(int idUsuario, int idPlato, int cantidad)
        {
            ViewBag.Usuario = BD.GetUsuario(idUsuario);
            ViewBag.BarraBusqueda = true;
            if (cantidad <= 0) return BadRequest("La cantidad debe ser mayor a cero.");
            
            var plato = BD.GetPlato(idPlato);
            if (plato == null) return NotFound("Plato no encontrado.");

            // Registrar la venta
            BD.VenderPlato(idPlato, 1, cantidad); // Suponiendo que el ID de usuario es 1 para simplificar
            return RedirectToAction("IndexVentas");
        }
    }
}
