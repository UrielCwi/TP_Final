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
            List<Ventas> ventas = BD.ObtenerPlatosConVentas();
            return View(ventas);
        }

        [HttpPost]
        public IActionResult VenderPlato(int idUsuario, int idPlato, int cantidad, double precioUnitario, DateTime fecha, string nombrePlato)
        {
            ViewBag.Usuario = BD.GetUsuario(idUsuario);
            ViewBag.BarraBusqueda = true;
            fecha = DateTime.Now;

            if (cantidad <= 0) 
                return BadRequest("La cantidad debe ser mayor a cero.");

            // Llamada al procedimiento almacenado para registrar la venta
            BD.InsertarVenta(idPlato, cantidad, precioUnitario, fecha, nombrePlato);

            return RedirectToAction("Index", new { idUsuario = idUsuario });
        }
    }
}
