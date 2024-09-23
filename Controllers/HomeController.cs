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
        return RedirectToAction("Home", new { idUsuario = usuario.id });
    }
}
    public IActionResult Registro(Usuario usuario)
{
    if (string.IsNullOrEmpty(usuario.email) || string.IsNullOrEmpty(usuario.contraseña))
    {
        ViewBag.Error = "Por favor, completa todos los campos.";
        return View("Registro");
    }
    
    try
    {
        
        Usuario existingUser = BD.GetUsuarioPorEmail(usuario.email);
        if (existingUser != null)
        {
            ViewBag.Error = "El correo electrónico ya está registrado.";
            return View("Registro");
        }

        // Insertar nuevo usuario
        BD.InsertarUsuario(usuario);
        Usuario loggedInUser = BD.LoginUsuario(usuario.email, usuario.contraseña);
        ViewBag.Usuario = loggedInUser;

        if (loggedInUser == null)
        {
            ViewBag.Error = "Error en el registro.";
            return View("Registro");
        }
        else
        {
            return RedirectToAction("Home", new { idUsuario = loggedInUser.id });
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

