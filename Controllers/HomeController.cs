using Microsoft.AspNetCore.Mvc;
using TP_FINAL.Models;
namespace TP_FINAL.Controllers;

public class HomeController : Controller
{
   
    public IActionResult Home(int idUsuario)
    {
        ViewBag.Usuario = BD.GetUsuario(idUsuario);
        ViewBag.Categorias = BD.GetCategorias(idUsuario);
        ViewBag.Plato= BD.GetPlatos();
        ViewBag.BarraBusqueda = true; 
        return View("Index");
    }
 
     public IActionResult AgregarCategoria (Categorias Categoria)
    {
        ViewBag.BarraBusqueda = true; 
        BD.AgregarCategoria(Categoria);
        return RedirectToAction("Index", new{Id = Categoria.id});
    }
    public IActionResult BuscarPlatoPorNombre(string nombre, int idUsuario)
        {
            ViewBag.BarraBusqueda = true;
            ViewBag.Plato = BD.GetPlato(idUsuario); 
            if (!string.IsNullOrEmpty(nombre))
            {
                ViewBag.Plato = BD.BuscarPlatoPorNombre (nombre);
            }
            else{
                ViewBag.ErrorMessage="El campo esta vacio";
            }
            ViewBag.Usuario = BD.GetUsuario(idUsuario);
            return View("Index");
        }
}

