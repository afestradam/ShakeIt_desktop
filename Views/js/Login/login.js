$(document).ready(function() {
  $("#ingresar").click(function() {
    validarLogin();
  });
  $('body').keyup(function(e) {
    if (e.keyCode == 13) {
      validarLogin();
    }
  });
});

function validarLogin() {
  var vd = ValidarCampos('log');

  if (vd == true) {
    login();
  }

}

function login() {


  if (navigator.onLine) {
    server();
    //local();
  } else {
    local();
  }
}

function server() {

  var id = $('#user').val();
  var pass = $('#pass').val();
  if (id == pass) {
    var passc = pass;
  } else {
    var passc = hex_md5(pass);
  }

  var dataserver = id + "|" + passc;
  var dataserverb = window.btoa(dataserver);
  var bdatos = {
    "login": dataserverb
  };
  $.ajax({
    type: 'POST',
    url: base + 'ServerShakeIt/Servicios/Usuarios.php',
    data: bdatos,
    dataType: 'json',
    success: function(response) {
      if (response.Respuesta != 0) {
        //debugger
        if (response.Respuesta[0].doc_usuario == response.Respuesta[0].pass_usuario) {
          $("#btns").html("<a class='btn btn_sh_normal btn-sm' href='javascript: Actualizar_Datos()' role='button'>Aceptar</a>");
          $("#msg").html("<center><p>Es necesario que actualice sus datos, se abrirá una nueva ventana donde tendrá que volver a iniciar sesión y llenar el formulario de actualización de datos, una vez guarde la información, cierre la ventana e inicie sesión nuevamente.</center>");
          $('#modal_msg').modal({
            backdrop: 'static',
            keyboard: true,
            show: true
          });
          $("#ingresar").show();
          $("#ingresando").hide();
        } else if (response.Respuesta[0].estado_usuario == 2) {
          $("#btns").html("<center><input data-dismiss='modal' aria-label='Close' class='btn btn-primary m-r-1em' value='Aceptar'/></center>");
          $("#msg").html("<center><p>Usuario inactivo</p></center>");
          $("#modal_msg").modal('show');
          $("#ingresar").show();
          $("#ingresando").hide();
        } else if (response.Respuesta[0].tipo_usuario == 0) {
          $("#btns").html("<center><input data-dismiss='modal' aria-label='Close' class='btn btn-primary m-r-1em' value='Aceptar'/></center>");
          $("#msg").html("<center><p>Usuario no autorizado</p></center>");
          $("#modal_msg").modal('show');
          $("#ingresar").show();
          $("#ingresando").hide();
        } else {
          var idus = response.Respuesta[0].id_usuario;
          var nomus = response.Respuesta[0].nom_usuario;
          var apeus = response.Respuesta[0].ape_usuario;
          var tipus = response.Respuesta[0].tipo_usuario;
          sesionUs(idus, nomus, apeus, tipus);
        }
      } else {
        //alert("Error de autenticación.")
        $("#btns").html("<center><input data-dismiss='modal' aria-label='Close' class='btn btn-primary m-r-1em' value='Aceptar'/></center>");
        $("#msg").html("<center><p>Error de autenticación.</p></center>");
        $("#modal_msg").modal('show');
        $("#ingresar").show();
        $("#ingresando").hide();
      }
    },
    beforeSend: function() {
      $("#ingresar").hide();
      $("#ingresando").show();
    }
  }).fail(function(jqXHR, textStatus, errorThrown) {
    $("#btns").html("<input data-dismiss='modal' aria-label='Close' class='btn btn-primary m-r-1em' value='Aceptar'/>");
    $("#msg").html("<center><p>" + jqXHR + " " + textStatus + " " + errorThrown + "</center>");
    $("#modal_msg").modal('show');
    $("#ingresar").show();
    $("#ingresando").hide();
  });

}

function local() {
  //debugger
  var id = $('#user').val();
  var pass = $('#pass').val();
  if (id == pass) {
    var passc = pass;
  } else {
    var passc = hex_md5(pass);
  }
  $("#ingresar").hide();
  $("#ingresando").show();

  var sql = "call Usuarios_Login('" + id + "', '" + passc + "');";
  con.query(sql, function(err, results) {
    numRows = results[0].length;
    //debugger
    if (numRows > 0) {
      if (results[0].estado_usuario == 2) {
        $("#btns").html("<center><input data-dismiss='modal' aria-label='Close' class='btn btn-primary m-r-1em' value='Aceptar'/></center>");
        $("#msg").html("<center><p>Usuario inactivo</p></center>");
        $("#modal_msg").modal('show');
        $("#ingresar").show();
        $("#ingresando").hide();
      } else if (results[0].tipo_usuario == 0) {
        $("#btns").html("<center><input data-dismiss='modal' aria-label='Close' class='btn btn-primary m-r-1em' value='Aceptar'/></center>");
        $("#msg").html("<center><p>Usuario no autorizado</p></center>");
        $("#modal_msg").modal('show');
        $("#ingresar").show();
        $("#ingresando").hide();
      } else {
        var idus = results[0].id_usuario;
        var nomus = results[0].nom_usuario;
        var apeus = results[0].ape_usuario;
        var tipus = results[0].tipo_usuario;
        sesionUs(idus, nomus, apeus, tipus);
      }
    } else {
      //alert("Error de autenticación.")
      $("#btns").html("<center><input data-dismiss='modal' aria-label='Close' class='btn btn-primary m-r-1em' value='Aceptar'/></center>");
      $("#msg").html("<center><p>Error de autenticación.</p></center>");
      $("#modal_msg").modal('show');
      $("#ingresar").show();
      $("#ingresando").hide();
    }
  });
}

function BuscarSedeInfo() {
  debugger
  var fs = require('fs');

  var nomsede;

  var data = fs.readFileSync('C:/SoftanSol/Shake_It/Sedes/Sede.txt', 'utf8');
  nomsede = data;

  var sql = "call Sedes_GetXNom('" + nomsede + "');";
  con.query(sql, function(err, results) {
    debugger
    numRows = results[0].length;
    if (numRows > 0) {
      debugger
      var idsed = results[0][0].id_sede;
      var nitsede = results[0][0].nit_sede;
      var nomsed = results[0][0].nom_sede;
      var dirsede = results[0][0].dir_sede;
      var munsedeid = results[0][0].id_municipio;
      var munsede = results[0][0].nom_municipio;
      var depsedeid = results[0][0].id_departamento;
      var depsede = results[0][0].nom_departamento;
      var telsede = results[0][0].tel1_sede;
      var whatsede = results[0][0].tel2_sede;
      var idensed = results[0][0].iden_sede;

      sesionSede(idsed, nitsede, nomsed, dirsede, munsedeid, munsede, depsedeid, depsede, telsede, whatsede, idensed)

    }
  });
}

function sesionUs(idus, nomus, apeus, tipus) {
  debugger
  localStorage.setItem("ses_estado", "ShakeItDesk");
  localStorage.setItem("id_user", idus);
  localStorage.setItem("nom_user", nomus + " " + apeus);
  localStorage.setItem("tipo_user", tipus);
  BuscarSedeInfo()
}

function sesionSede(idsed, nitsede, nomsed, dirsede, munsedeid, munsede, depsedeid, depsede, telsede, whatsede, idensed) {
  debugger
  localStorage.setItem("id_sede", idsed);
  localStorage.setItem("nit_sede", nitsede);
  localStorage.setItem("nom_sede", nomsed);
  localStorage.setItem("dir_sede", dirsede);
  localStorage.setItem("munid_sede", munsedeid);
  localStorage.setItem("mun_sede", munsede);
  localStorage.setItem("depid_sede", depsedeid);
  localStorage.setItem("dep_sede", depsede);
  localStorage.setItem("tel_sede", telsede);
  localStorage.setItem("what_sede", whatsede);
  localStorage.setItem("iden_sede", idensed);
  window.location = 'inicio.html';
}

function Actualizar_Datos(){
  var url = base + "ShakeIt_Admin"
  window.open(url);
  $('#modal_msg').modal('hide');
}

$(document).ready(function() {
  verificacionL();
  //localStorage.clear();

});
