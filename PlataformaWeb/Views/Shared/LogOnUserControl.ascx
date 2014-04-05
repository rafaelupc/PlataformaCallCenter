<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%
    if (Request.IsAuthenticated) {
%>
        Welcome <strong><%: Page.User.Identity.Name %></strong>!
        [ <%: Html.ActionLink("Salir", "LogOff", "Account") %> ]
<%
    }
    else {
%> 
        [ <%: Html.ActionLink("Ingresar", "LogOn", "Account") %> ]
<%
    }
%>
