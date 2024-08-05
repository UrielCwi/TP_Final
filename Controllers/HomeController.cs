using Microsoft.AspNetCore.Mvc;
using TP_FINAL.Models;
namespace TP_FINAL.Controllers;

public class HomeController : Controller
{
    public IActionResult Index()
    {
        ViewBag.BarraBusqueda = false;
        return View();
    }
    /*public IActionResult Index(string errorMessage = null)
    {
        ViewBag.ErrorMessage = errorMessage;
        return View();
    }*/
    public IActionResult MandarRegistro(int idUsuario)
    {
        ViewBag.Usuario=BD.GetUsuario(idUsuario);
        ViewBag.BarraBusqueda = false;
        return View("Registro");
    }
    public IActionResult MandarContraseña(int idUsuario)
    {
        ViewBag.Usuario=BD.GetUsuario(idUsuario);
        ViewBag.BarraBusqueda = false;
        return View("RecuperarContraseña");
    }
    public IActionResult Login(string Usuario, string Contraseña)
    {
        ViewBag.BarraBusqueda = false;
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
    
    public IActionResult Calendario(int IdUsuario)
    {
        ViewBag.Usuario = BD.GetUsuario(IdUsuario);
        ViewBag.Categoria = BD.GetCategorias(IdUsuario);        
        ViewBag.Tareas = BD.GetTareas(IdUsuario);
        ViewBag.BarraBusqueda = false;
        return View("Calendario");
    }
    public IActionResult Tareas(int IdUsuario)
    {
        ViewBag.Usuario = BD.GetUsuario(IdUsuario);
        ViewBag.Categoria = BD.GetCategorias(IdUsuario);        
        ViewBag.Tareas = BD.GetTareas(IdUsuario);
        ViewBag.BarraBusqueda = false;
        return View("Tareas");
    }*/
    public IActionResult Home(int id, int idUsuario)
    {
        ViewBag.Usuario=BD.GetUsuario(idUsuario);
        //ViewBag.Tareas = BD.GetTareas(IdUsuario);
       ViewBag.Categorias = BD.GetCategorias(idUsuario);
        ViewBag.BarraBusqueda = true;
        return View();
    }
   /* public IActionResult AgregarTarea (Tareas tarea)
    {
        BD.AgregarTarea(tarea);
        return RedirectToAction("Home", new{IdUsuario = tarea.IdUsuario});
    }*/
     public IActionResult AgregarCategoria (Categorias Categoria)
    {
        BD.AgregarCategoria(Categoria);
        return RedirectToAction("Home", new{Id = Categoria.id});
    }
    /*public IActionResult EditarTarea (Tareas tarea)
    {
        BD.EditarTarea(tarea);
        return RedirectToAction("Home", new{IdUsuario = tarea.IdUsuario});
    }
    public Tareas VerDetalleTarea(int IdTarea)
    {
        return BD.VerDetalleTarea(IdTarea);
    }
    public IActionResult EliminarTarea(int IdTarea, int IdUsuario)
    {
        BD.BorrarTarea(IdTarea);
        return RedirectToAction("Home", new{IdUsuario = IdUsuario});
    }*/
    public IActionResult BuscarTareaPorNombre(string nombre, int idUsuario)
    {
        ViewBag.BarraBusqueda = false;
        ViewBag.Tareas = BD.GetPlato(idUsuario); 
        if (!string.IsNullOrEmpty(nombre))
        {
            ViewBag.Tareas = BD.BuscarPlatoPorNombre(idUsuario, nombre);
        }
        ViewBag.Categorias = BD.GetCategorias(idUsuario);
        ViewBag.Usuario = BD.GetUsuario(idUsuario);
        return View("Home");
    }
    /*public IActionResult MarcarCompletado(int IdUsuario, int IdTarea){
        BD.Hecho(IdTarea);
        return RedirectToAction("Home", new{IdUsuario = IdUsuario});
    }
    public List<Tareas> GetTareas(int IdUsuario){
        return BD.GetTareas(IdUsuario);
    }*/
}

