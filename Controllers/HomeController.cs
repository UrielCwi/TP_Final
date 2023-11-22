using Microsoft.AspNetCore.Mvc;
using TP_FINAL.Models;
namespace TP_FINAL.Controllers;

public class HomeController : Controller
{
    public IActionResult Index()
    {
        return View();
    }
    public IActionResult MandarRegistro()
    {
        return View("Registro");
    }
    public IActionResult MandarContraseña()
    {
        return View("RecuperarContraseña");
    }
    public IActionResult Login(string Usuario, string Contraseña)
    {
        ViewBag.Error = null;
        ViewBag.Usuario = BD.LoginUsuario(Usuario, Contraseña);
        if (ViewBag.Usuario == null)
        {
            ViewBag.Error = "Usuario o contraseña incorrectos";
            return View();
        }
        else
        {
            return RedirectToAction("Home", new{IdUsuario = ViewBag.Usuario.IdUsuario});
        }
    }
    public IActionResult Registro(Usuarios Usuario)
    {
        BD.RegistrarUsuario(Usuario);
        ViewBag.Usuario = BD.LoginUsuario(Usuario.Nombre, Usuario.Contraseña);
        return RedirectToAction("Home", new{IdUsuario = ViewBag.Usuario.IdUsuario});
    }
    public IActionResult RecuperarContraseña(string Usuario, string Contraseña, string NuevaContraseña)
    {
        BD.RecuperarContraseña(Usuario, Contraseña, NuevaContraseña);
        return RedirectToAction("Index");
    }
    public IActionResult Notificaciones(int IdUsuario)
    {
        ViewBag.Usuario = BD.GetUsuario(IdUsuario);
        ViewBag.Categoria = BD.GetCategorias(IdUsuario);        
        ViewBag.Tareas = BD.GetTareas(IdUsuario);
        return View("Notificaciones");
    }
    public IActionResult Tareas(int IdUsuario)
    {
        ViewBag.Usuario = BD.GetUsuario(IdUsuario);
        ViewBag.Categoria = BD.GetCategorias(IdUsuario);        
        ViewBag.Tareas = BD.GetTareas(IdUsuario);
        return View("Tareas");
    }
    public IActionResult Home(int IdUsuario)
    {
        ViewBag.Usuario = BD.GetUsuario(IdUsuario);
        ViewBag.Tareas = BD.GetTareas(IdUsuario);
        ViewBag.Categorias = BD.GetCategorias(IdUsuario);
        return View();
    }
    public IActionResult AgregarTarea (Tareas tarea)
    {
        BD.AgregarTarea(tarea);
        return RedirectToAction("Home");
    }
}

// Falta para el agregar tarea (Para el modal)