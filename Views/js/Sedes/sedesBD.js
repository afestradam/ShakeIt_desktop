 /* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function insert_Sede() {

    var nit = $('#sede_nit').val();
    var nom = $('#sede_nom').val();
    var dir = $('#sede_dir').val();
    var tel1 = $('#sede_tel1').val();
    var tel2 = $('#sede_tel2').val();
    var tel3 = $('#sede_tel3').val();
    var long = $('#sede_long').val();
    var lat = $('#sede_lat').val();

    $("#insGuardar").hide()
    $("#insGuardando").show()

    var sql = "CALL Sedes_Add('" + nit + "', '" + nom + "', '" + dir + "', '" + tel1 + "', '" + tel2 + "', '" + tel3 + "', '" + long + "', '" + lat + "');";
    con.query(sql, function (err, results, fields) {

        if (err) {
            throw err;
        } else {
            if (navigator.onLine) {
                insert_SedeS(nit, nom, dir, tel1, tel2, tel3, long, lat);
            } else {
                ('#msg_alert_mod').html('<p>Error al guardar producto en la nube.</p>');
                $('#msg_alert_mod').show('fast')
            }
        }

    })
}

function insert_insumosS(nit, nom, dir, tel1, tel2, tel3, long, lat) {

    var dataserver = nit + '|' + nom + '|' + dir + '|' + tel1 + '|' + tel2 + '|' + tel3 + '|' + long + '|' + lat
    var dataserverb = window.btoa(dataserver);
    var sede = {
        "insertar": dataserverb
    };

    console.log(dataserverb);

    $.ajax({
        type: 'POST',
        url: 'http://localhost/ServerShakeIt/Servicios/Sedes.php',
        data: sede,
        dataType: 'json',
        success: function (response) {
            if (response.Respuesta != 0) {
                $("#btns").html("<a class='btn btn-danger btn-sm' href='javascript: Vista_RegInsumos()' role='button'>Aceptar</a>");
                $("#msg").html("<center><p>" + response.Mensaje + "</p></center>");
                $('#modal_msg').modal({backdrop: 'static', keyboard: true, show: true})
            } else {
                $("#insGuardar").show()
                $("#insGuardando").hide()
                $("#btns").html("<a class='btn btn-danger btn-sm' data-dismiss='modal' aria-label='Close' role='button'>Aceptar</a>");
                $("#msg").html("<center><p>" + response.Mensaje + "</p></center>");
                $('#modal_msg').modal({backdrop: 'static', keyboard: true, show: true})
            }
        },
        beforeSend: function () {

        }
    }).fail(function (jqXHR, textStatus, errorThrown) {
        $("#btns").html("<input data-dismiss='modal' aria-label='Close' class='btn btn-primary m-r-1em' value='Aceptar'/>");
        $("#msg").html("<center><p>" + jqXHR + " " + textStatus + " " + errorThrown + "</center>");
        $("#modal_msg").modal('show');
        $("#insGuardar").show()
        $("#insGuardando").hide()
    });

}