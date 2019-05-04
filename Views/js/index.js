//Validaciones de directorios
function validaDirectorios() {

  const fs = require('fs');
  var dir1 = 'C:/SoftanSol';
  var dir2 = 'C:/SoftanSol/Shake_It';
  var dir2_1 = 'C:/SoftanSol/Shake_It/Saves';
  var dir2_1_1 = 'C:/SoftanSol/Shake_It/Saves/Bin';
  var dir2_1_1_1 = 'C:/SoftanSol/Shake_It/Saves/Bin/Backups';
  var dir2_1_1_2 = 'C:/SoftanSol/Shake_It/Saves/Bin/Saves';
  var dir2_1_1_3 = 'C:/SoftanSol/Shake_It/Saves/Bin/STerminos';
  var dir2_1_1_4 = 'C:/SoftanSol/Shake_It/Saves/Bin/SLicencia';
  var dir2_2 = 'C:/SoftanSol/Shake_It/Sedes';

  if (!fs.existsSync(dir1)) {
    fs.mkdirSync(dir1);
    fs.mkdirSync(dir2);
    fs.mkdirSync(dir2_1);
    fs.mkdirSync(dir2_1_1);
    fs.mkdirSync(dir2_1_1_1);
    fs.mkdirSync(dir2_1_1_2);
    fs.mkdirSync(dir2_1_1_3);
    fs.mkdirSync(dir2_1_1_4);
    fs.mkdirSync(dir2_2);

    if (fechaAhora == fechaLocal) {
      validaLicencia();
    } else {
      createRemoteBackUp()
    }

  } else {
    if (fechaAhora == fechaLocal) {
      validaLicencia();
    } else {
      createRemoteBackUp()
    }
  }

}

function validaLicencia() {

  const fs = require('fs');
  var dir2_1_1_4 = 'C:/SoftanSol/Shake_It/Saves/Bin/SLicencia/Licencia.txt';

  if (!fs.existsSync(dir2_1_1_4)) {

    $("#lic_mod").modal({
      backdrop: 'static',
      keyboard: true,
      show: true
    });

  } else {

    validaSede()
  }

}

function validaSede() {

  const fs = require('fs');
  var sede = 'C:/SoftanSol/Shake_It/Sedes/Sede.txt';

  if (!fs.existsSync(sede)) {

    $("#selsede_mod").modal({
      backdrop: 'static',
      keyboard: true,
      show: true
    });

  }

}
// Liencia
function verificarLcencia() {

  $("#licGuardar").hide();
  $("#licGuardando").show();

  var lictext = $("#lic_text").val();
  guardarLicencia(lictext);

  //    var dataserver = lictext + "|Datos";
  //    var dataserverb = window.btoa(dataserver);
  //    var data = {
  //        "licencia": dataserverb
  //    };
  //    $.ajax({
  //        type: 'GET',
  //        url: 'http://localhost/ServerSoftanSo/Servicios/Licencias.php',
  //        data: data,
  //        dataType: 'json',
  //        success: function (response) {
  //            if (response.Respuesta != 0) {
  //                $("#licHelp").html("<center><p>" + response.Mensaje + "</p></center>");
  //                guardarLicencia(lictext);
  //            } else {
  //                $("#licGuardar").show();
  //                $("#licGuardando").hide();
  //                $("#licHelp").html("<center><p>" + response.Mensaje + "</p></center>");
  //            }
  //        },
  //        beforeSend: function () {
  //            $("#licGuardar").hide();
  //            $("#licGuardando").show();
  //        }
  //    }).fail(function (jqXHR, textStatus, errorThrown) {
  //        $("#licHelp").html("<center><p>" + jqXHR + " " + textStatus + " " + errorThrown + "</center>");
  //        $("#licGuardar").show();
  //        $("#licGuardando").hide();
  //    });

}

function guardarLicencia(lic) {

  const fs = require('fs');
  var dir2_1_1_4 = 'C:/SoftanSol/Shake_It/Saves/Bin/SLicencia/Licencia.txt';

  fs.writeFile(dir2_1_1_4, lic, function(err) {
    if (err) {
      $("#licGuardar").hide();
      $("#licGuardando").show();
      $("#licHelp").html("Error al guardar licencia");
    } else {
      $("#lic_mod").modal('hide');
      //createDatabase();
      validaSede();
    }
  });

}

function guardarLicenciaLoc() {

  var lic = $("#lic_text").val();

  const fs = require('fs');
  var dir2_1_1_4 = 'C:/SoftanSol/Shake_It/Saves/Bin/SLicencia/Licencia.txt';

  fs.writeFile(dir2_1_1_4, lic, function(err) {
    if (err) {
      $("#licGuardar").hide();
      $("#licGuardando").show();
      $("#licHelp").html("Error al guardar licencia");
    } else {
      $("#lic_mod").modal('hide');
      validaSede();
    }
  });

}
//Modales sedes
function elegirSede() {

  $("#selsede_mod").modal("hide");
  $("#elegirSede_mod").modal({
    backdrop: 'static',
    keyboard: true,
    show: true
  });

}

function registrarSede() {

  $("#selsede_mod").modal("hide");
  Get_DepartamentosSel("#sede_dep")
  $("#registrarSede_mod").modal({
    backdrop: 'static',
    keyboard: true,
    show: true
  });

}

function cerrarModal() {

  $("#elegirSede_mod").modal("hide");
  $("#registrarSede_mod").modal("hide");

  $("#selsede_mod").modal({
    backdrop: 'static',
    keyboard: true,
    show: true
  });
}
//Sedes
function Get_SedesS(select) {

  var sedes = {
    "sedes": "sedes"
  };

  $.ajax({
    type: 'GET',
    url: base + 'ServerShakeIt/Servicios/Comunes.php',
    data: sedes,
    dataType: 'json',
    success: function(response) {
      if (response.Respuesta != 0) {
        $(select).html("")
        $(select).html("<option value='' selected>Seleccione Sede</option>")
        $.each(response.Respuesta, function(i, item) {
          $(select).append('\
                  <option value="' + item.id + '">' + item.nom + '</option>\n\
                  ');
        });
      }
    }
  });
}

function insert_Sede() {

  var nit = $('#sede_nit').val();
  var nom = $('#sede_nom').val();
  var dir = $('#sede_dir').val();
  var mun = $('#sede_mun').val();
  var tel1 = $('#sede_tel1').val();
  var tel2 = $('#sede_tel2').val();
  var tel3 = $('#sede_tel3').val();
  var long = $('#sede_long').val();
  var lat = $('#sede_lat').val();

  $("#insGuardar").hide()
  $("#insGuardando").show()

  var sql = "CALL Sedes_Add('" + nit + "', '" + nom + "', '" + dir + "', '" + mun + "', '" + tel1 + "', '" + tel2 + "', '" + tel3 + "', '" + long + "', '" + lat + "');";
  con.query(sql, function(err, results, fields) {

    if (err) {
      throw err;
    } else {
      if (navigator.onLine) {
        insert_SedeS(nit, nom, dir, mun, tel1, tel2, tel3, long, lat);
      } else {
        $('#msg_alert_mod').html('<p>Error al guardar sede en la nube.</p>');
        $('#msg_alert_mod').show('fast')
      }
    }

  })
}

function insert_SedeS(nit, nom, dir, mun, tel1, tel2, tel3, long, lat) {

  var dataserver = nit + '|' + nom + '|' + dir + '|' + mun + '|' + tel1 + '|' + tel2 + '|' + tel3 + '|' + long + '|' + lat
  var dataserverb = window.btoa(dataserver);
  var sede = {
    "insertar": dataserverb
  };

  console.log(dataserverb);

  $.ajax({
    type: 'POST',
    url: base + 'ServerShakeIt/Servicios/Sedes.php',
    data: sede,
    dataType: 'json',
    success: function(response) {
      if (response.Respuesta != 0) {
        guardarSedeLoc(nom);
      } else {
        $("#sedeGuardar").show()
        $("#sedeGuardando").hide()
        $("#msg_alert_mod").html("<center><p>" + response.Mensaje + "</p></center>");
        $("#msg_alert_mod").show("fast")
      }
    },
    beforeSend: function() {

    }
  }).fail(function(jqXHR, textStatus, errorThrown) {
    $("#msg_alert_mod").html("<center><p>" + jqXHR + " " + textStatus + " " + errorThrown + "</center>");
    $("#msg_alert_mod").modal('show');
    $("#sedeGuardar").show()
    $("#sedeGuardando").hide()
  });
}

function guardarSedeLoc(nom) {

  const fs = require('fs');
  var sede = 'C:/SoftanSol/Shake_It/Sedes/Sede.txt';

  fs.writeFile(sede, nom, function(err) {
    if (err) {
      $("#sede_elGuardando").hide();
      $("#sede_elGuardar").show();
      $("#sedeHelp").html("<center><p>Error al guardar sede.</p></center>");
    } else {
      BuscarSedeInfoIni();
      $("#registrarSede_mod").modal("hide");
      $("#elegirSede_mod").modal("hide");
      $("#btns").html("<a class='btn btn-danger btn-sm' href='#' data-dismiss='modal' aria-label='Close' role='button'>Aceptar</a>");
      $("#msg").html("<center><p>Se ha guardado la sede con éxiito</p></center>");
      $('#modal_msg').modal({
        backdrop: 'static',
        keyboard: true,
        show: true
      })
    }
  });

}

function BuscarSedeInfoIni() {
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
      //      debugger
      var idsed = results[0][0].id_sede;

      guardarCajaInfoIni(0, 5, idsed)

    }
  });
}
//Validaciones de campos
function valLicencia() {

  var lictext = $("#lic_text").val();

  if (lictext.lenght == 0) {

    $("#lic_text").focus();
    $("#lic_text").addClass("is-invalid")
    $("#licHelp").html("<center><p>Es necesario que llene el campo lcencia.</p></center>");

  } else {

    $("#lic_text").removeClass("is-invalid")
    verificarLcencia();
  }

}

function valelegirSede() {

  var sede = $("#sede_select").val();
  var textSede = $('#sede_select option:selected').text()

  if (sede.lenght == 0) {

    $("#sede_select").focus();
    $("#sede_select").addClass("is-invalid");
    $("#sedeHelp").html("<center><p>Es necesario que elija una sede.</p></center>");

  } else {

    $("#sede_select").removeClass("is-invalid")
    guardarSedeLoc(textSede);
  }


}

function valregSede() {

  var val = ValidarCamposAlert('sede_g')

  if (val == true) {

    insert_Sede()

  }

}

//Caja

function guardarCajaInfoIni(val, est, idsede) {


  var dataserver = val + '|' + est + '|' + idsede;
  var dataserverb = window.btoa(dataserver);
  var request = {
    "insertar": dataserverb
  };

  $.ajax({
    type: 'POST',
    url: base + 'ServerShakeIt/Servicios/Caja.php',
    data: request,
    dataType: 'json',
    success: function(response) {

      if (response.Respuesta != 0) {

        guardarCajaInfoLocalIni(val, est, idsede)

      }
    }
  });

}

function guardarCajaInfoLocalIni(val, est, idsede) {

  var cont = 0;
  var sql = "CALL Caja_Add('" + val + "', '" + est + "', '" + idsede + "');";
  con.query(sql, function(err, results, fields) {

    if (err) {
      cont++;
    }
  });
}

$(document).ready(function() {
  Get_SedesS("#sede_select");
  validaDirectorios()
});
