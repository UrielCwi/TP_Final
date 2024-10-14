using Microsoft.AspNetCore.Mvc;
using TP_FINAL.Models;
using System.Collections.Generic;

namespace TP_FINAL.Controllers
{
    public class GraficosController : Controller
    {
        public IActionResult Index(int idUsuario)
        {
            ViewBag.Usuario = BD.GetUsuario(idUsuario);
            ViewBag.BarraBusqueda = true;

            // Obtener datos de ventas
            var platosConVentas = BD.ObtenerPlatosConVentas();
            ViewBag.PlatosConVentas = platosConVentas;

            // Obtener ingredientes
            var ingredientes = BD.GetIngredientes();
            ViewBag.Ingredientes = ingredientes;

            // Obtener platos
            var platos = BD.GetPlatos();
            ViewBag.Platos = platos;

            return View();
        }
    }
}
