<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<%@ Import Namespace="PlataformaWeb.Dao" %>
<%
    // RECEPCION DE VALORES
    var DetalleProyecto = ViewData["DetalleProyecto"] as TB_Proyecto;
    var Identificador = ViewData["Identificador"] as string;
%>
    
<%
    // TITULO
    if (Identificador == "0")
    {
    %> <h2>Agregar Proyecto</h2> <%
}
    else
    {
    %> <h2>Modificar Proyecto</h2> <%
    }
%>

<fieldset class="fieldset">
    <legend>Información del Proyecto</legend>
    &nbsp;
    <div id="divProyecto">
        <table>
            <tr>
                <td>
                    Nombre
                </td>
                <td>
                    <input type="text" id="txtNombre" value="<%: Identificador=="0" ? "" : DetalleProyecto.noProyecto %>" />
                </td>
            </tr>
            <tr>
                <td>
                    Descripción
                </td>
                <td>
                    <input type="text" id="txtDescripcion" value="<%: Identificador=="0" ? "" : DetalleProyecto.deProyecto %>" />
                </td>
            </tr>
            <tr>
                <td>
                    Tipo
                </td>
                <td>
                    <input type="text" id="txtTipo" value="" />
                </td>
            </tr>
            <tr>
                <td>
                    Estado
                </td>
                <td>
                    <input type="text" id="txtEstado" value="" />
                </td>
            </tr>
            <tr>
                <td>
                    Ficha
                </td>
                <td>
                    <input type="text" id="txtFicha" value="" />
                </td>
            </tr>
            <tr>
                <td>
                    Selección
                </td>
                <td>
                    <input type="text" id="txtSelección" value="" />
                </td>
            </tr>
        </table>
    </div>

    <br />
    <table id="tblBotones" style="width:100%;">
        <tr style="border:0px;">
            <td style="width: 50%; border:0px;">
                <%
                    if (Identificador == "0")
                    {
                    %>
                        <input type="button" id="btnGuardarNuevo" value="Guardar" />
                    <%
                    } 
                    else
                    {
                    %> 
                        <input type="button" id="btnGuardarAntiguo" value="Guardar" />
                        <input type="button" id="btnContactos" value="Adm. Contactos" />
                        <input type="button" id="btnAgentes" value="Adm. Agentes" />
                    <%
                }
                %>
            </td>
            <td align="right" style="width: 50%; border:0px">
                            <input type="button" id="btnRegresar" value="Regresar" style="width: 65px" />
            </td>
        </tr>
    </table>

</fieldset>

<script type="text/javascript">

    // CLICK DEL BOTON SALIR
    $('#btnRegresar').click(function () {
        window.location.href = '/Proyectos/AdministrarProyecto';
    });

</script>

