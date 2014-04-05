<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<%@ Import Namespace="PlataformaWeb.Dao" %>

<%
    var listaProyectos = ViewData["listaProyectos"] as List<TB_Proyecto>;
%>
<table>
    <thead>
        <th>
            Nombre
        </th>
        <th>
            Descripcion
        </th>
        <th>
            Tipo
        </th>
        <th>
            Estado
        </th>
        <th>
            Edición
        </th>
    </thead>

    <tbody>
        <% 
            foreach (var elemento in listaProyectos)
            {
        %>
        <tr>
            <td>
                <%= elemento.noProyecto %>
            </td>
            <td>
                <%= elemento.deProyecto %>
            </td>
            <td>
                <% if (elemento.tiProyecto == 1)
                   { %>
                INBOUND
                <% } %>
                <% else if (elemento.tiProyecto == 2)
                   { %>
                OUTBOUND
                <% } %>
                <% else
                   { %>
                NO DEFINIDO
                <% } %>
            </td>
            <td>
                <% if (elemento.stProyecto == 0)
                   { %>
                INACTIVO
                <% } %>
                <% else if (elemento.stProyecto == 1)
                   { %>
                ACTIVO
                <% } %>
                <% else
                   { %>
                NO DEFINIDO
                <% } %>
            </td>
            <td>
                <a href="#" class="linkModificar" data-codproyecto="<%= elemento.TB_Proyecto_ID %>">Modificar</a>
            </td>
        </tr>
        <%
            }
        %>
    </tbody>
</table>

<script type="text/javascript">

    // CLICK DEL BOTON MODIFICAR
    $(".linkModificar").click(function () {
        if (confirm("¿Desea modificar el Proyecto?")) {
            var codProyecto = $(this).attr("data-codproyecto");
            //llama a la funcion del formulario "AdministrarProyecto.aspx"
            CargarFichaProyecto(codProyecto); 
        }
        else {
            //alert("Operación cancelada");
        }
    });

</script>