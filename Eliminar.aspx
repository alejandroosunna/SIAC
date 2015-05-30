<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Eliminar.aspx.cs" Inherits="Eliminar" %>

<!DOCTYPE html>

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
font-size: 16px;"><asp:HyperLink ID="lbl_CerrarSesionAdmin" runat="server" NavigateUrl="~/" class="btn btn-danger square-btn-adjust">Salir</asp:HyperLink></div> <!-- control asp para cerrar sesion -->
        </nav>   <!-- navbar  -->
           <!-- /. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
				<li class="text-center">
                    <img src="asse/img/find_user.png" class="user-image img-responsive"/>
					</li>
				
					
                    <li>
                        <a class="active-menu"  href="IndexAdmin.aspx"><i class="fa fa-dashboard fa-3x"></i>Resumen</a>
                    </li>
                     
					                   
                    <li>
                        <a href="#"><i class="fa fa-sitemap fa-3x"></i>Alumnos<span class="fa arrow"></span></a>
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
                     <h2>Eliminar</h2>   
                    </div>
                </div>              
                 <!-- /. ROW  -->
                  <hr />
            
                 <!-- /. ROW  -->
                 <div class="row" >
                    <div class="col-md-9 col-sm-12 col-xs-12">
               
                    <div class="panel panel-default">
                        <div class="panel-heading">
                          Listado de citas pendientes
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <h1>Aqui ira un control de asp para mostrar las citas</h1>
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
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
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
</html>