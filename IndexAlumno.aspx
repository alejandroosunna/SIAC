﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="IndexAlumno.aspx.cs" Inherits="IndexAlumno" EnableEventValidation="false" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
    
	<title>SIAC</title>
   
      <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <!--Import materialize.css-->
<%--      <link type="text/css" rel="stylesheet" href="materialize/css/materialize.min.css"  media="screen,projection"/>--%>
    <link rel="stylesheet" href="material.min.css">
    <link href="materialize/css/materialize.css" rel="stylesheet" media="screen"/>
      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<!-- Materialize CSS -->
       
  
    
</head>
<body>
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="materialize/js/materialize.min.js"></script>
    <script type="text/javascript" language="javascript">// <![CDATA[
        $(document).ready(function(){
           
            $('.button-collapse').sideNav({
                menuWidth: 300, // Default is 240
                edge: 'left', // Choose the horizontal origin
                closeOnClick: true // Closes side-nav on <a> clicks, useful for Angular/Meteor
            }
 );
        });
 
   </script>
  
   
   
	<!-- Preloader -->

	<div id="preloader">
		<div id="status"></div>
	</div>

	<header class="header">
		<nav>
              
				<div class="mdl-navigation mdl-color--orange" style="height:100%">
                    <img src="Ithlogo.png" class="demo-avatar" style="height:135%">
                    <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
                   <ul class="right hide-on-med-and-down">
<%--                        <li><a href="#home">Inicio</a></li>--%>
					    <li><a href="#Resumen">Principal</a></li>
<%--                        <li><a href="#Horarios">Horarios</a></li>--%>
					    <li><a href="#Citas">Citas</a></li>
					    <li><a href="#Contacto">Contacto</a></li>
                        <li><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/IndexAlumno.aspx?IdLogin=true">Cerrar sesion</asp:HyperLink></li>
                    </ul>
       
				    <ul  class="side-nav" id="mobile-demo">
<%--					    <li><a href="#home">Inicio</a></li>--%>
					    <li><a href="#Resumen">Principal</a></li>
<%--                        <li><a href="#Horarios">Horarios</a></li>--%>
					    <li><a href="#Citas">Citas</a></li>
					    <li><a href="#Contacto">Contacto</a></li>
                        <li><asp:HyperLink ID="lbl_CerrarSesion" runat="server" NavigateUrl="~/IndexAlumno.aspx?IdLogin=true">Cerrar sesion</asp:HyperLink></li>
				    </ul>
				</div>
		</nav>

	</header>

	<!-- Navigation end -->

    <!-- Resumen -->
 <form id="form1" runat="server">
	<section id="Resumen">
        <div class="container">
        <div class="row">
			<div class="card-panel">
                    
					<span class="text-darken-2"">
						<h4 class="pfblock-title">Informacion de usuario</h4>
	                </span>   
				    </div>
            </div>
			<div class="demo-graphs mdl-shadow--3dp mdl-color--withe mdl-cell mdl-cell--12-col" >
	
                <div class="mdl-cell mdl-cell--10-col">
                    <div class="card green darken-1">
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

                
                <div class="mdl-cell mdl-cell--10-col">
                    <div class="card green darken-1">
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
                
                  
<%--                <div class="row">
                    <div class="col s3 m6">
                      <div class="card blue-grey darken-1">
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
                  </div> --%>
		</div>
            <div class="container">
	</section>
	<!-- Resumen end -->
	<!-- Citas start -->

	<section id="Citas">
        <div class="container">
        <div class="row">
        <div class="card-panel">
	        <span class="text-darken-2"">
		    <h4 class="pfblock-title">Citas</h4>
	        </span>   
	    </div>
            </div>
            <div class="demo-graphs mdl-shadow--3dp mdl-color--withe mdl-cell mdl-cell--12-col">
				<div class="mdl-cell mdl-cell--10-col">
				    <div class="pfblock-header wow fadeInUp ajax-response pre-scrollable">
						
						  <%-- <asp:GridView ID="GridView_Citas"  runat="server" AutoGenerateColumns="False" DataKeyNames="NumeroCita" DataSourceID="SqlDataSource_Citas" OnRowCommand="GridView_Citas_RowCommand" CssClass="table media-list fa-border table-bordered table-responsive table-condensed caption ajax-response wow bounce" BorderStyle="None" >--%>
				          <%--<div class="col-sm-6 col-sm-offset-3">--%>

					<div class="pfblock-header wow fadeInUp ajax-response">
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
					</div>
                   <%-- <div class="form-group wow fadeInUp">
      
                              <asp:TextBox ID="txtNumCita" runat="server" CssClass="text-center text-info form-group-lg" placeholder="Número de Cita" ReadOnly="true"></asp:TextBox>
                            <br />
                              <asp:TextBox ID="txtComentario" runat="server" CssClass="text-info  form-control" Rows="3" placeholder="Comentario" TextMode="MultiLine"></asp:TextBox>
                           
                             <asp:Button ID="btnEnviar" runat="server" Text="Enviar"  OnClick="btnEnviar_Click" CssClass="btn-group-lg btn-block calltoaction-btn btn-success" />
						<div class="form-group wow fadeInUp">
                            <asp:TextBox ID="txtComentario" runat="server" CssClass="text-info  form-control" Rows="3" placeholder="Comentario" TextMode="MultiLine"></asp:TextBox>
                            <asp:Button ID="btnEnviar" runat="server" Text="Enviar"  OnClick="btnEnviar_Click" CssClass="btn-group-lg btn-block calltoaction-btn btn-success" />
						</div>
				</div>--%>
                    </div>
			    </div><!-- .row -->

            <%--<div class="row">

               

            </div><!-- .row -->--%>

		</div><!-- .row -->
            <div class="container">
	</section>

	<!-- Citas end -->


	<!-- Contacto start -->

	<section id="Contacto" class="pfblock">
		<div class="container">
			<div class="row">

         <div class="card-panel">
	        <span class="text-darken-2"">
		    <h4 class="pfblock-title">Contacto</h4>
	        </span>   
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
                            <asp:Button id="btnSend" type="submit" CssClass="btn btn-lg btn-block wow fadeIn mdl-color-green" data-wow-delay=".3s" runat="server" Text="Enviar Mensaje" OnClick="btnSend_Click"></asp:Button>
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

<%--					<ul class="social-links">
						<li><a href="index.html#" class="wow fadeInUp"><i class="fa fa-facebook"></i></a></li>
						<li><a href="index.html#" class="wow fadeInUp" data-wow-delay=".1s"><i class="fa fa-twitter"></i></a></li>
						<li><a href="index.html#" class="wow fadeInUp" data-wow-delay=".2s"><i class="fa fa-google-plus"></i></a></li>
						<li><a href="index.html#" class="wow fadeInUp" data-wow-delay=".4s"><i class="fa fa-pinterest"></i></a></li>
						<li><a href="index.html#" class="wow fadeInUp" data-wow-delay=".5s"><i class="fa fa-envelope"></i></a></li>
					</ul>--%>

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
