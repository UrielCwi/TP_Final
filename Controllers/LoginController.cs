using Microsoft.AspNetCore.Mvc;
using TP_FINAL.Models;
namespace TP_FINAL.Controllers
{
    public class LoginController : Controller
        {
            public IActionResult Index()
            {
                return View();
            }
            public IActionResult Login(string Usuario, string Contraseña)
            {
                ViewBag.BarraBusqueda = true;
                ViewBag.Error = null;

                if (string.IsNullOrEmpty(Usuario) || string.IsNullOrEmpty(Contraseña))
                {
                    ViewBag.Error = "Por favor, completa todos los campos.";
                    return View("Index");
                }

                Usuario usuario = BD.LoginUsuario(Usuario, Contraseña);
                ViewBag.Usuario = usuario;
                List<Plato> platos = BD.GetPlatos();
                ViewBag.Plato = platos;

                if (usuario == null)
                {
                    ViewBag.Error = "Usuario o contraseña incorrectos.";
                    return View("Index");
                }
                else
                {
                    return RedirectToAction("Home","Home", new { idUsuario = usuario.id });
                }
            }
        }
}