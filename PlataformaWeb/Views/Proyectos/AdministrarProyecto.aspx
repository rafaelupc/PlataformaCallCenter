<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Plataforma WEB
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

    <h2>Administrar Proyecto</h2>

    <fieldset class="fieldset">
        <legend>Filtro de búsqueda</legend>
        &nbsp;
        <div id="divBusqueda">
            <table>
                <tr>
                    <td>
                        Nombre
                    </td>
                    <td>
                        <input type="text" id="txtNombre" value="" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        Descripción
                    </td>
                    <td>
                        <input type="text" id="txtDescripcion" value="" />
                    </td>
                    <td>
                        <input type="button" id="btnBuscar" value="Buscar" /></td>
                </tr>
            </table>
        </div>
    </fieldset>
        
    <fieldset class="fieldset">
        <legend>Listado de resultados</legend>
        <br />

        <!-- DIV ASIGNADO PARA EL LISTADO -->
        <div id="divListado">
        </div>
        <!---------------------------------->

        <br />
        <table id="tblBotones" style="width:100%;">
            <tr style="border:0px;">
                <td style="width: 50%; border:0px;">
                                <input type="button" id="btnAgregar" value="Agregar" /></td>
                <td align="right" style="width: 50%; border:0px">
                                <input type="button" id="btnSalir" value="Salir" style="width: 65px" /></td>
            </tr>
        </table>
    </fieldset>

    <script type="text/javascript">

        // CLICK DEL BOTON BUSCAR
        $('#btnBuscar').click(function () {
            CargarListaProyectos($("#txtNombre").val(), $("#txtDescripcion").val());
        });
        // SE LLAMA A LA CONTROLADORA
        function CargarListaProyectos(Nombre, Descripcion) {
            var Valido = true;
            if (Valido) {
                $.ajax({
                    async: false,
                    url: "ListarProyectos",
                    type: 'POST',
                    data: { Nombre: Nombre, Descripcion: Descripcion },
                    success: function (data) {
                        $("#main").find("#divListado").html('');
                        $("#main").find("#divListado").html(data);
                    }
                });
            }
        }

        // CLICK DEL BOTON AGREGAR
        $('#btnAgregar').click(function () {
            CargarFichaProyecto("0");
        });
        // SE LLAMA A LA CONTROLADORA
        function CargarFichaProyecto(Identificador) {
            $.ajax({
                url: "FichaProyecto",
                type: 'POST',
                data: { Identificador: Identificador },
                success: function (data) {
                    $("#main").html('');
                    $("#main").html(data);
                }
            });
        }

        // CLICK DEL BOTON SALIR
        $('#btnSalir').click(function () {
            window.location.href = '/Home/Index';
        });

    </script>

</asp:Content>
