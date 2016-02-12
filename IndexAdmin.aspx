﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="IndexAdmin.aspx.cs" Inherits="IndexAdmin"  EnableEventValidation="false"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Administrador</title>
	<!-- Materialize CSS -->
	<link href="materialize/css/materialize.css" rel="stylesheet" media="screen"/>
     <!-- FONTAWESOME STYLES-->
    <link href="asse/css/font-awesome.css" rel="stylesheet" />
  
     <script src="materialize/js/materialize.js" ></script>     
	<!-- Custom styles CSS -->
	<link href="assets/css/style.css" rel="stylesheet" media="screen"/>
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <script>
        $(document).ready(function () {
            $('.scrollspy').scrollSpy();
        });

    </script>
</head>
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
                            </div>
                           
                        </div>

                        
                        <asp:Button class="waves-effect waves-light btn-large" ID="btnNuevaCita" runat="server" Text="Nueva Cita" OnClick="btnNuevaCita_Click"/> 
                    
                    </div>
                    <%--<div class="col-md-3 col-sm-12 col-xs-12">
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
                    </div>--%>
                    
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
</html>
