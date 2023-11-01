using Microsoft.AspNetCore.Mvc;
using TP_FINAL.Models;
namespace TP_FINAL.Controllers;

public class HomeController : Controller
{
    public IActionResult Index()
    {
        return View();
    }
    public IActionResult Login(string Nombre, string Contraseña)
    {
        ViewBag.Error = null;
        ViewBag.Usuario = BD.LoginUsuario(Nombre, Contraseña);
        if (ViewBag.Usuario == null)
        {
            ViewBag.Error = "Usuario o contraseña incorrectos";
            return View();
        }
        else
        {
            return View("Calendario");
        }
    }
    public IActionResult Registro(Usuarios Usuario)
    {
        BD.RegistrarUsuario(Usuario);
        ViewBag.Usuario = BD.LoginUsuario(Usuario.Nombre, Usuario.Contraseña);
        return View("Calendario");
    }
    public IActionResult Notificaciones()
    {
        return View("Notificaciones");
    }
    public IActionResult Home()
    {
        
    }
}
