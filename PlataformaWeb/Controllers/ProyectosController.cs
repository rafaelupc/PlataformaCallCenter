using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PlataformaWeb.Dao;
using PlataformaWeb.Models;

namespace PlataformaWeb.Controllers
{
    public class ProyectosController : Controller
    {

        // -----------------------------------------------------
        // --------------------- PROYECTOS ---------------------
        // -----------------------------------------------------
        // PROYECTOS: INTERFAZ PRINCIPAL
        public ActionResult AdministrarProyecto()
        {
            return PartialView();
        }

        // PROYECTOS: LISTADO DE PROYECTOS AL BUSCAR
        [HttpPost]
        public ActionResult ListarProyectos(string Nombre = "", string Descripcion = "")
        {
            // SE LLAMA AL MODELO
            List<TB_Proyecto> listaProyectos;
            listaProyectos = Proyectos.ListarProyectos(Nombre, Descripcion);
            ViewData["listaProyectos"] = listaProyectos;
        
            // SE LLAMADA A LA VISTA
            return View();
        }

        // PROYECTOS: FICHA DE PROYECTO (PARA AGREGAR Y MODIFICAR)
        public ActionResult FichaProyecto(string Identificador)
        {
            // SE LLAMA AL MODELO
            TB_Proyecto FichaProyecto;
            FichaProyecto = Proyectos.DetallarProyecto(Identificador);
            ViewData["DetalleProyecto"] = FichaProyecto;
            ViewData["Identificador"] = Identificador;
            
            // SE LLAMA A LA VISTA
            return View();
        }
        
        // -----------------------------------------------------



    }
}
