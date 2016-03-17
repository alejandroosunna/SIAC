<%@ Page Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="ChatAdmin.aspx.cs" Inherits="ChatAdmin" %>
<asp:Content ID="Principal" ContentPlaceHolderID="CPHPrincipal" runat="server">

    <script type="text/javascript" src="/Scripts/jquery-ui-1.9.2.min.js"></script>
    <script type="text/javascript" src="/Scripts/jquery.signalR-1.0.1.js"></script>
    <script type="text/javascript" src="/signalR/hubs"></script>

   <script type="text/javascript">
              

          
               $(function () {
                  getUser();
              });


              function getUser() {
                  $.ajax({
                      type: "Post",
                      contentType: "application/json; charset=utf-8",
                      url: "ChatAdmin.aspx/ObtenerUsuario",
                      data: {},
                      dataType: 'json',
                      success: function (data) {
                          var user = $.parseJSON(data.d);
                          $("#nickname").val(user);
                      },
                      error: function () {
                          alert("Ocurrio algún error ");
                      }
                  });
                  startChartHub();
              }
                  
              function startChartHub() {
                  var chat = $.connection.chatHub;

                  // Get the user name.
                  $('#nickname').val();
                  //chat.client.desconectar($('#nickname').val());
                  chat.client.differentName = function (name) {

                      // Prompts for different user name
                      chat.server.notify($('#nickname').val(), $.connection.hub.id);
                  };

                  chat.client.online = function (name) {
                      // Update list of users
                      if (name == $('#nickname').val())
                          $('#onlineusers').append('<div class="border" style="color:green">Tu eres: ' + name + '</div>');
                      else {
                          $('#onlineusers').append('<div class="border">' + name + '</div>');
                          $("#users").append('<option value="' + name + '">' + name + '</option>');
                      }
                  };
                  function validar(e) {
                      tecla = (document.all) ? e.keyCode : e.which;
                      if (tecla == 13) alert('Has pulsado enter');
                  }
                  chat.client.enters = function (name) {
                      $('#chatlog').append('<div style="font-style:italic;"><i>' + name + ' joins the conversation</i></div>');
                      $("#users").append('<option value="' + name + '">' + name + '</option>');
                      $('#onlineusers').append('<div class="border">' + name + '</div>');
                  };
                  // Create a function that the hub can call to broadcast chat messages.
                  chat.client.broadcastMessage = function (name, message) {
                      //Interpret smileys
                      message = message.replace(":)", "<img src=\"/images/smile.gif\" class=\"smileys\" />");
                      message = message.replace("lol", "<img src=\"/images/laugh.gif\" class=\"smileys\" />");
                      message = message.replace(":o", "<img src=\"/images/cool.gif\" class=\"smileys\" />");

                      //display the message
                      $('#chatlog').append('<div class="border"><span style="color:red">' + name + '</span>: ' + message + '</div>');
                  };

                  chat.client.disconnected = function (name) {
                      //Calls when someone leaves the page
                      $('#chatlog').append('<div style="font-style:italic;"><i>' + name + ' leaves the conversation</i></div>');
                      $('#users div').remove(":contains('" + name + "')");
                      $("#dwusers li").remove(":contains('" + name + "')");
                  }

                  // Start the connection.
                  $.connection.hub.start().done(function () {
                      //Calls the notify method of the server
                      chat.server.notify($('#nickname').val(), $.connection.hub.id);

                      $('#btnsend').click(function () {
                          var touser = document.getElementById('touser').value;
                          if (touser == "All") {
                              // Call the Send method on the hub. 
                              chat.server.send($('#nickname').val(), $('#message').val());
                          }
                          else {
                              chat.server.sendToSpecific($('#nickname').val(), $('#message').val(), document.getElementById('touser').value);
                          }
                          // Clear text box and reset focus for next comment. 
                          $('#message').val('').focus();
                      });

                  });
              }

            </script>
    



    <input type="hidden" id="nickname" />
    <asp:Label ID="numControl" runat="server"></asp:Label>
    <div id="chatlog"></div>
    <ul id='dwuser' class='dropdown-content'>
        
    </ul>
    
    <select>
        <option>All</option>
    </select>
    <div id="onlineusers">
        <b>Online Users</b> 
    </div>
    
    <div id="chatarea">
        <div class="messagelog">
            <textarea spellcheck="true" id="message" class="messagebox" onkeypress="validar(event)"></textarea>
        </div>
        
        <div class="actionpane">
            <input type="button" id="btnsend" class="btn waves-effect waves-orange " value="Enviar" />
        </div>
        <div class="actionpane">
            <input type="text" id="touser" value="All" />
        </div>
         <div class="input-field col s12">
            <select id="users">
              <option value="" selected>Choose your option</option>
              <option value="1">Option 1</option>
              <option value="2">Option 2</option>
              <option value="3">Option 3</option>
            </select>
            <label>Materialize Select</label>
          </div>
        
    </div>
    

   
</asp:Content>