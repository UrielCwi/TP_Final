using Microsoft.AspNetCore.Mvc;
using TP_FINAL.Models;
namespace TP_FINAL.Controllers;

public class HomeController : Controller
{
    public IActionResult Index()
    {
        ViewBag.BarraBusqueda = true;
        return View("Index");
    }
    public IActionResult MandarRegistro(int idUsuario)
    {
        ViewBag.Usuario=BD.GetUsuario(idUsuario);
        ViewBag.BarraBusqueda = true;
        return View("Registro");
    }
    public IActionResult MandarContraseña(int idUsuario)
    {
        ViewBag.Usuario=BD.GetUsuario(idUsuario);
        ViewBag.BarraBusqueda = true;
        return View("RecuperarContraseña");
    }
    public IActionResult Login(string Usuario, string Contraseña)
    {
        ViewBag.BarraBusqueda = true;
        ViewBag.Error = null;
        ViewBag.Usuario = BD.LoginUsuario(Usuario, Contraseña);
        ViewBag.Plato=BD.GetPlatos();
        if (ViewBag.Usuario == null)
        {
            ViewBag.Error = "Usuario o contraseña incorrectos";
            return View("Index");
        }
        else
        {
            return View("Home");
        }
    }
    public IActionResult Registro(Usuario usuario)
        {
            try
            {
                BD.InsertarUsuario(usuario);
                ViewBag.Usuario = BD.LoginUsuario(usuario.email, usuario.contraseña);

                if (ViewBag.Usuario == null)
                {
                    ViewBag.Error = "Error en el registro.";
                    return View("Registro");
                }
                else
                {
                    return RedirectToAction("Home", new { IdUsuario = ViewBag.Usuario.id });
                }
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;
                return View("Registro");
            }
        }
        
   /*public IActionResult RecuperarContraseña(string Usuario, string Codigo, string NuevaContraseña)
    {
        BD.RecuperarContraseña(Usuario, Codigo, NuevaContraseña);
        return RedirectToAction("Index");
    }
  */
    public IActionResult Home(int idUsuario, Ingrediente ingrediente)
    {
        ViewBag.Usuario = BD.GetUsuario(idUsuario);
        ViewBag.Categorias = BD.GetCategorias(idUsuario);
        ViewBag.Plato= BD.GetPlatos();
        ViewBag.BarraBusqueda = true; 
        return View();
    }
 
     public IActionResult AgregarCategoria (Categorias Categoria)
    {
        ViewBag.BarraBusqueda = true; 
        BD.AgregarCategoria(Categoria);
        return RedirectToAction("Home", new{Id = Categoria.id});
    }
    /*
    public Tareas VerDetalleTarea(int IdTarea)
    {
        return BD.VerDetalleTarea(IdTarea);
    }
    public IActionResult MarcarCompletado(int IdUsuario, int IdTarea){
        BD.Hecho(IdTarea);
        return RedirectToAction("Home", new{IdUsuario = IdUsuario});
    }
   */
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
            return View("Home");
        }
}

