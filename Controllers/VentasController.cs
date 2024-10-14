using Microsoft.AspNetCore.Mvc;
using TP_FINAL.Models;
using System.Collections.Generic;

namespace TP_FINAL.Controllers
{
    public class VentasController : Controller
    {
        public IActionResult Index(int idUsuario)
        {
            ViewBag.Usuario = BD.GetUsuario(idUsuario);
            ViewBag.BarraBusqueda = true;
            List<Plato> platos = BD.GetPlatos();
            // Llamada al procedimiento almacenado para obtener la lista de platos con sus ventas
            var platosConVentas = BD.ObtenerPlatosConVentas();

            return View(platosConVentas);
        }

        [HttpPost]
        public IActionResult VenderPlato(int idUsuario, int idPlato, int cantidad, double precioUnitario)
        {
            ViewBag.Usuario = BD.GetUsuario(idUsuario);
            ViewBag.BarraBusqueda = true;
            
            if (cantidad <= 0) 
                return BadRequest("La cantidad debe ser mayor a cero.");

            // Llamada al procedimiento almacenado para registrar la venta
            BD.InsertarVenta(idPlato, cantidad, precioUnitario);

            return RedirectToAction("Index", new { idUsuario = idUsuario });
        }
    }
}
