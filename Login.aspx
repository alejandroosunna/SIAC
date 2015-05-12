<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>

     <link rel="stylesheet" href="Themes/css/cssLogin.css" />
</head>
<body>
    <form id="frmLogin" runat="server">
    <div>
        <table>
            <tr>
                <td>
                    <asp:Label ID="lblNumControl" runat="server" Text="Num Control: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtNumControl" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblContraseña" runat ="server" Text ="Contraseña: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtContraseña" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btnLogin" runat="server" Text="Entrar" OnClick="btnLogin_Click"/>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblAlerta" runat="server" Text=""></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
