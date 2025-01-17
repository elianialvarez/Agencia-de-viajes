using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using ASP2024.Models;

namespace ASP2024.Controllers;

public class HomeController : Controller
{
    private readonly IConfiguration configuration;
    private readonly ICiudadRepository ciudadesRepository;
    private readonly ICompaniaRepository companiaRepository;
    private readonly ILogger<HomeController> _logger;
    
    public HomeController(ILogger<HomeController> logger, IConfiguration configuration, ICiudadRepository ciudadesRepository, ICompaniaRepository companiaRepository)
    {
    _logger = logger;
    this.companiaRepository = companiaRepository;
    this.configuration = configuration;
    this.ciudadesRepository = ciudadesRepository;
    }

    public async Task<IActionResult> Index()
    {
    IEnumerable<Ciudad> ciudades = await ciudadesRepository.listarCiudades();
    return View("Index",ciudades);
    }

    public IActionResult Compania(){
        Compania compania = new Compania();
        return View("InsertarCompania", compania);
    }
    [HttpPost]
    public async Task<IActionResult> AñadirCompania(Compania compania)
{
    if (!ModelState.IsValid)
    {
        return View("InsertarCompania", compania);
    }

    try
    {
        await companiaRepository.InsertarCompania(compania);
        return View("Exito");
    }
    catch (Exception e)
    {
        return View("InsertarCompania", compania);
    }
}

    public IActionResult Privacy()
    {
        return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }

    
}