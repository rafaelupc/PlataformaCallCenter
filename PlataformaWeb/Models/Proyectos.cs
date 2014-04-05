using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PlataformaWeb.Dao;
using System.Data.Linq.SqlClient;

namespace PlataformaWeb.Models
{
    public class Proyectos
    {

        // ES LLAMADO DESDE LA CONTROLADORA
        public static List<TB_Proyecto> ListarProyectos(string Nombre = "", string Descripcion = "")
        {
            List<TB_Proyecto> list;
            using (var data = new DiagramaDataContext())
            {
                list = data.TB_Proyecto.Where(consulta => SqlMethods.Like(consulta.noProyecto, "%" + Nombre + "%") && SqlMethods.Like(consulta.deProyecto, "%" + Descripcion + "%")).ToList();
                foreach (var tbProyecto in list)
                {
                    tbProyecto.TB_Proyecto_ID = tbProyecto.TB_Proyecto_ID;
                }
            }
            return list;
        }

        // ES LLAMADO DESDE LA CONTROLADORA
        public static TB_Proyecto DetallarProyecto(string Identificador)
        {
            TB_Proyecto item;
            using (var data = new DiagramaDataContext())
            {
                item = data.TB_Proyecto.FirstOrDefault(pl => pl.TB_Proyecto_ID == Convert.ToInt32(Identificador));
                if (item != null)
                {
                    item.noProyecto = item.noProyecto;
                    item.deProyecto = item.deProyecto;
                    item.tiProyecto = item.tiProyecto;
                    item.stProyecto = item.stProyecto;
                }
            }
            return item;
        }

    }
}