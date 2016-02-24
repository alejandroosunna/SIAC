<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <meta charset="utf-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
        <title>SIAC</title>
        <meta name="description" content=""/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>

        <link rel="stylesheet" href="Themes/css/bootstrap.css"/>
        <link rel="stylesheet" href="Themes/css/main.css"/>
        <link rel="stylesheet" href="Fonts/font-awesome-4.3.0/css/font-awesome"/>
        
    	<link href="assets/css/font-awesome.min.css" rel="stylesheet" media="screen"/>
        <link href="assets/css/style.css" rel="stylesheet" media="screen"/> <!-- le meti esta hoja de estilos para que quedara mejor con las otras paginas-->
        <script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
</head>
    <body>
        <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
    <%--<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Sistemas de apartado de Citas</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <form class="navbar-form navbar-right" role="form" runat="server">
            <div class="form-group">
              <asp:TextBox id ="txtNumControl" runat ="server" placeholder="Numero de Control" CssClass="form-control"></asp:TextBox>
           
            </div>
            <div class="form-group">
              <asp:TextBox id ="txtContraseña" runat ="server" placeholder="Password" type="password" CssClass="form-control"></asp:TextBox>
          
            </div>
              <asp:Button ID ="btnLogin" runat="server" Text="Sign In" CssClass="btn btn-success" OnClick="btnLogin_Click"></asp:Button>
           
          </form>
        </div><!--/.navbar-collapse -->
      </div>
    </nav>--%> <!-- Esta es la navbar que estaba antes, descomentala si quieres regresarte-->
      
          <!---navbar 2    Si quieres el diseño anterior comenta esta barra y descomenta la de arriba            --->
    <nav class="navbar navbar-custom" role="navigation">

        <div class="container">

				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#custom-collapse">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">Sistema de Apartado de Citas</a>
				</div>
        
            <div id="navbar" class="navbar-collapse collapse navbar-right">
                <form class="navbar-form" role="form" runat="server">
                    <div>
                            <div class="form-group">
                              <asp:TextBox id ="txtNumControl" runat ="server" placeholder="Numero de Control" CssClass="form-control"></asp:TextBox>
                           
                            </div>
                            <div class="form-group">
                              <asp:TextBox id ="txtPassword" runat ="server" placeholder="Password" type="password" CssClass="form-control"></asp:TextBox>
                             
                            </div>
                              <asp:Button ID ="btnLogin" runat="server" Text="Sign In" CssClass="btn btn-success" OnClick="btnLogin_Click"></asp:Button> 
                     </div>
                </form>
            </div><!--/.navbar-collapse -->
        </div><!-- .container -->

    </nav>

         <!-- navbar2   -->

    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
      <li data-target="#carousel-example-generic" data-slide-to="1"></li>
      <li data-target="#carousel-example-generic" data-slide-to="2"></li>
    </ol>

  <!-- Wrapper for slides -->
      <div class="carousel-inner" role="listbox">
        <div class="item active" >
          <img  src="Img/Image1.1.fw.png" alt="1900x500&amp; text-Slide One" data-holder-rendered="true">
          <div class="carousel-caption">

          </div>
        </div>

        <div class="item" >
          <img  src="Img/Image2.2.png" alt="1900x500&amp; text-Slide One" data-holder-rendered="true"/>
          <div class="carousel-caption">

         
          </div>
        </div>

       <%-- <div class="item">
          <img  src="Img/Image3.png"alt="1900x500&amp;text-Slide Three" data-holder-rendered="true"/>
          <div class="carousel-caption">
                <h1>><font color="White">
                        Desarrolladores
                    </font></h1>
                <h3>ALejandro, Efren, Luis y Leonardo</h3>
          </div>
        </div>--%>
        ...
      </div>

  <!-- Controls -->
      <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
        <span class="fa fa-chevron-circle-left" style="margin-top:80%" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
        <span class="fa fa-chevron-circle-right" style="margin-top:80%" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>

    <div class="container">
      <!-- Example row of columns -->
      <div class="row">
        <div class="col-md-4">
          <h2>¿Qué es SIAC?</h2>
          <p>Es un Sistemas de apartado de Citas, para nuestro Instituto Técnologico de Hermosillo, desarrollado por alumnos de 6 semestres de Sistemas. </p>
        
        </div>
        <div class="col-md-4">
          <h2>Origen</h2>
          <p> La idea de desarrollar esta plataforma web, es principalmente para abastecer el problema que existe en los inicios de semestre al quedar incoformes en la selección de horarios y poder cambiarlos de una manera mas sencilla. </p>
    
       </div>
        <div class="col-md-4">
          <h2>Rápido, fácil y Sencillo</h2>
          <p>La manera de seleccionar una cita es muy fácil solo ingresa y podras ver un video informativo de como usar esta plataforma.</p>
          
        </div>
      </div>

      <hr>

      <footer>
        <p>&copy; Company 2015</p>
      </footer>
    </div> <!-- /container -->        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery.js"><\/script>')</script>

        <script src="JS/vendor/bootstrap.min.js"></script>

        <script src="JS/main.js"></script>

        <!-- Google Analytics: change UA-XXXXX-X to be your site's ID. -->
        <script>
            (function (b, o, i, l, e, r) {
                b.GoogleAnalyticsObject = l; b[l] || (b[l] =
                function () { (b[l].q = b[l].q || []).push(arguments) }); b[l].l = +new Date;
                e = o.createElement(i); r = o.getElementsByTagName(i)[0];
                e.src = '//www.google-analytics.com/analytics.js';
                r.parentNode.insertBefore(e, r)
            }(window, document, 'script', 'ga'));
            ga('create', 'UA-XXXXX-X', 'auto'); ga('send', 'pageview');
        </script>
    </body>
</html>
