<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AgregarCita.aspx.cs" Inherits="AgregarCita" %>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="A front-end template that helps you build fast, modern mobile web apps.">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Administrador</title>



    <!-- Tile icon for Win8 (144x144 + tile color) -->
    <meta name="msapplication-TileImage" content="images/touch/ms-touch-icon-144x144-precomposed.png">
    <meta name="msapplication-TileColor" content="#3372DF">

    <link rel="shortcut icon" href="images/favicon.png">

    <!-- SEO: If your mobile URL is different from the desktop URL, add a canonical link to the desktop page https://developers.google.com/webmasters/smartphone-sites/feature-phones -->
    <!--
    <link rel="canonical" href="http://www.example.com/">
    -->

    <link href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="material.min.css">
    <link rel="stylesheet" href="NavBar.css">
    <link rel="stylesheet" href="materialize/css/styles.css">
     <link href="materialize/css/materialize.css" rel="stylesheet" media="screen"/>
    <style>
    #view-source {
      position: fixed;
      display: block;
      right: 0;
      bottom: 0;
      margin-right: 40px;
      margin-bottom: 40px;
      z-index: 900;
    }
    </style>
  </head>
  <body>
     <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
     <script type="text/javascript" src="materialize/js/materialize.min.js"></script>
     <script type="text/javascript" language="javascript">// <![CDATA[
        $(document).ready(function(){
           
            $('.datepicker').pickadate({
                selectMonths: true, // Creates a dropdown to control month
                selectYears: 15 // Creates a dropdown of 15 years to control year
            });
        });
 
   </script> 
    <div class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">
      <header class="demo-header mdl-layout__header mdl-color--orange mdl-color-text--grey-600">
        <div class="mdl-layout__header-row">
          <span class="mdl-layout-title mdl-color-text--white">
                    <asp:Label ID="lblNombre" runat="server" Text=""></asp:Label>
          </span>
          <div class="mdl-layout-spacer"></div>
          <div class="mdl-textfield mdl-js-textfield mdl-textfield--expandable">
          <button class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon" id="hdrbtn">
            <i class="material-icons">more_vert</i>
          </button>
          <ul class="mdl-menu mdl-js-menu mdl-js-ripple-effect mdl-menu--bottom-right" for="hdrbtn">
             <li class="mdl-menu__item"><asp:HyperLink ID="lbl_CerrarSesion" runat="server" NavigateUrl="~/IndexAdmin.aspx?IdLogin=true">Cerrar sesion</asp:HyperLink></li>
          </ul>
        </div>
       </div>
      </header>
      <div class="demo-drawer mdl-layout__drawer mdl-color--green mdl-color-text--blue-grey-50">
        <header class="demo-drawer-header">
          <img src="Ithlogo.png" class="demo-avatar">
          <div class="demo-avatar-dropdown">
          <span class="mdl-layout-title">
             <span>Menu</span>
          </span>
            <div class="mdl-layout-spacer"></div>
            <button id="accbtn" class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon">
              <i class="material-icons" role="presentation">arrow_drop_down</i>
              <span class="visuallyhidden">Accounts</span>
            </button>
            <ul class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect" for="accbtn">
              <li class="mdl-menu__item">hello@example.com</li>
              <li class="mdl-menu__item">info@example.com</li>
              <li class="mdl-menu__item"><i class="material-icons">add</i>Add another account...</li>
            </ul>
          </div>
        </header>
        <nav class="demo-navigation mdl-navigation mdl-color--white">
          <a class="mdl-navigation__link" href="IndexAdmin.aspx"><i class="mdl-color-text--black material-icons" role="presentation">home</i>Resumen</a>
          <a class="mdl-navigation__link" href="Agregar.aspx"><i class="mdl-color-text--black material-icons" role="presentation">inbox</i>Agregar</a>
          <a class="mdl-navigation__link" href="Eliminar.aspx"><i class="mdl-color-text--black material-icons" role="presentation">delete</i>Eliminar</a>
          <a class="mdl-navigation__link" id="menuAlumno"><i class="mdl-color-text--black material-icons" role="presentation">more_vert</i>Alumnos</a>  
          <ul class="mdl-menu mdl-menu--bottom-left mdl-js-menu mdl-js-ripple-effect mdl-color--orange" for="menuAlumno">
            <li class="mdl-menu__item "><a href="Agregar.aspx">Agregar</a></li>
            <li class="mdl-menu__item"><a href="Eliminar.aspx">Eliminar</a></li>
          </ul>
        </nav>
      </div>
      <main class="mdl-layout__content mdl-color--grey-100">
        <div class="mdl-grid demo-content">
          <div class="demo-graphs mdl-shadow--2dp mdl-color--white mdl-cell mdl-cell--12-col">
              <form id="form1" runat="server">
    <div class="panel panel-default">
                        <div class="panel-heading">
                          Agregar cita
                        </div>
                        <div class="panel-body" style="margin-left:15%">
                            <div class="table-responsive">
                                    <asp:Calendar ID="calenDia" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="341px">
                                    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                                    <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                                    <OtherMonthDayStyle ForeColor="#999999" />
                                    <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                    <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                                    <TodayDayStyle BackColor="#CCCCCC" />
                                </asp:Calendar>
                                <br />
                                
                                 <div class="input-field col s6">
                                  <asp:TextBox ID="txtHora" runat="server" placeholder="Hora hh:mm" MaxLength="5" TextMode="Number"></asp:TextBox>
                                </div>
                                <br />
                                <asp:Button ID="btnAgregarCita" class="waves-effect waves-light btn orange" runat="server" Text="Agregar Cita" OnClick="btnAgregarCita_Click" />
                            </div>
                        </div>
                    </div>
                  
                 <!-- /. ROW  -->
                <div class="container" >               
                    <div class="panel panel-default">
                        <div class="panel-heading center">
                            Generar multiples citas
                        </div>
                        <div class="panel-body" style="margin-left:15%">
                            <div class="table-responsive">
                                <div class="input-field col s6">
                                    <asp:Label ID="Label1" for="txtDias" runat="server">Dias</asp:Label>
                                    <asp:TextBox ID="txtDias" runat="server" TextMode="Number"></asp:TextBox>
                                    
                                </div>
                                
                            <div class="table-responsive">
                                <asp:Label ID="Label3" runat="server" Text="Hora Inicio"></asp:Label>
                                
                                <asp:TextBox ID="txtHora0" runat="server" placeholder="Hora hh:mm" MaxLength="5" TextMode="Number"></asp:TextBox>
                                
                                <asp:Label ID="Label4" runat="server" Text="Hora Fin"></asp:Label>
                                
                                <asp:TextBox ID="txtHora1" runat="server" placeholder="Hora hh:mm" MaxLength="5" TextMode="Number"></asp:TextBox>
                                <asp:Label ID="Label5" runat="server" Text="Intervalo"></asp:Label>
                                <asp:TextBox ID="txtIntervalo" runat="server" placeholder="Hora hh:mm" MaxLength="2" TextMode="Number">15</asp:TextBox>
                                
                                <asp:Button ID="btnGenerarCitas" class="waves-effect waves-light btn" runat="server" Text="Generar Citas" OnClick="btnGenerarCitas_Click" />
                                <br />
                                
                            </div>
                            </div>
                        </div>
                        </div>
                     </div>
          </form>
        </div>
       </div>
      </main>
    </div>
   <script src="../../material.min.js"></script> <!-- Importante-->

  </body>
</html>