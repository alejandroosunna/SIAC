<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Agregar.aspx.cs" Inherits="Agregar" %>

<%--<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Administrador</title>
	<!-- BOOTSTRAP STYLES-->
    <link href="asse/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="asse/css/font-awesome.css" rel="stylesheet" />
     <!-- MORRIS CHART STYLES-->
    <link href="asse/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="asse/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>
<body>
    <form id="form1" runat="server">
    <div id="wrapper">
        
        <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Administrador</a> 
            </div>
  <div style="color: white;
padding: 15px 50px 5px 50px;
float: right;
font-size: 16px;"><asp:Button ID="btnSalir" runat="server" Text="Salir" CssClass="btn btn-danger square-btn-adjust" OnClick="btnSalir_Click" /></div> <!-- control asp para cerrar sesion -->
        </nav>   <!-- navbar  -->
           <!-- /. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
				<li class="text-center">
                    <img src="asse/img/find_user.png" class="user-image img-responsive"/>
					</li>
				
					 <li>
                        <a class="active-menu"  href="IndexAdmin.aspx"><i class="fa fa-table fa-3x"></i>Resumen</a>
                    </li>
                     
					                   
                    <li>
                        <a href="#"><i class="fa fa-user fa-3x"></i>Alumnos<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="Agregar.aspx">Agregar</a>
                            </li>
                            <li>
                                <a href="Eliminar.aspx">Eliminar<span class="fa arrow"></span></a>
                            </li>
                          
                        </ul>
                      </li>  
                  
                  
                </ul>
               
            </div>
            
        </nav>   
         <!-- /. NAV SIDE  -->
        <div id="page-wrapper" style="min-height:530px;" >
            <div id="page-inner" style="min-height:530px;">
                <div class="row">
                    <div class="col-md-12">
                     <h2>Agregar</h2>   
                    </div>
                </div>              
                 <!-- /. ROW  -->
                  <hr />
            
                 <!-- /. ROW  -->
                 <div class="row" >
                    <div class="col-md-3 col-sm-3 col-xs-7 col-md-offset-4">
               
                    <div class="panel panel-default">
                        <div class="panel-heading">
                          Alumno
                        </div>
                        <div class="panel-body" >
                            <div class="table-responsive" style="margin-left:5%">

                                <asp:TextBox ID="txtNombre" runat="server" placeholder="Nombre"></asp:TextBox>
                                <br />
                                <br />
                                <asp:TextBox ID="txtApellidoPaterno" runat="server" placeholder="Apellido Paterno"></asp:TextBox>
                                <br />
                                <br />
                                <asp:TextBox ID="txtApellidoMaterno" runat="server" placeholder="Apellido Materno"></asp:TextBox>
                                <br />
                                <br />
                                <asp:TextBox ID="txtNumControl" runat="server" placeholder="Numero de Control" OnTextChanged="txtNumControl_TextChanged" AutoPostBack="True"></asp:TextBox>
                                <br />
                                <br />
                                <asp:TextBox ID="txtContraseña" runat="server" placeholder="Contraseña"></asp:TextBox>
                                <br />
                                
                               <div style="margin-left:20%;margin-top:3%;"> <asp:Button class="btn btn-primary btn-lg" ID="btnAgregar" runat="server" Text="Agregar" OnClick="btnAgregar_Click"  /> </div>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>
                 <!-- /. ROW  -->
                

    </div>
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
        </div>
     <!-- /. WRAPPER  -->
   
          <!-- JQUERY SCRIPTS -->
    <script src="asse/js/jquery-1.10.2.js"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="asse/js/bootstrap.min.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="asse/js/jquery.metisMenu.js"></script>
     <!-- MORRIS CHART SCRIPTS -->
     <script src="asse/js/morris/raphael-2.1.0.min.js"></script>
    <script src="asse/js/morris/morris.js"></script>
      <!-- CUSTOM SCRIPTS -->
    <script src="asse/js/custom.js"></script>
   
    </form>
</body>
</html>--%>



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
            <li class="mdl-menu__item">About</li>
            <li class="mdl-menu__item">Contact</li>
            <li class="mdl-menu__item">Legal information</li>
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
                          Alumno
                        </div>
                        <div class="panel-body" >
                            <div class="table-responsive" style="margin-left:5%">

                                <asp:TextBox ID="txtNombre" runat="server" placeholder="Nombre"></asp:TextBox>
                                <br />
                                <br />
                                <asp:TextBox ID="txtApellidoPaterno" runat="server" placeholder="Apellido Paterno"></asp:TextBox>
                                <br />
                                <br />
                                <asp:TextBox ID="txtApellidoMaterno" runat="server" placeholder="Apellido Materno"></asp:TextBox>
                                <br />
                                <br />
                                <asp:TextBox ID="txtNumControl" runat="server" placeholder="Numero de Control" OnTextChanged="txtNumControl_TextChanged" AutoPostBack="True"></asp:TextBox>
                                <br />
                                <br />
                                <asp:TextBox ID="txtContraseña" runat="server" placeholder="Contraseña"></asp:TextBox>
                                <br />
                                
                               <div style="margin-left:20%;margin-top:3%;"> <asp:Button class="btn btn-primary btn-lg" ID="btnAgregar" runat="server" Text="Agregar" OnClick="btnAgregar_Click"  /> </div>
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