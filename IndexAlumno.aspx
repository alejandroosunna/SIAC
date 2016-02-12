<%@ Page Language="C#" AutoEventWireup="true" CodeFile="IndexAlumno.aspx.cs" Inherits="IndexAlumno" EnableEventValidation="false" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
    
	<title>SIAC</title>

	<!-- CSS -->
	<link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen"/>
	<link href="assets/css/font-awesome.min.css" rel="stylesheet" media="screen"/>
	<link href="assets/css/simple-line-icons.css" rel="stylesheet" media="screen"/>
	<link href="assets/css/animate.css" rel="stylesheet"/>
    
	<!-- Custom styles CSS -->
	<link href="assets/css/style.css" rel="stylesheet" media="screen"/>
    
    <script src="assets/js/modernizr.custom.js"></script>     
</head>
<body>
    <form id="form1" runat="server">
   
	<!-- Preloader -->

	<div id="preloader">
		<div id="status"></div>
	</div>

	<!-- Home start -->

	<section id="home" class="pfblock-image screen-height">
        <div class="home-overlay"></div>
		<div class="intro">
			<div class="start">Sistema de apartado de citas</div>
			<h1>SIAC</h1>
			<div class="start">Rápido, fácil y sencillo...</div>
		</div>

        <a href="#Resumen">
		<div class="scroll-down">
            <span >
                <i class="fa fa-angle-down fa-2x"></i>
            </span>
		</div>
        </a>

	</section>

	<!-- Home end -->

	<!-- Navigation start -->

	<header class="header">

		<nav class="navbar navbar-custom" role="navigation">

			<div class="container">

				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#custom-collapse">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">Bienvenido</a>
				</div>

				<div class="collapse navbar-collapse" id="custom-collapse">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#home">Inicio</a></li>
						<li><a href="#Resumen">Principal</a></li>
                        <li><a href="#Horarios">Horarios</a></li>
						<li><a href="#Citas">Citas</a></li>
						<li><a href="#Contacto">Contacto</a></li>
                        <li><asp:HyperLink ID="lbl_CerrarSesion" runat="server" NavigateUrl="~/IndexAlumno.aspx?IdLogin=true">Cerrar sesion</asp:HyperLink></li>
					</ul>
				</div>

			</div><!-- .container -->

		</nav>

	</header>

	<!-- Navigation end -->

    <!-- Resumen -->

	<section id="Resumen" class="pfblock pfblock-gray">
	    <div class="container">
			<div class="row">

				<div class="col-sm-6 col-sm-offset-3">
                    
					<div class="pfblock-header wow fadeInUp">
						<h2 class="pfblock-title">Usuario</h2>
						<div class="pfblock-line"></div>
						<div class="pfblock-subtitle">
                            
						</div>
					</div>

				</div>

			</div>

			<div class="row" >

		

				<div class="col-sm-6">

					<div class="iconbox wow slideInRight">
						<div class="iconbox-icon">
							<span class="fa fa-user"></span>
						</div>
						<div class="iconbox-text">
							<h3 class="iconbox-title">Datos del usuario</h3>
                            <!--
                                Aqui van los controles de ASP

                                ......................................................................................................
                                -->
							<div class="iconbox-desc">
                                <asp:Label ID="lblNombre" runat="server" Text=""></asp:Label>
                                <br />
                                <asp:Label ID="lblNumControl" runat="server" Text=""></asp:Label>
							</div>
						</div>
					</div>

				</div>

                <div class="col-sm-6" >

					<div class="iconbox wow slideInLeft" >
						<div class="iconbox-icon">
							<span class="fa fa-calendar"></span>
						</div>
						<div class="iconbox-text">
							<h3 class="iconbox-title">Pendientes</h3>
                              <!--
                                Aqui van los controles de ASP

                                ......................................................................................................
                                -->
							<div class="iconbox-desc">
                                <asp:Label ID="lblPDiaCita" runat="server" Text=""></asp:Label>
                                <br />
                                <asp:Label ID="lblPHoraCita" runat="server" Text=""></asp:Label>
                                <br />
                                <asp:Button ID="btnEliminarCita" runat="server" Text="Eliminar" Visible="false" OnClick="btnEliminarCita_Click"/>
							</div>
						</div>
					</div>

				</div>
		</div>
	    </div>
		
	</section>

	<!-- Resumen end -->
    
	<!-- Horarios start -->

	<section id="Horarios" class="pfblock">
		<div class="container">
			
            <div class="row">

				<div class="col-sm-6 col-sm-offset-3">

					<div class="pfblock-header wow fadeInUp">
						<h2 class="pfblock-title">Horarios</h2>
						<div class="pfblock-line"></div>
						<div class="pfblock-subtitle">
						</div>
					</div>

				</div>

			</div><!-- .row -->
            
            
            <div class="row" >
   
                <div class="col-sm-7 col-sm-offset-1"  style="margin-top:-50px">

					<div class="iconbox wow zoomInUp"data-wow-duration="1s" style="background-color:#949494;">
						<div class="iconbox-icon" style="margin-top:-20px">
							<span class="fa fa-file-text-o wow shake"></span>
						</div>
						<div class="iconbox-text" style="margin-top:-20px">
							<h3 class="iconbox-title">Materias</h3>
                              <!--
                                Aqui van los controles de ASP

                                ......................................................................................................
                                -->
							<div class="iconbox-desc">

							</div>
						</div>
					</div>

				</div>

                 
               <div class="col-sm-7 col-sm-offset-4">

					<div class="iconbox wow zoomInDown  " data-wow-duration="1.3s"style="background-color:#C4C3C3;">
						<div class="iconbox-icon" style="margin-top:-20px">
							<span class="fa fa-table wow shake"></span>
						</div>
						<div class="iconbox-text" style="margin-top:-20px">
							<h3 class="iconbox-tittle">Seleccion</h3>
                             <!--
                                Aqui van los controles de ASP

                                ......................................................................................................
                                -->
							<div class="iconbox-desc">

							</div>
						</div>
					</div>

				</div>

              
           
            </div>


		</div><!-- .contaier -->

	</section>

	<!-- Horarios end -->
    
   

	<!-- CallToAction start -->

	<%--<section class="calltoaction">
		<div class="container">

			<div class="row">

				<div class="col-md-12 col-lg-12">
					<h2 class="wow slideInRight" data-wow-delay=".1s">ARE YOU READY TO START?</h2>
					<div class="calltoaction-decription wow slideInRight" data-wow-delay=".2s">
						I'm available for freelance projects.
					</div>
				</div>

				<div class="col-md-12 col-lg-12 calltoaction-btn wow slideInRight" data-wow-delay=".3s">
					<a href="#contact" class="btn btn-lg">Hire Me</a>
				</div>

			</div><!-- .row -->
		</div><!-- .container -->
	</section>--%>

	<!-- CallToAction end -->

	<!-- Citas start -->

	<section id="Citas" class="pfblock">

            
            <div class="row">

				<div class="col-sm-6 col-sm-offset-3">

					<div class="pfblock-header wow fadeInUp ajax-response">
						<h2 class="pfblock-title">Citas</h2>

                        <asp:GridView ID="GridViewCitas" runat="server" DataKeyNames="NumeroCita" AutoGenerateColumns="false" CssClass="table media-list fa-border table-bordered table-responsive table-condensed caption ajax-response wow bounce" BorderStyle="None" OnSelectedIndexChanged="GridViewCitas_SelectedIndexChanged">
                            <Columns>
                                <%--<asp:TemplateField HeaderText="Seleccionar"> 
                                    <ItemTemplate>
                                        <asp:Button ID="btnSeleccionar" Text="Seleccionar!!" runat="server"
                                            CommandName="SelectRow" CssClass="btn-link navbar-btn"
                                            CommandArgument="<%# ( (GridViewRow) Container).Cells[0].Text %>"/>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                                <asp:CommandField ShowSelectButton="true" ButtonType="Link" HeaderText="Seleccionar" />
                                <asp:BoundField DataField="NumeroCita" HeaderText="NumeroCita" ReadOnly="True" 
                                    SortExpression="NumeroCita" />
                                <asp:BoundField DataField="Hora" HeaderText="Hora" 
                                    SortExpression="Hora" />
                                <asp:BoundField DataField="Dia" HeaderText="Dia" 
                                    SortExpression="Dia" />
                            </Columns>
                        </asp:GridView>
						   <%--<asp:GridView ID="GridViewCitas"  runat="server" AutoGenerateColumns="False" DataKeyNames="NumeroCita" DataSourceID="SqlDataSource_Citas" OnRowCommand="GridView_Citas_RowCommand" CssClass="table media-list fa-border table-bordered table-responsive table-condensed caption ajax-response wow bounce" BorderStyle="None" >
                            <Columns>
                                <asp:BoundField DataField="NumeroCita" HeaderText="NumeroCita" InsertVisible="False" ReadOnly="True" SortExpression="NumeroCita"  HeaderStyle-CssClass="text-center" />
                                <asp:BoundField DataField="Hora" HeaderText="Hora" SortExpression="Hora"  HeaderStyle-CssClass="text-center"  />
                                <asp:BoundField DataField="Dia" HeaderText="Dia" SortExpression="Dia" HeaderStyle-CssClass="text-center" />
                                <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btnSeleccionar" Text="Seleccionar" runat="server"
                                    CommandName="SelectRow" CssClass="btn-link navbar-btn"
                                    CommandArgument="<%# ( (GridViewRow) Container).Cells[0].Text %>"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                            </Columns>
                        </asp:GridView>--%>

                <%--<asp:SqlDataSource ID="SqlDataSourceCitas" runat="server" ConnectionString="<%$ ConnectionStrings:dbControlDeCitas %>" SelectCommand="SELECT [IdCita] as NumeroCita, [Hora], FORMAT([Dia], 'dd/MM/yyyy', 'en-US') AS Dia FROM [tbCitas] WHERE (([IdAdministrador] = @IdAdministrador) AND ([Disponible] = @Disponible))">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="0" Name="IdAdministrador" SessionField="IdAdministrador" />
                        <asp:Parameter DefaultValue="0" Name="Disponible" />
                    </SelectParameters>
                </asp:SqlDataSource>--%>

              
						<div class="form-group wow fadeInUp">
                            <asp:TextBox ID="txtComentario" runat="server" CssClass="text-info  form-control" Rows="3" placeholder="Comentario" TextMode="MultiLine"></asp:TextBox>
                            <asp:Button ID="btnEnviar" runat="server" Text="Enviar"  OnClick="btnEnviar_Click" CssClass="btn-group-lg btn-block calltoaction-btn btn-success" />
						</div>
					</div>

				</div>

			</div><!-- .row -->

            <div class="row">

               

            </div><!-- .row -->

					
		<%--</div><!-- .row -->--%>
	</section>

	<!-- Citas end -->


	<!-- Contacto start -->

	<section id="Contacto" class="pfblock">
		<div class="container">
			<div class="row">

				<div class="col-sm-6 col-sm-offset-3">

					<div class="pfblock-header">
						<h2 class="pfblock-title">Contactanos</h2>
						<div class="pfblock-line"></div>
						<div class="pfblock-subtitle">
                            Preguntanos lo que quieras..<br />
                            Nosotros respondemos ;D
						</div>
					</div>

				</div>

			</div><!-- .row -->

			<div class="row">

				<div class="col-sm-6 col-sm-offset-3">

					<form id="contact-form" role="form">
						<div class="ajax-hidden">
							<div class="form-group wow fadeInUp">
								<label class="sr-only" for="c_name">Name</label>
                                <asp:TextBox ID="txtName" placeholder = "Nombre" CssClass="form-control" runat="server" Width="550px"></asp:TextBox>
								<%--<input type="text" id="c_name" class="form-control" name="c_name" placeholder="Name">--%>
							</div>

							<div class="form-group wow fadeInUp" data-wow-delay=".1s">
								<label class="sr-only" for="c_email">Email</label>
                                <asp:TextBox ID="txtEmail" placeholder = "E-mail" CssClass="form-control" runat="server" Width="550px" ></asp:TextBox>
								<%--<input type="email" id="c_email" class="form-control" name="c_email" placeholder="E-mail">--%>
							</div>

							<div class="form-group wow fadeInUp" data-wow-delay=".2s">
                                <asp:TextBox ID="txtMesg" placeholder = "Mensaje" CssClass="form-control" runat="server" Rows="10" TextMode="MultiLine" Width="288px"></asp:TextBox>
								<%--<textarea class="form-control" id="c_message" name="c_message" rows="7" placeholder="Message"></textarea>--%>
							</div>
                            <asp:Button id="btnSend" type="submit" CssClass="btn btn-lg btn-block wow fadeIn" data-wow-delay=".3s" runat="server" Text="Enviar Mensaje" OnClick="btnSend_Click"></asp:Button>
							<%--<button type="submit" class="btn btn-lg btn-block wow fadeInUp" data-wow-delay=".3s">Send Message</button>--%>
						</div>
						<div class="ajax-response"></div>
					</form>

				</div>

			</div><!-- .row -->
		</div><!-- .container -->
	</section>

	<!-- Contacto end -->

	<!-- Footer start -->

	<footer id="footer">
		<div class="container">
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
    
    <!-- Scroll to top end-->

	<!-- Javascript files -->

	<script src="assets/js/jquery-1.11.1.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.parallax-1.1.3.js"></script>
	<script src="assets/js/imagesloaded.pkgd.js"></script>
	<script src="assets/js/jquery.sticky.js"></script>
	<script src="assets/js/smoothscroll.js"></script>
	<script src="assets/js/wow.min.js"></script>
    <script src="assets/js/jquery.easypiechart.js"></script>
    <script src="assets/js/waypoints.min.js"></script>
    <script src="assets/js/jquery.cbpQTRotator.js"></script>
	<script src="assets/js/custom.js"></script>

    

   
    </form>
</body>
</html>
