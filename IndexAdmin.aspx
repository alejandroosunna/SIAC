﻿<%@ Page Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="IndexAdmin.aspx.cs" Inherits="IndexAdmin"  EnableEventValidation="false"%>
      

<asp:Content ID="CNTResumen" ContentPlaceHolderID="CPHPrincipal" runat="server">   
                        <div class="panel-heading section scrollspy">
                          Listado de citas pendientes
                        </div>
                        <div class="panel-body scrolling-table-container">
                           
                                <asp:GridView ID="GridView_Citas" class="table striped responsive-table" runat="server" AutoGenerateColumns="False" DataKeyNames="IdCita" DataSourceID="SqlDataSource" OnRowCommand="GridView_Citas_RowCommand" OnSelectedIndexChanged="GridView_Citas_SelectedIndexChanged">
                                    <Columns>
                                        <asp:BoundField DataField="IdCita" HeaderText="IdCita" InsertVisible="False" ReadOnly="True" SortExpression="IdCita" />
                                        <asp:BoundField DataField="IdUsuario" HeaderText="IdUsuario" SortExpression="IdUsuario" />
                                        <asp:BoundField DataField="FechaAgendada" HeaderText="FechaAgendada" SortExpression="FechaAgendada" />
                                        <asp:BoundField DataField="FechaDisponible" HeaderText="FechaDisponible" SortExpression="FechaDisponible" />
                                        <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" />
                                        <asp:BoundField DataField="Comentario" HeaderText="Comentario" SortExpression="Comentario" />
                                       
                                        <asp:CommandField ShowEditButton="True" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:dbProyectoCoordinacion %>" SelectCommand="SELECT [IdCita], [IdUsuario], [FechaAgendada], [FechaDisponible], [Estado], [Comentario] FROM [tbCitas] WHERE (([IdUsuario] IS NOT NULL) AND ([Estado] = @Estado))">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="1" Name="Estado" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                       
                        </div>
    <div class="row">
        <div class="col s12 m4 l4 center center-align">
            <br />
        <asp:Button class="waves-effect waves-light btn orange"  ID="btnNuevaCita" runat="server" Text="Nueva Cita" OnClick="btnNuevaCita_Click"/>
        </div>
        <div class="col s12 m4 l4 center center-align">
            <br />
        <asp:Button class="waves-effect waves-light btn orange"  ID="btnElinarCitas" runat="server" Text="Eliminar" OnClick="btnElinarCitas_Click"/>                   
        </div>
    </div>
                        </asp:Content>
          
                



