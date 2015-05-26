<%@ Page Language="C#" AutoEventWireup="true" CodeFile="IndexAlumno.aspx.cs" Inherits="IndexAlumno" %>

<!DOCTYPE html>
<html lang="en">

<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Perfil de usuario</title>
     <!-- Bootstrap Core CSS -->
    <link href="Themes/css/bootstrap.min.css" rel="stylesheet">

    <link href="Themes/css/full-slider.css" rel="stylesheet">

</head>

<body>

        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#" >Perfil</a>

                        <div class="media" style="margin-top:10%">
                          <div class="media-left">
                            <a href="#">
                              <img class="media-object" src="Themes/icoper.png" alt="usuario"  WIDTH="30" HEIGHT="30" >
                            </a>
                         </div>
                     </div>
                    
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                         <p class="navbar-text">Usuario: <asp:Label ID="lblNombreUsuario" runat="server" Text=""></asp:Label></p> 
                         <p class="navbar-text">Numero de control: <asp:Label ID="numControl" runat="server" Text=""></asp:Label></p> 
                        <li data-target="#myCarousel" data-slide-to="0" >
                            <a href="#">Enblanco</a>
                        </li>
                        <li data-target="#myCarousel" data-slide-to="1">
                            <a href="#">Horarios</a>
                        </li>
                        <li data-target="#myCarousel" data-slide-to="2">
                            <a href="#">Citas</a>
                        </li>
                        <li style="margin-left:400px;"><asp:HyperLink ID="lblCerrarSesion" runat="server" Text="Cerrar Sesion" NavigateUrl="~/IndexAlumno.aspx?IdLogin=true"></asp:HyperLink></li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container -->
        </nav>
     <!-- Full Page Image Background Carousel Header -->
            <header id="myCarousel" class="carousel slide">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                </ol>

                <!-- Wrapper for Slides -->
                <div class="carousel-inner">
                    <div class="item active">
                        <!-- Set the first background image using inline CSS below. -->
                        <div class="fill" style="background-color: red;">                     
                        </div>
                        <div class="carousel-caption">

                            <div class="panel panel-default" style="display:inline-block; background-color:#000; margin-bottom:200px;margin-top:50px;">
                                <div class="panel-heading">Panel heading without title</div>
                              <div class="panel-body" >
                                Aqui puedes poner una biblia si quieres si no no me importa haz lo que se quieras alv  Aqui puedes poner una biblia si quieres si no no me importa haz lo que se quieras alv  Aqui puedes poner una biblia si quieres si no no me importa haz lo que se quieras alvqui puedes poner una biblia si quieres si no no me importa haz lo que se quieras alv  Aqui puedes poner una biblia si quieres si no no me importa haz lo que se quieras alv  Aqui puedes poner una biblia si quieres si no no me importa haz lo que se quieras alvqui puedes poner una biblia si quieres si no no me importa haz
                              </div>
                            </div>
                        
                        </div>
                    </div>

                    <div class="item">
                        <!-- Set the second background image using inline CSS below. -->
                        <div class="fill" style="background-color: blue;"></div>
                        <div class="carousel-caption">
                            <h2>Horarios</h2>
                        </div>
                    </div>

                    <div class="item">
                        <!-- Set the third background image using inline CSS below. -->
                        <div class="fill" style="background-color: green;"></div>
                        <div class="carousel-caption">
                            <h2>Citas</h2>
                        </div>
                    </div>
                </div>

                <!-- Controls -->
                <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                    <span class="icon-prev"></span>
                </a>
                <a class="right carousel-control" href="#myCarousel" data-slide="next">
                    <span class="icon-next"></span>
                </a>

            </header>


  
  <!-- jQuery -->
    <script src="JS/vendor/jquery-1.11.2.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="JS/vendor/bootstrap.min.js"></script>

    <!-- Script to Activate the Carousel -->
    <script>
        $('.carousel').carousel({
            interval: false //changes the speed
        })
    </script>


</body>

</html>
