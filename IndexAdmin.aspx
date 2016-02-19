<%@ Page Language="C#" AutoEventWireup="true" CodeFile="IndexAdmin.aspx.cs" Inherits="IndexAdmin"  EnableEventValidation="false"%>

<!DOCTYPE html>



<!--
  Material Design Lite
  Copyright 2015 Google Inc. All rights reserved.

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

      https://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License
-->
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
<%--    <link rel="stylesheet" href="NavBar.css">--%>
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
<%--            <label class="mdl-button mdl-js-button mdl-button--icon" for="search">
              <i class="material-icons">search</i>
            </label>
            <div class="mdl-textfield__expandable-holder">
              <input class="mdl-textfield__input" type="text" id="search">
              <label class="mdl-textfield__label" for="search">Enter your query...</label>
            </div>
          </div>--%>
          <button class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon" id="hdrbtn">
            <i class="material-icons">more_vert</i>
          </button>
          <ul class="mdl-menu mdl-js-menu mdl-js-ripple-effect mdl-menu--bottom-right" for="hdrbtn">
            <li class="mdl-menu__item">Infrormacion</li>
          </ul>
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
<%--         <div class="demo-avatar-dropdown">
          <span class="mdl-layout-title">
             <span>Menu</span>
          </span>
            <div class="mdl-layout-spacer"></div>
            <button id="menuAlumno" class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon">
              <i class="material-icons" role="presentation">arrow_drop_down</i>
              <span class="visuallyhidden">Accounts</span>
            </button>
            <ul class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect" for="menuAlumno">
             <li class="mdl-menu__item "><a href="Agregar.aspx">Agregar</a></li>
            <li class="mdl-menu__item"><a href="Eliminar.aspx">Eliminar</a></li>
            </ul>
          </div>--%>
        </nav>
      </div>
      <main class="mdl-layout__content mdl-color--grey-100">
        <div class="mdl-grid demo-content">
          <div class="demo-graphs mdl-shadow--2dp mdl-color--white mdl-cell mdl-cell--12-col">
          <%--  <svg fill="currentColor" viewBox="0 0 500 250" class="demo-graph">
              <use xlink:href="#chart">
            </svg>
            <svg fill="currentColor" viewBox="0 0 500 250" class="demo-graph">
              <use xlink:href="#chart">
            </svg>--%>
              <form id="form1" runat="server">

                    
                        <div class="panel-heading section scrollspy">
                          Listado de citas pendientes
                        </div>
                        <div class="panel-body pre-scrollable">
                            <table  class="mdl-data-table mdl-js-data-table mdl-shadow--2dp">
                                <asp:GridView ID="GridView_Citas" class="table bordered " runat="server" AutoGenerateColumns="False" DataKeyNames="NumeroCita" DataSourceID="SqlDataSource" OnRowCommand="GridView_Citas_RowCommand" OnSelectedIndexChanged="GridView_Citas_SelectedIndexChanged">
                                    <Columns>
                                        <asp:BoundField DataField="NumeroCita" HeaderText="NumeroCita" InsertVisible="False" ReadOnly="True" SortExpression="NumeroCita" />
                                        <asp:BoundField DataField="Hora" HeaderText="Hora" SortExpression="Hora" />
                                        <asp:BoundField DataField="Dia" HeaderText="Dia" SortExpression="Dia" />
                                        <asp:BoundField DataField="FechaAgendada" HeaderText="FechaAgendada" SortExpression="FechaAgendada" />
                                        <asp:BoundField DataField="Comentario" HeaderText="Comentario" SortExpression="Comentario" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Button ID="btnEliminar" Text="Eliminiar" runat="server"
                                                    CommandName="DeleteRow"
                                                    CommandArgument="<%# ( (GridViewRow) Container).Cells[0].Text %>"/>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:dbControlDeCitas %>" SelectCommand="SELECT IdCita AS NumeroCita, Hora, FORMAT([Dia], 'dd/MM/yyyy', 'en-US') AS Dia, FechaAgendada, Comentario FROM tbCitas " ProviderName="<%$ ConnectionStrings:dbControlDeCitas.ProviderName %>">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="n" Name="Disponible" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </table>
                        </div>
                        <asp:Button class="waves-effect waves-light btn-large mdl-color--orange" ID="btnNuevaCita" runat="server" Text="Nueva Cita" OnClick="btnNuevaCita_Click"/> 

          </form>
        </div>
<%--                      <div class="demo-cards mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet mdl-grid mdl-grid--no-spacing">
            <div class="demo-updates mdl-card mdl-shadow--2dp mdl-cell mdl-cell--4-col mdl-cell--4-col-tablet mdl-cell--12-col-desktop">
              <div class="mdl-card__title mdl-card--expand mdl-color--teal-300">
                <h2 class="mdl-card__title-text">Updates</h2>
              </div>
              <div class="mdl-card__supporting-text mdl-color-text--grey-600">
                Non dolore elit adipisicing ea reprehenderit consectetur culpa.
              </div>
              <div class="mdl-card__actions mdl-card--border">
                <a href="#" class="mdl-button mdl-js-button mdl-js-ripple-effect">Read More</a>
              </div>
            </div>
            <div class="demo-separator mdl-cell--2-col"></div>
            <div class="demo-options mdl-card mdl-color--deep-purple-500 mdl-shadow--2dp mdl-cell mdl-cell--4-col mdl-cell--3-col-tablet mdl-cell--12-col-desktop">
              <div class="mdl-card__supporting-text mdl-color-text--blue-grey-50">
                <h3>View options</h3>
                <ul>
                  <li>
                    <label for="chkbox1" class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect">
                      <input type="checkbox" id="chkbox1" class="mdl-checkbox__input">
                      <span class="mdl-checkbox__label">Click per object</span>
                    </label>
                  </li>
                  <li>
                    <label for="chkbox2" class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect">
                      <input type="checkbox" id="chkbox2" class="mdl-checkbox__input">
                      <span class="mdl-checkbox__label">Views per object</span>
                    </label>
                  </li>
                  <li>
                    <label for="chkbox3" class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect">
                      <input type="checkbox" id="chkbox3" class="mdl-checkbox__input">
                      <span class="mdl-checkbox__label">Objects selected</span>
                    </label>
                  </li>
                  <li>
                    <label for="chkbox4" class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect">
                      <input type="checkbox" id="chkbox4" class="mdl-checkbox__input">
                      <span class="mdl-checkbox__label">Objects viewed</span>
                    </label>
                  </li>
                </ul>
              </div>
              <div class="mdl-card__actions mdl-card--border">
                <a href="#" class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-color-text--blue-grey-50">Change location</a>
                <div class="mdl-layout-spacer"></div>
                <i class="material-icons">location_on</i>
              </div>
            </div>
          </div>--%>

       </div>
      </main>
    </div>
      <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" style="position: fixed; left: -1000px; height: -1000px;">
        <defs>
          <mask id="piemask" maskContentUnits="objectBoundingBox">
            <circle cx=0.5 cy=0.5 r=0.49 fill="white">
            <circle cx=0.5 cy=0.5 r=0.40 fill="black">
          </mask>
          <g id="piechart">
            <circle cx=0.5 cy=0.5 r=0.5>
            <path d="M 0.5 0.5 0.5 0 A 0.5 0.5 0 0 1 0.95 0.28 z" stroke="none" fill="rgba(255, 255, 255, 0.75)">
          </g>
        </defs>
      </svg>
      <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 500 250" style="position: fixed; left: -1000px; height: -1000px;">
        <defs>
          <g id="chart">
            <g id="Gridlines">
              <line fill="#888888" stroke="#888888" stroke-miterlimit="10" x1="0" y1="27.3" x2="468.3" y2="27.3">
              <line fill="#888888" stroke="#888888" stroke-miterlimit="10" x1="0" y1="66.7" x2="468.3" y2="66.7">
              <line fill="#888888" stroke="#888888" stroke-miterlimit="10" x1="0" y1="105.3" x2="468.3" y2="105.3">
              <line fill="#888888" stroke="#888888" stroke-miterlimit="10" x1="0" y1="144.7" x2="468.3" y2="144.7">
              <line fill="#888888" stroke="#888888" stroke-miterlimit="10" x1="0" y1="184.3" x2="468.3" y2="184.3">
            </g>
            <g id="Numbers">
              <text transform="matrix(1 0 0 1 485 29.3333)" fill="#888888" font-family="'Roboto'" font-size="9">500</text>
              <text transform="matrix(1 0 0 1 485 69)" fill="#888888" font-family="'Roboto'" font-size="9">400</text>
              <text transform="matrix(1 0 0 1 485 109.3333)" fill="#888888" font-family="'Roboto'" font-size="9">300</text>
              <text transform="matrix(1 0 0 1 485 149)" fill="#888888" font-family="'Roboto'" font-size="9">200</text>
              <text transform="matrix(1 0 0 1 485 188.3333)" fill="#888888" font-family="'Roboto'" font-size="9">100</text>
              <text transform="matrix(1 0 0 1 0 249.0003)" fill="#888888" font-family="'Roboto'" font-size="9">1</text>
              <text transform="matrix(1 0 0 1 78 249.0003)" fill="#888888" font-family="'Roboto'" font-size="9">2</text>
              <text transform="matrix(1 0 0 1 154.6667 249.0003)" fill="#888888" font-family="'Roboto'" font-size="9">3</text>
              <text transform="matrix(1 0 0 1 232.1667 249.0003)" fill="#888888" font-family="'Roboto'" font-size="9">4</text>
              <text transform="matrix(1 0 0 1 309 249.0003)" fill="#888888" font-family="'Roboto'" font-size="9">5</text>
              <text transform="matrix(1 0 0 1 386.6667 249.0003)" fill="#888888" font-family="'Roboto'" font-size="9">6</text>
              <text transform="matrix(1 0 0 1 464.3333 249.0003)" fill="#888888" font-family="'Roboto'" font-size="9">7</text>
            </g>
            <g id="Layer_5">
              <polygon opacity="0.36" stroke-miterlimit="10" points="0,223.3 48,138.5 154.7,169 211,88.5
              294.5,80.5 380,165.2 437,75.5 469.5,223.3 	">
            </g>
            <g id="Layer_4">
              <polygon stroke-miterlimit="10" points="469.3,222.7 1,222.7 48.7,166.7 155.7,188.3 212,132.7
              296.7,128 380.7,184.3 436.7,125 	">
            </g>
          </g>
        </defs>
      </svg>
      <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" style="position: fixed; left: -1000px; height: -1000px;">
        <defs>
          <mask id="piemask" maskContentUnits="objectBoundingBox">
            <circle cx=0.5 cy=0.5 r=0.49 fill="white" />
            <circle cx=0.5 cy=0.5 r=0.40 fill="black" />
          </mask>
          <g id="piechart">
            <circle cx=0.5 cy=0.5 r=0.5 />
            <path d="M 0.5 0.5 0.5 0 A 0.5 0.5 0 0 1 0.95 0.28 z" stroke="none" fill="rgba(255, 255, 255, 0.75)" />
          </g>
        </defs>
      </svg>
      <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 500 250" style="position: fixed; left: -1000px; height: -1000px;">
        <defs>
          <g id="chart">
            <g id="Gridlines">
              <line fill="#888888" stroke="#888888" stroke-miterlimit="10" x1="0" y1="27.3" x2="468.3" y2="27.3" />
              <line fill="#888888" stroke="#888888" stroke-miterlimit="10" x1="0" y1="66.7" x2="468.3" y2="66.7" />
              <line fill="#888888" stroke="#888888" stroke-miterlimit="10" x1="0" y1="105.3" x2="468.3" y2="105.3" />
              <line fill="#888888" stroke="#888888" stroke-miterlimit="10" x1="0" y1="144.7" x2="468.3" y2="144.7" />
              <line fill="#888888" stroke="#888888" stroke-miterlimit="10" x1="0" y1="184.3" x2="468.3" y2="184.3" />
            </g>
            <g id="Numbers">
              <text transform="matrix(1 0 0 1 485 29.3333)" fill="#888888" font-family="'Roboto'" font-size="9">500</text>
              <text transform="matrix(1 0 0 1 485 69)" fill="#888888" font-family="'Roboto'" font-size="9">400</text>
              <text transform="matrix(1 0 0 1 485 109.3333)" fill="#888888" font-family="'Roboto'" font-size="9">300</text>
              <text transform="matrix(1 0 0 1 485 149)" fill="#888888" font-family="'Roboto'" font-size="9">200</text>
              <text transform="matrix(1 0 0 1 485 188.3333)" fill="#888888" font-family="'Roboto'" font-size="9">100</text>
              <text transform="matrix(1 0 0 1 0 249.0003)" fill="#888888" font-family="'Roboto'" font-size="9">1</text>
              <text transform="matrix(1 0 0 1 78 249.0003)" fill="#888888" font-family="'Roboto'" font-size="9">2</text>
              <text transform="matrix(1 0 0 1 154.6667 249.0003)" fill="#888888" font-family="'Roboto'" font-size="9">3</text>
              <text transform="matrix(1 0 0 1 232.1667 249.0003)" fill="#888888" font-family="'Roboto'" font-size="9">4</text>
              <text transform="matrix(1 0 0 1 309 249.0003)" fill="#888888" font-family="'Roboto'" font-size="9">5</text>
              <text transform="matrix(1 0 0 1 386.6667 249.0003)" fill="#888888" font-family="'Roboto'" font-size="9">6</text>
              <text transform="matrix(1 0 0 1 464.3333 249.0003)" fill="#888888" font-family="'Roboto'" font-size="9">7</text>
            </g>
            <g id="Layer_5">
              <polygon opacity="0.36" stroke-miterlimit="10" points="0,223.3 48,138.5 154.7,169 211,88.5
              294.5,80.5 380,165.2 437,75.5 469.5,223.3 	"/>
            </g>
            <g id="Layer_4">
              <polygon stroke-miterlimit="10" points="469.3,222.7 1,222.7 48.7,166.7 155.7,188.3 212,132.7
              296.7,128 380.7,184.3 436.7,125 	"/>
            </g>
          </g>
        </defs>
      </svg>
     <script src="../../material.min.js"></script> <!-- Importante-->

  </body>
</html>





<%--<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<%--    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Administrador</title>
	<!-- Materialize CSS -->
	<link href="materialize/css/materialize.css" rel="stylesheet" media="screen"/>--%>

    <!--Aqui-->
<%--     <!-- FONTAWESOME STYLES-->
    <link href="asse/css/font-awesome.css" rel="stylesheet" />
  
     <script src="materialize/js/materialize.js" ></script>     
	<!-- Custom styles CSS -->
	<link href="assets/css/style.css" rel="stylesheet" media="screen"/>
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />--%>
    <script>
        $(document).ready(function () {
            $('.scrollspy').scrollSpy();
        });

    </script>
<%--</head>
<body data-spy="scroll">
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
                    font-size: 16px;">
                  <asp:Button ID="btnSalir" runat="server" Text="Salir" CssClass="btn btn-danger square-btn-adjust" OnClick="btnSalir_Click" /><!-- control asp para cerrar sesion -->
                  </div>    
        </nav>   <!-- navbar  -->
           <!-- /. NAV TOP <a href="#" class="btn btn-danger square-btn-adjust">Salir</a> -->
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
            
        </nav>     <!-- vertical navbar  -->
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" style="min-height:530px;" >
            <div id="page-inner" style="min-height:530px;">
                <div class="row">
                    <div class="col-md-12">
                     <h2>Citas Pendientes</h2>   
                        <h5>
                            <asp:Label ID="lblNombre" runat="server" Text=""></asp:Label>
                        </h5>
                    </div>
                </div>              
                 <!-- /. ROW  -->
                  <hr />
            
                 <!-- /. ROW  -->
                 <div class="row" >
                    <div class="col s12 m9 l10">
               
                  
                        <div class="panel-heading section scrollspy">
                          Listado de citas pendientes
                        </div>
                        <div class="panel-body pre-scrollable">
                            <div class="table-responsive section scrollspy">
                                <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:dbProyectoCoordinacion %>" SelectCommand="SELECT [IdCita], [IdUsuario], [FechaAgendada], [FechaDisponible], [Estado], [Comentario] FROM [tbCitas] ORDER BY [FechaDisponible]" OnSelecting="SqlDataSource_Selecting">
                                </asp:SqlDataSource>
                            </div>
                           
                        </div>

                        
                        <asp:Button class="waves-effect waves-light btn-large" ID="btnNuevaCita" runat="server" Text="Nueva Cita" OnClick="btnNuevaCita_Click"/> 
                    
                    </div>
                    <div class="col-md-3 col-sm-12 col-xs-12">
  <div class="panel panel-primary text-center no-boder bg-color-green">
                        <div class="panel-body">
                            <i class="fa fa-comments-o fa-5x"></i>
                            <h4>200 New Comments </h4>
                             <h4>See All Comments  </h4>
                        </div>
                        <div class="panel-footer back-footer-green">
                             <i class="fa fa-rocket fa-5x"></i>
                            Lorem ipsum dolor sit amet sit sit, consectetur adipiscing elitsit sit gthn ipsum dolor sit amet ipsum dolor sit amet
                            
                        </div>
                    </div>
                    </div>
                    
                                <asp:GridView ID="GridView_Citas" class="table bordered " runat="server" AutoGenerateColumns="False" DataKeyNames="IdCita" DataSourceID="SqlDataSource" OnRowCommand="GridView_Citas_RowCommand" OnSelectedIndexChanged="GridView_Citas_SelectedIndexChanged" AllowPaging="True">
                                    <Columns>
                                        <asp:BoundField DataField="IdCita" HeaderText="IdCita" InsertVisible="False" ReadOnly="True" SortExpression="IdCita" />
                                        <asp:BoundField DataField="IdUsuario" HeaderText="IdUsuario" SortExpression="IdUsuario" />
                                        <asp:BoundField DataField="FechaAgendada" HeaderText="FechaAgendada" SortExpression="FechaAgendada" />
                                        <asp:BoundField DataField="FechaDisponible" HeaderText="FechaDisponible" SortExpression="FechaDisponible" />
                                        <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" />
                                        <asp:BoundField DataField="Comentario" HeaderText="Comentario" SortExpression="Comentario" />
                                    </Columns>
                                </asp:GridView>
                    
                </div>
                 <!-- /. ROW  -->
                

    </div>
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
        </div>
     <!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->


<!-- Aqui-->
    <script src="asse/js/jquery-1.10.2.js">

    </script>
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
