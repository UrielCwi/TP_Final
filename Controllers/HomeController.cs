using Microsoft.AspNetCore.Mvc;
using TP_FINAL_TOPODIARIO.Models;
namespace Topodiario.Controllers;

public class HomeController : Controller
{
    public IActionResult Index()
    {
        return View();
    }
    public IActionResult Login(string Nombre, string Contraseña)
    {
        ViewBag.Usuario = BD.LoginUsuario(Nombre, Contraseña);
        return View("Calendario");
    }
    public IActionResult Registro(Usuarios Usuario)
    {
        BD.RegistrarUsuario(Usuario);
        ViewBag.Usuario = BD.LoginUsuario(Usuario.Nombre, Usuario.Contraseña);
        return View("Calendario");
    }
}
