using Microsoft.AspNetCore.Mvc;

namespace Topodiario.Controllers;

public class HomeController : Controller
{
    public IActionResult Index()
    {
        return View();
    }
}
