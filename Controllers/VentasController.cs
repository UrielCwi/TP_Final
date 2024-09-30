using Microsoft.AspNetCore.Mvc;
using TP_FINAL.Models;
namespace TP_FINAL.Controllers

{
    public class VentasController : Controller
    {
        public IActionResult Index(int idUsuario)
        {
            ViewBag.Usuario = BD.GetUsuario(idUsuario);
            ViewBag.Platos=BD.GetPlatos();
            ViewBag.BarraBusqueda = true;
            List<Plato> platos = BD.GetPlatos();
            return View(platos);
        }

        [HttpPost]
        public IActionResult VenderPlato(int idPlato)
        {
            // Obtener el plato
            var plato = BD.GetPlato(idPlato);

            // Aquí podrías agregar lógica para registrar la venta
            // Por ejemplo, incrementar la cantidad de platos vendidos

            // Simulando la actualización de ventas
            int cantidadVendida = 0; // Aquí puedes obtener la cantidad vendida de la base de datos
            cantidadVendida++; // Incrementar la cantidad vendida
            // Actualiza la base de datos si es necesario

            // Redirigir de nuevo a la vista Index
            return RedirectToAction("Index");
        }
    }
}
