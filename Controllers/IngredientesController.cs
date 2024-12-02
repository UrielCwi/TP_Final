using Microsoft.AspNetCore.Mvc;
using TP_FINAL.Models;
namespace TP_FINAL.Controllers
{
    public class IngredientesController : Controller
    {
        public IActionResult Index(int idUsuario)
        {
            ViewBag.BarraBusqueda = true;
            ViewBag.Usuario=BD.GetUsuario(idUsuario);
            ViewBag.Ingredientes=BD.GetIngredientes();
            ViewBag.Unidad=BD.GetUnidad();
            List<Ingrediente> ingredientes = BD.GetIngredientes();
            return View(ingredientes);
        }

        public IActionResult Crear(int idUsuario)
        {
            ViewBag.Usuario=BD.GetUsuario(idUsuario);
            ViewBag.BarraBusqueda = true;
            ViewBag.Unidad=BD.GetUnidad();
            return View();
        }

        [HttpPost]
        public IActionResult Crear(Ingrediente ingrediente, int idUsuario)
        {
            if (ModelState.IsValid)
            {
                BD.InsertarIngrediente(ingrediente);
                return RedirectToAction(nameof(Index), new { idUsuario = idUsuario });
            }
            ViewBag.Usuario=BD.GetUsuario(idUsuario);
            ViewBag.BarraBusqueda = true;
            ViewBag.Unidad=BD.GetUnidad();
            return View(ingrediente);
        }

        public IActionResult Editar(int id, int idUsuario)
        {
            ViewBag.Usuario=BD.GetUsuario(idUsuario);
            ViewBag.BarraBusqueda = true;
            ViewBag.Unidad=BD.GetUnidad();
            Ingrediente ingrediente = BD.GetIngrediente(id);
            if (ingrediente == null)
            {
                return NotFound();
            }
            return View(ingrediente);
        }

        [HttpPost]
        public IActionResult Editar(Ingrediente ingrediente, int idUsuario)
        {
            if (ModelState.IsValid)
            {
                BD.ActualizarIngrediente(ingrediente);
                return RedirectToAction(nameof(Index), new { idUsuario = idUsuario});
            }
            ViewBag.Usuario=BD.GetUsuario(idUsuario);
            ViewBag.BarraBusqueda = true;
            ViewBag.Unidad=BD.GetUnidad();
            return View(ingrediente);
        }

      
            [HttpPost]
        public IActionResult Eliminar(int id, int idUsuario)
        {
            try
            {
                BD.EliminarIngrediente(id);
            }
            catch (Exception)
            {
                ViewBag.ErrorEliminar = "No se puede eliminar el ingrediente";
            }

            ViewBag.BarraBusqueda = true;

            // Obtén usuario y maneja posibles valores nulos.
            var usuario = BD.GetUsuario(idUsuario);
            if (usuario == null)
            {
                ViewBag.ErrorUsuario = "No se pudo encontrar el usuario.";
                return View("Error");
            }
            ViewBag.Usuario = usuario;

            // Obtén los ingredientes
            List<Ingrediente> ingredientes = BD.GetIngredientes() ?? new List<Ingrediente>();
            ViewBag.Ingredientes = ingredientes;

            // Construye la lista de unidades única basada en los ingredientes
            var unidades = new List<Unidad>();
            foreach (var ingrediente in ingredientes)
            {
                var unidad = BD.GetUnidad(ingrediente.idUnidad).FirstOrDefault(); // Obtenemos solo la primera coincidencia
                if (unidad != null && !unidades.Any(u => u.id == unidad.id)) // Evita duplicados
                {
                    unidades.Add(unidad);
                }
            }
            ViewBag.Unidad = unidades;

            return View("Index", ingredientes);
        }
    }
    }
