<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="IndexAlumno.aspx.cs" Inherits="IndexAlumno" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titulo" Runat="Server">
    INICIO
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodydiv1" Runat="Server">
    <table>
            <tr>
                <td>
                    <asp:Label ID="lblNombreUsuario" runat="server" Text=""></asp:Label>
                </td>
                <td>
                </td>
                <td>
                </td>
                <td>
                </td>
                <td>
                    <asp:HyperLink ID="lblCerrarSesion" runat="server" Text="Cerrar Sesion" NavigateUrl="~/IndexAlumno.aspx?IdLogin=true"></asp:HyperLink>
                </td>
            </tr>
    </table>
</asp:Content>

