<%@ Page Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="Citas.aspx.cs" Inherits="Citas" %>
<asp:Content ID="Principal" ContentPlaceHolderID="CPHPrincipal" runat="server">
    <script type="text/javascript">
        function getDetails() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url:"Citas.aspx/GetData",
                data: {},
                datatype: "json",
                success: function (data) {
                    $('#tableCitas tbody').remove();
                    for (var i = 0; i < data.d.length; i++)
                    {
                        $('#tableCitas').append(
                            "<tr><td>" + data.d[i].idCita + "</td><td>" + "<td>" + data.d[i].idUsuario + "</td><td>" +
                            "<td>" + data.d[i].FechaAgendada + "</td><td>" + "<td>" + data.d[i].FechaDisponible + "</td><td>" +
                            "<td>" + data.d[i].Estado + "</td><td>" + "<td>" + data.d[i].Comentario + "</td>" +
                            "<td>" + "<input type='button' class='btn editButtnon' data-id='" + data.d[i].idCita + "' data-toggle='modal' data-target='#myModal' name='submitButton' id='btnEdit' value='Edit' />" + "</td>" +
                                "<td><input type='button' class='btn deleteButton' name='submitButton' id='btnDelete' value='Delete'/> </td></tr>");
                            
                    }
                }, error: function () {
                    alert("Ocurrio un error");
                }

            });
        }
        $(document).ready(function () {
            // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
            
        });
        $(document).on("click", ".editButton", function () {
            
            $('#myModal').openModal();

            var id = $(this).attr("data-id");
            console.log(id);
            $('#btnUpdate').attr("edit-id", id);

            $.ajax({
                type: "Post",
                contentType: "application/json; charset=utf-8",
                url: "Citas.aspx/EditCita",
                data: '{cid: ' + id + '}',
                dataType: 'json',
                success: function (data) {
                    var citaDetails = $.parseJSON(data.d);
                    $.each(citaDetails, function (index, value) {
                        $("#idCita1").val(value.IdCita);
                        $("#idUsuario1").val(value.IdUsuario);
                        $("#fechaAgendada1").val(value.FechaAgendada);
                        $("#fechaDisponible1").val(value.FechaDiponible);
                        $("#estado1").val(value.Estado);
                        $("#comentario1").val(value.Comentario);
                    });
                },
                error: function () {
                    alert("Ocurrio algún error en + " + id);
                }
            });
            
        });
        $('#btnUpdate').click(function () {
           
            var id = $(this).attr("edit-id");
            var cita = {};
            cita.idCita = $("#idCita1").val();
            cita.idUsuario = $("#idUsuario1").val();
            cita.fechaAgendada = $("#fechaAgendada1").val();
            cita.fechaDisponible = $("#fechaDisponible1").val();
            cita.estado = $("#estado1").val();
            cita.comentario = $("#comentario1").val();

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Cita.aspx/UpdateCita",
                data: '{objCita: ' + JSON.stringify(cita) + ', cid: ' + id + '}',
                dataType: "json",
                success: function (data) {
                    if (confirm("Seguro que desea modificar la cita? ") == true) {
                        alert("Tu cita se a cambiado exitosamente!");
                    } else {
                        alert("Tu cancelaste los cambios");
                    }
                    getDetails();
                },
                error: function (data) {
                    alert("Error al actualizar los datos en: " + id);
                }
            });
        });
        $(document).on("click", ".deleteButton", function () {
            var id = $(this).attr("data-id");
            
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Citas.aspx/RemoveCita",
                data: '{cid: ' + id + '}',
                dataType: "json",
                success: function () {
                    if (confirm("Estas seguro que deseas eliminar la cita?") == true) {
                        alert("Cita Eliminada Exitosamente!");
                    } else {
                        alert("Cancelaste la cita");
                    }
                    getDetails();
                },
                error: function (data) {
                    alert("Ocurrio un error en la cita : " + id);
                }
            });
        });

    </script>

        <div id="myModal" class="modal modal-fixed-footer"  >
            <div class="modal-content">
                <div class="row">
                    <div class="input-field col s6">
                        <input  value="idCita" id="idCita1" type="number" class="validate"/>
                        <label for="idCita1">id Cita</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <input  value="idUsuario" id="idUsuario1" type="number" class="validate"/>
                        <label for="idUsuario1">id Usuario</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <input  id="fechaAgendada1" type="date" class="datepicker"/>
                        <label for="fechaAgendada1">Fecha Agendadna</label>
                    </div>
                </div>

                <div class="row">
                    <div class="input-field col s6">
                        <input  id="fechaDisponible1" type="date" class="datepicker"/>
                        <label for="fechaDisponible1">Fecha Disponible</label>
                    </div>
                </div>

                <div class="row">
                    <div class="input-field col s6">
                        <input id="estado1" type="number" class="validate"/>
                        <label for="estado1">estado</label>
                    </div>
                </div>

                <div class="row">
                    <div class="input-field col s6">
                        <input id="comentario1" type="text" class="materialize-textarea"/>
                        <label for="comentario1">comentario</label>
                    </div>
                </div>
                
            </div>
            <div class="modal-footer">
                <button type="button" class="btn" data-dismiss="modal">Close</button>
                <button type="button" id="btnUpdate" class="btn" edit-id="" data-dismiss="modal"> Guardar </button>
            </div>
            
        </div>
        <table id="tableCitas" class="table-of-contents" role="grid" aria-describedby="tablaCitas">
            <thead>
                <tr role="row">
                    <th tabindex="0" aria-controls="tableCitas" rowspan="1" colspan="1" aria-sort="ascending" 
                        aria-label="Rendering engine: active to sort column descending">id Cita</th>
                    <th tabindex="0" aria-controls="tableCitas" rowspan="1" colspan="1" aria-sort="ascending" 
                        aria-label="Browser engine: active to sort column descending">id Usuario</th>
                    <th tabindex="0" aria-controls="tableCitas" rowspan="1" colspan="1" aria-sort="ascending" 
                        aria-label="Platform(s): active to sort column descending">Fecha Agendad</th>
                    <th tabindex="0" aria-controls="tableCitas" rowspan="1" colspan="1" aria-sort="ascending" 
                        aria-label="Engine version: active to sort column descending">Fecha Disponible</th>
                    <th tabindex="0" aria-controls="tableCitas" rowspan="1" colspan="1" aria-sort="ascending" 
                        aria-label="CSS grade: active to sort column ascending">Estado</th>
                    <th tabindex="0" aria-controls="tableCitas" rowspan="1" colspan="1" aria-sort="ascending" 
                        aria-label="CSS grade: active to sort column ascending">Comentario</th>
                    <th tabindex="0" aria-controls="tableCitas" rowspan="1" colspan="2" aria-sort="ascending" 
                        aria-label="CSS grade: active to sort column ascending">Acciones</th>
                </tr>
            </thead>
            <tbody>
            
                <%for (var data = 0; data < TableData.Rows.Count; data++)  { %>
                    <tr class="" role="row">
                        <td><%=TableData.Rows[data]["idCita"]%></td>
                        <td><%=TableData.Rows[data]["idUsuario"]%></td>
                        <td><%=TableData.Rows[data]["FechaAgendada"]%></td>
                        <td><%=TableData.Rows[data]["FechaDisponible"]%></td>
                        <td><%=TableData.Rows[data]["Estado"]%></td>
                        <td><%=TableData.Rows[data]["Comentario"]%></td>
                        <td><input type="button" class="btn btn-flat editButton" data-id="<%=TableData.Rows[data]["idCita"]%>"
                            data-toggle="modal" data-target="#myModal" name="submitButton" id="btnEdit" value="Editar"/></td>
                        <td><input type="button" class="btn btn-flat deleteButton" name="submitButton" id="btnDelete" value="Eliminar"/></td>
                    </tr>
                <%} %>
            </tbody>
        </table>
</asp:Content> 