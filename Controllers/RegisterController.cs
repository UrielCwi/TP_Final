using Microsoft.AspNetCore.Mvc;
using TP_FINAL.Models;
namespace TP_FINAL.Controllers
{
    public class RegisterController : Controller
        {
            public IActionResult Index()
            {
                ViewBag.BarraBusqueda = true;
                return View();
            }
            public IActionResult MandarContraseña(int idUsuario)
            {
                ViewBag.Usuario=BD.GetUsuario(idUsuario);
                ViewBag.BarraBusqueda = true;
                return View("RecuperarContraseña");
            }
        
            public IActionResult Registro(Usuario usuario)
        {
            Console.WriteLine(usuario.nombre);
            Console.WriteLine(usuario.apellido);
            Console.WriteLine(usuario.email);
            Console.WriteLine(usuario.contraseña);
            Console.WriteLine(usuario.empresa);
            Console.WriteLine("apodjasdlksajdjaslkdasjlkdjsalkdjaslkdjakldjaslkdjalksjdlksajdlsajdlasjlkdaslkdjaslkdksaldjlksadlkasdlksalkdaslkdjaslkdsalkdlksa");
            if (string.IsNullOrEmpty(usuario.email) || string.IsNullOrEmpty(usuario.contraseña))
            {
                ViewBag.Error = "Por favor, completa todos los campos.";
                return View("Index");
            }
            
            try
            {
                Console.WriteLine("Antes de chequear mail ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------");
                // Usuario existingUser = BD.GetUsuarioPorEmail(usuario.email);
                // if (existingUser != null)
                // {
                //     ViewBag.Error = "El correo electrónico ya está registrado.";
                //     return View("Index");
                // }
                Console.WriteLine("Antes de insertar usuario ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------");
                // Insertar nuevo usuario
                BD.InsertarUsuario(usuario.nombre, usuario.apellido, usuario.email, usuario.contraseña, usuario.empresa);
                Usuario loggedInUser = BD.LoginUsuario(usuario.email, usuario.contraseña);

                    return RedirectToAction("Index","Login");
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;
                return View("Index");
            }
        }
    }
}