using Microsoft.AspNetCore.Mvc;
using TP_FINAL.Models;

namespace TP_FINAL.Controllers
{
    public class VentasController : Controller
    {
        public IActionResult Index(int idUsuario)
        {
            ViewBag.BarraBusqueda = true;
            ViewBag.Usuario = BD.GetUsuario(idUsuario);
            return View();
        }

        public IActionResult Crear(int idUsuario)
        {
            ViewBag.Usuario = BD.GetUsuario(idUsuario);
            ViewBag.BarraBusqueda = true;
            ViewBag.Platos = BD.GetPlatos(); 
            return View();
        }

        [HttpPost]
        public IActionResult Crear(int idUsuario, List<Venta> ventas)
        {
            if (ventas != null && ventas.Count > 0)
            {
                var total = ventas.Sum(v => v.cantidad * v.precioUnitario);
                int idVenta = BD.RegistrarVenta(idUsuario, DateTime.Now, total);
                
                foreach (var venta in ventas)
                {
                    BD.RegistrarDetalleVenta(idVenta, venta.idPlato, venta.cantidad, venta.precioUnitario);
                }

                return RedirectToAction(nameof(Index), new { idUsuario });
            }

            ViewBag.Usuario = BD.GetUsuario(idUsuario);
            ViewBag.BarraBusqueda = true;
            ViewBag.Error = "No se han registrado productos para la venta.";
            return View();
        }
    }
}
