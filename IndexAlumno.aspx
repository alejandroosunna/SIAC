<%@ Page Title="IndexAlumno" MasterPageFile="~/Alumno.master" Language="C#" AutoEventWireup="true" CodeFile="IndexAlumno.aspx.cs" Inherits="IndexAlumno" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CPHBody" runat="server">
	

    <!-- Resumen -->
	<section id="Resumen" class="pfblock pfblock-gray">
	    <div class="container">
			<div class="row">
				<div class="col-sm-6 col-sm-offset-3">
                    
					<div class="pfblock-header wow fadeInUp">
						<h2 class="pfblock-title center">Usuario</h2>
						<div class="pfblock-line"></div>
						<div class="pfblock-subtitle">                            
						</div>
					</div>

				</div>

			</div>

			<div class="container" >
	
                <div class="row">
                    <div class="col m3 l3 hide-on-small-and-down"><a></a></div>
                <div class="col s12 m6 l6">
                    <div class="card green">
                    <div class="card-content white-text center-align">
                        <asp:Label ID="lblNombre" runat="server" Text=""></asp:Label>
                        <br />
                        <asp:Label ID="lblNumControl" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="card-action center-align">
                        <a href="#" class="btn orange white-text center-align">Configuración</a>
                        
                    </div>
                    </div>
                </div>
                    <div class="col m3 l3"></div>
                
                  
                
                    <div class="col m3 l3 hide-on-small-and-down"><a></a></div>
                    <div class="col s12 m6 l6">
                      <div class="card green">
                        <div class="card-content white-text center-align">
                            <span class="fa fa-calendar"></span>
                         <asp:Label ID="lblPDiaCita" runat="server" Text=""></asp:Label>
                                <br />
                                <asp:Label ID="lblPHoraCita" runat="server" Text=""></asp:Label>
                                <br />
                                <asp:Button ID="btnEliminarCita" runat="server" Text="Eliminar" OnClick="btnEliminarCita_Click" CssClass="btn orange white-text center"/>
                                
                        </div>
                        <div class="card-action">
                        </div>
                      </div>
                    </div>
                   
		</div>
	    </div>
		</div>
	</section>

	<!-- Resumen end -->
    


	<!-- Citas start -->

	<section id="Citas" class="center-align">
            
            <div class="container">
					<div class="center-align">
						<h2 class="pfblock-title center">Citas</h2>
                        
                        <div class="row center-align centered center-block">
                            <asp:DropDownList runat="server" ID="DropDListMotivos" DataSourceID="SqlDataDropDListMotivos" DataValueField="IdMotivo" DataTextField="Motivo" CssClass="materialboxed input-field orange white-text"></asp:DropDownList>
                        </div>
                        <div class="scrolling-table-container row">
                             
                        <!-- GRIDVIEW START -->
                            <asp:GridView ID="GridViewCitas" runat="server" DataKeyNames="NumeroCita" AutoGenerateColumns="false" CssClass="striped responsive-table " BorderStyle="None" OnSelectedIndexChanged="GridViewCitas_SelectedIndexChanged">
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
                        <!-- GRIDVIEW END -->
						</div>
                       
                        <%--<asp:SqlDataSource id="SqlDataDropDListMotivos" 
                          ConnectionString='<%$ ConnectionStrings:dbProyectoCoordinacion %>'
                          SelectCommand="select IdMotivo, Motivo from tbMotivos"
                          runat="server"/>--%>
					</div>

            <%--<div class="row">

               

            </div><!-- .row -->--%>
                
                 
		</div><!-- .row -->
	</section>
     
         
         
    
	<!-- Citas end -->


	<!-- Contacto start -->

	<section id="Contacto" class="center-align">
		<div class="container">
			<div class="row center-align">

				<div class="center-align">

					<div class="center center-align">
						<h2 class="center">Quejas & Sugerencias</h2>
						
					</div>

				</div>

			</div><!-- .row -->

			<div class="container">

				<div class="col s6 m6 l6">

					<%--<form id="contact-form" role="form">--%>
						<div class="ajax-hidden">
							<div class="input-field col s6">
								<label class="sr-only" for="c_name">Name</label>
                                <asp:TextBox ID="txtName" placeholder = "Nombre" CssClass="form-control" runat="server" Width="550px"></asp:TextBox>
								<%--<input type="text" id="c_name" class="form-control" name="c_name" placeholder="Name">--%>
							</div>

							<div class="input-field col s6" data-wow-delay=".1s">
								<label class="sr-only" for="c_email">Email</label>
                                <asp:TextBox ID="txtEmail" placeholder = "E-mail" CssClass="form-control" runat="server" Width="550px" ></asp:TextBox>
								<%--<input type="email" id="c_email" class="form-control" name="c_email" placeholder="E-mail">--%>
							</div>

							<div class="input-field col s6" data-wow-delay=".2s">
                                <asp:TextBox ID="txtMesg" placeholder = "Mensaje" CssClass="materialize-textarea" runat="server" Rows="10" TextMode="MultiLine" Width="288px"></asp:TextBox>
								<%--<textarea class="form-control" id="c_message" name="c_message" rows="7" placeholder="Message"></textarea>--%>
							</div>
                            <asp:Button id="btnSend" type="submit" CssClass="btn orange white-text center-align" data-wow-delay=".3s" runat="server" Text="Enviar Mensaje" OnClick="btnSend_Click"></asp:Button>
							<%--<button type="submit" class="btn btn-lg btn-block wow fadeInUp" data-wow-delay=".3s">Send Message</button>--%>
						</div>
						<div class="ajax-response"></div>
					<%--</form>--%>

				</div>

			</div><!-- .row -->
		</div><!-- .container -->
	</section>

	<!-- Contacto end -->

	

	<!-- Scroll to top -->

	
    <div>
             <asp:SqlDataSource ID="SqlDataDropDListMotivos" runat="server" ConnectionString="<%$ ConnectionStrings:dbProyectoCoordinacion %>" SelectCommand="SELECT * FROM [tbMotivos] WHERE ([IdCarrera] = @IdCarrera)">
                            <SelectParameters>
                                <asp:SessionParameter DefaultValue="0" Name="IdCarrera" SessionField="IdCarrera" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
         </div>
   
</asp:Content>
