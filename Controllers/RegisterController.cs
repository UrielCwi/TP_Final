using Microsoft.AspNetCore.Mvc;
using TP_FINAL.Models;
namespace TP_FINAL.Controllers
{
    public class RegisterController : Controller
        {
            public IActionResult MandarRegistro(int idUsuario)
            {
                ViewBag.Usuario=BD.GetUsuario(idUsuario);
                ViewBag.BarraBusqueda = true;
                return RedirectToAction("Index","Login");
            }
            public IActionResult MandarContraseña(int idUsuario)
            {
                ViewBag.Usuario=BD.GetUsuario(idUsuario);
                ViewBag.BarraBusqueda = true;
                return View("RecuperarContraseña");
            }
        
            public IActionResult Registro(Usuario usuario)
        {
            if (string.IsNullOrEmpty(usuario.email) || string.IsNullOrEmpty(usuario.contraseña))
            {
                ViewBag.Error = "Por favor, completa todos los campos.";
                return View("Index");
            }
            
            try
            {
                
                Usuario existingUser = BD.GetUsuarioPorEmail(usuario.email);
                if (existingUser != null)
                {
                    ViewBag.Error = "El correo electrónico ya está registrado.";
                    return View("Index");
                }

                // Insertar nuevo usuario
                BD.InsertarUsuario(usuario);
                Usuario loggedInUser = BD.LoginUsuario(usuario.email, usuario.contraseña);
                ViewBag.Usuario = loggedInUser;

                if (loggedInUser == null)
                {
                    ViewBag.Error = "Error en el registro.";
                    return View("Index");
                }
                else
                {
                    return RedirectToAction("Index","Login", new { idUsuario = loggedInUser.id });
                }
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;
                return View("Index");
            }
        }
    }
}