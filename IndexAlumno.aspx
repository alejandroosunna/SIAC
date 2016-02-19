<%@ Page Language="C#" AutoEventWireup="true" CodeFile="IndexAlumno.aspx.cs" Inherits="IndexAlumno" EnableEventValidation="false" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
    
	<title>SIAC</title>
   
      <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"/>
      <!--Import materialize.css-->
<%--      <link type="text/css" rel="stylesheet" href="materialize/css/materialize.min.css"  media="screen,projection"/>--%>
    <link rel="stylesheet" href="material.min.css"/>
    <link href="materialize/css/materialize.css" rel="stylesheet" media="screen"/>
      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<!-- Materialize CSS -->
       
  
    
</head>
<body class=" green lighten-4">
    <%--<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="materialize/js/materialize.min.js"></script>
    <script type="text/javascript" language="javascript">// <![CDATA[
        $(document).ready(function(){
           
            $('.button-collapse').sideNav({
                menuWidth: 300, // Default is 240
                edge: 'right', // Choose the horizontal origin
                closeOnClick: true // Closes side-nav on <a> clicks, useful for Angular/Meteor
            }
 );
        });
 
   </script>--%>
  
   
   
	<!-- Preloader -->

	<div id="preloader">
		<div id="status"></div>
	</div>

	<header class="header">
        <div class="navbar-fixed orange darken-1">
		<nav>
				<div class="nav-wrapper orange darken-1">
                    <a href="#!" class="brand-logo">Logo</a>
                    <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
                    <ul class="right hide-on-med-and-down">
                        <li><a href="#home">Inicio</a></li>
					    <li><a href="#Resumen">Principal</a></li>
                        <li><a href="#Horarios">Horarios</a></li>
					    <li><a href="#Citas">Citas</a></li>
					    <li><a href="#Contacto">Contacto</a></li>
                        <li><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/IndexAlumno.aspx?IdLogin=true">Cerrar sesion</asp:HyperLink></li>
                    </ul>
             	
				    <ul  class="side-nav" id="mobile-demo">
					    <li><a href="#home">Inicio</a></li>
					    <li><a href="#Resumen">Principal</a></li>
                        <li><a href="#Horarios">Horarios</a></li>
					    <li><a href="#Citas">Citas</a></li>
					    <li><a href="#Contacto">Contacto</a></li>
                        <li><asp:HyperLink ID="lbl_CerrarSesion" runat="server" NavigateUrl="~/IndexAlumno.aspx?IdLogin=true">Cerrar sesion</asp:HyperLink></li>
				    </ul>
				</div>
		</nav>
 </div>
	</header>

	<!-- Navigation end -->

    <!-- Resumen -->
 <form id="form1" runat="server" class="container center-block">
	<section id="Resumen" class="centered green lighten-3 z-depth-3 center-block">
			<div class="row">

				<div class="col-sm-6 col-sm-offset-3">
                    
					<div class="pfblock-header wow fadeInUp center">
						<h2 class="pfblock-title">Usuario</h2>
						<div class="pfblock-line"></div>
						<div class="pfblock-subtitle">
                            
						</div>
					</div>

				</div>

			</div>

			<div class="row" >
	
                <div class="col l6 hide-on-med-and-down">
                    <div class="card green">
                    <div class="card-content white-text">
                        <asp:Label ID="lblNombre" runat="server" Text=""></asp:Label>
                        <br />
                        <asp:Label ID="lblNumControl" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="card-action">
                        <a href="#">This is a link</a>
                        <a href="#">This is a link</a>
                    </div>
                    </div>
                </div>
                 
                    <div class="col s12 m12 l6">
                      <div class="card green">
                        <div class="card-content white-text">
                            <span class="fa fa-calendar"></span>
                         <asp:Label ID="lblPDiaCita" runat="server" Text=""></asp:Label>
                                <br />
                                <asp:Label ID="lblPHoraCita" runat="server" Text=""></asp:Label>
                                <br />
                                <asp:Button ID="btnEliminarCita" runat="server" Text="Eliminar" Visible="false" OnClick="btnEliminarCita_Click"/>
                        </div>
                        <div class="card-action">
                          <a href="#">This is a link</a>
                          <a href="#">This is a link</a>
                        </div>
                      </div>
                    </div>
                <br />
		</div>
		
	</section>

	<!-- Resumen end -->
    


	<!-- Citas start -->

	<section id="Citas" class="">
           
            <div class="container">
				<div class="col s12 centered">
					<div class="pfblock-header wow fadeInUp ajax-response pre-scrollable">

					<div class="pfblock-header wow fadeInUp ajax-response center-align">
						<h2 class="pfblock-title">Citas</h2>
                        <div class="row">
                            <div class="section scrollspy">
                             <!-- GRIDVIEW START -->
                        <asp:GridView ID="GridViewCitas" runat="server" DataKeyNames="NumeroCita" AutoGenerateColumns="false" CssClass="centered mdl-layout__header--scroll table media-list fa-border table-bordered table-responsive table-condensed caption ajax-response wow bounce responsive-table" BorderStyle="None" OnSelectedIndexChanged="GridViewCitas_SelectedIndexChanged">
                            <Columns>
                                <asp:TemplateField HeaderText="Seleccionar"> 
                                    <ItemTemplate>
                                        <asp:Button ID="btnSeleccionar" Text="Seleccionar!!" runat="server"
                                            CommandName="SelectRow" CssClass="btn-link navbar-btn"
                                            CommandArgument="<%# ( (GridViewRow) Container).Cells[0].Text %>"/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField ShowSelectButton="true" ButtonType="Link" HeaderText="Seleccionar" />
                                <asp:BoundField DataField="NumeroCita" HeaderText="NumeroCita" ReadOnly="True" 
                                    SortExpression="NumeroCita" />
                                <asp:BoundField DataField="Hora" HeaderText="Hora" 
                                    SortExpression="Hora" />
                                <asp:BoundField DataField="Dia" HeaderText="Dia" 
                                    SortExpression="Dia" />
                            </Columns>
                        </asp:GridView>
                        <!-- GRIDVIEW END -->
                        </div><!-- GRIDVIEW START -->
                        </div>                      
                       
						
					</div>
  </div>
			</div><!-- .row -->

            <%--<div class="row">

               

            </div><!-- .row -->--%>

		</div><!-- .row -->
	</section>

	<!-- Citas end -->


	<!-- Contacto start -->

	<section id="Contacto" class="center-align center-block centered">
		<div class="container center-block">
			<div class="row centered">
                <h4 class="center-align">Contacto</h4>
							<div class="white-text  col s12 m6 l6">
								<label class="sr-only" for="c_name">Name</label>
                                <asp:TextBox ID="txtName" placeholder = "Nombre" CssClass="green-text" runat="server"></asp:TextBox>
								<%--<input type="text" id="c_name" class="form-control" name="c_name" placeholder="Name">--%>
							</div>

							<div class="white-text col s12 m6 l6" data-wow-delay=".1s">
								<label class="sr-only" for="c_email">Email</label>
                                <asp:TextBox ID="txtEmail" placeholder = "E-mail" CssClass="green-text" runat="server"  ></asp:TextBox>
								<%--<input type="email" id="c_email" class="form-control" name="c_email" placeholder="E-mail">--%>
							</div>

							<div class="white-text col s12 m6 l6 center" data-wow-delay=".2s">
                                <asp:TextBox ID="txtMesg" placeholder = "Mensaje" CssClass="green-text" runat="server" Rows="10" TextMode="MultiLine" ></asp:TextBox>
								<%--<textarea class="form-control" id="c_message" name="c_message" rows="7" placeholder="Message"></textarea>--%>
							</div>
                            <div class="center-align center container center-block col s12 m6 l6">
                                <asp:Button id="btnSend" type="submit" CssClass=" btn-block btn center" data-wow-delay=".3s" runat="server" Text="Enviar Mensaje" OnClick="btnSend_Click"></asp:Button>
							<%--<button type="submit" class="btn btn-lg btn-block wow fadeInUp" data-wow-delay=".3s">Send Message</button>--%>
                            <br />
                            </div>

			</div><!-- .row -->
		</div><!-- .container -->
	</section>

	<!-- Contacto end -->

	<!-- Footer start -->

	<footer id="footer">
		<div class="container green lighten-4">
			<div class="row">

				<div class="col-sm-12">

					<ul class="social-links">
						<li><a href="index.html#" class="wow fadeInUp"><i class="fa fa-facebook"></i></a></li>
						<li><a href="index.html#" class="wow fadeInUp" data-wow-delay=".1s"><i class="fa fa-twitter"></i></a></li>
						<li><a href="index.html#" class="wow fadeInUp" data-wow-delay=".2s"><i class="fa fa-google-plus"></i></a></li>
						<li><a href="index.html#" class="wow fadeInUp" data-wow-delay=".4s"><i class="fa fa-pinterest"></i></a></li>
						<li><a href="index.html#" class="wow fadeInUp" data-wow-delay=".5s"><i class="fa fa-envelope"></i></a></li>
					</ul>

					<p class="heart">
                        <span class="fa fa-thumbs-o-up fa-3x animated tada"style="color:#e81d1d;"></span> 
                    </p>                <%--Modificado--%>
                    <p class="copyright"">
                        © 2015  <a href="ith.mx"style="color:#e81d1d;">ITH</a>
					</p>            <%--Modificado--%>

				</div>

			</div><!-- .row -->
		</div><!-- .container -->
	</footer>

	<!-- Footer end -->

	<!-- Scroll to top -->

	<div class="scroll-up">
		<a href="#home"><i class="fa fa-angle-up"></i></a>
	</div>
    </form>

  


    

   
    
</body>
</html>
