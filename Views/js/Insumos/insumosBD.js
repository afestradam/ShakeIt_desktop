/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function show_Insumo(id) {

    var sql = "call Insumos_GetXId(" + id + ");"
    con.query(sql, function (err, results, fields) {
        numRows = results[0].length;

        if (numRows > 0) {
            $('#ins_ide').val(results[0][0].id_insumo)
            $('#ins_nome').val(results[0][0].nom_insumo)
            $('#ins_cante').val(results[0][0].cantmin_insumo)
            $('#ins_unie').val(results[0][0].id_unidad)
            $('#ins_mod_editar').modal({backdrop: 'static', keyboard: true, show: true})
        } else {
            $("#btns").html("<center><input data-dismiss='modal' aria-label='Close' class='btn btn-primary m-r-1em' value='Aceptar'/></center>");
            $("#msg").html("<center><p>No existe información.</p></center>");
            $("#modal_msg").modal({backdrop: 'static', keyboard: true, show: true});
        }
    });
}

function Get_Insumos() {
    var sql = "call Insumos_Get();";
    con.query(sql, function (err, results, fields) {
        numRows = results[0].length;
        //debugger
        if (numRows > 0) {
            results[0].forEach(function (element) {
                $('#tab_InsBody').append('<tr>\n\
                       <th scope="row">' + element.id_insumo + '</th>\n\
                       <td>' + element.nom_insumo + '</td>\n\
                       <td>' + element.nomSI_unidad + '</td>\n\
                       <td><a class="btn btn_sh_normal btn-sm" href="javascript: show_Insumo(' + element.id_insumo + ')" role="button">Editar</a>\n\
                       </td><td><a class="btn btn-danger btn-sm" href="javascript: confirmarEliminar(' + element.id_insumo + ')" role="button">Eliminar</a></td>\n\
                       </tr>');
            });
        } else {
            $("#tab_InsBody");
            $("#tab_InsBody").html("<center><p>No existe información.</p></center>");
        }
    });
}

function Get_Unidades(select) {
    var sql = "call Unidades_Get();"
    con.query(sql, function (err, results, fields) {
        numRows = results[0].length;

        if (numRows > 0) {
            $(select).html("")
            $(select).html("<option value='' selected>Seleccione Unidad</option>")
            results[0].forEach(function (element) {
                $(select).append('\
                  <option value="' + element.id + '">' + element.nom + '</option>\n\
                  ');
            });
        } else {
            $("#btns").html("<center><input data-dismiss='modal' aria-label='Close' class='btn btn-primary m-r-1em' value='Aceptar'/></center>");
            $("#msg").html("<center><p>No existe información</p></center>");
            $("#modal_msg").modal('show');
            $("#ingresar").show();
            $("#ingresando").hide();
        }
    });
}

function update_insumos() {

    var id = $('#ins_ide').val();
    var nom = $('#ins_nome').val();
    var uni = $('#ins_unie').val();
    var cmin = $('#ins_cante').val();

    $("#insActualizar").hide()
    $("#insActualizando").show()

    var sql = "CALL Insumos_Update('" + id + "', '" + nom + "', '" + uni + "', '" + cmin + "');";
    con.query(sql, function (err, results, fields) {

        if (err) {
            throw err;
        } else {
            if (navigator.onLine) {
                update_insumosS(id, nom, uni, cmin);
            } else {
                ('#msg_alert_mod').html('<p>Error al guardar producto en la nube.</p>');
                $('#msg_alert_mod').show('fast')
            }
        }

    })
}

function update_insumosS(id, nom, uni, cmin) {

    var dataserver = id + '|' + nom + '|' + uni + '|' + cmin
    var dataserverb = window.btoa(dataserver);
    var insumo = {
        "actualizar": dataserverb
    };

    console.log(dataserverb);

    $.ajax({
        type: 'POST',
        url: base + 'ServerShakeIt/Servicios/Insumos.php',
        data: insumo,
        dataType: 'json',
        success: function (response) {
            if (response.Respuesta != 0) {
                $('#ins_mod_editar').modal('hide')
                $("#btns").html("<a class='btn btn-danger btn-sm' href='ListInsumos.html' role='button'>Aceptar</a>");
                $("#msg").html("<center><p>" + response.Mensaje + "</p></center>");
                $('#modal_msg').modal({backdrop: 'static', keyboard: true, show: true})
            } else {
                $("#insActualizar").show()
                $("#insActualizando").hide()
                $('#ins_mod_editar').modal('hide')
                $("#btns").html("<a class='btn btn-danger btn-sm' data-dismiss='modal' aria-label='Close' role='button'>Aceptar</a>");
                $("#msg").html("<center><p>" + response.Mensaje + "</p></center>");
                $('#modal_msg').modal({backdrop: 'static', keyboard: true, show: true})
            }
        },
        beforeSend: function () {

        }
    }).fail(function (jqXHR, textStatus, errorThrown) {
        $('#ins_mod_editar').modal('hide')
        $("#btns").html("<input data-dismiss='modal' aria-label='Close' class='btn btn-primary m-r-1em' value='Aceptar'/>");
        $("#msg").html("<center><p>" + jqXHR + " " + textStatus + " " + errorThrown + "</center>");
        $("#modal_msg").modal('show');
        $("#insActualizar").show()
        $("#insActualizando").hide()
    });

}

function delete_insumos(id) {

    var sql = "CALL Insumos_Delete('" + id + "');";
    con.query(sql, function (err, results, fields) {

        if (err) {
            throw err;
        } else {
            if (navigator.onLine) {
                delete_insumosS(id);
            } else {
                ('#msg_alert_mod').html('<p>Error al eiminar información en la nube.</p>');
                $('#msg_alert_mod').show('fast')
            }
        }

    })
}

function delete_insumosS(id) {

    var dataserver = id + '|' + "Dato"
    var dataserverb = window.btoa(dataserver);
    var insumo = {
        "eliminar": dataserverb
    };

    console.log(dataserverb);

    $.ajax({
        type: 'POST',
        url: base + 'ServerShakeIt/Servicios/Insumos.php',
        data: insumo,
        dataType: 'json',
        success: function (response) {
            if (response.Respuesta != 0) {
                $('#ins_mod_editar').modal('hide')
                $("#btns").html("<a class='btn btn-danger btn-sm' href='ListInsumos.html' role='button'>Aceptar</a>");
                $("#msg").html("<center><p>" + response.Mensaje + "</p></center>");
                $('#modal_msg').modal({backdrop: 'static', keyboard: true, show: true})
            } else {
                $('#ins_mod_editar').modal('hide')
                $("#btns").html("<a class='btn btn-danger btn-sm' data-dismiss='modal' aria-label='Close' role='button'>Aceptar</a>");
                $("#msg").html("<center><p>" + response.Mensaje + "</p></center>");
                $('#modal_msg').modal({backdrop: 'static', keyboard: true, show: true})
            }
        },
        beforeSend: function () {

        }
    }).fail(function (jqXHR, textStatus, errorThrown) {
        $('#ins_mod_editar').modal('hide')
        $("#btns").html("<input data-dismiss='modal' aria-label='Close' class='btn btn-primary m-r-1em' value='Aceptar'/>");
        $("#msg").html("<center><p>" + jqXHR + " " + textStatus + " " + errorThrown + "</center>");
        $("#modal_msg").modal('show');
        $("#ingresar").show();
        $("#ingresando").hide();
    });

}

function insert_insumos() {

    var nom = $('#ins_nomg').val();
    var uni = $('#ins_unig').val();
    var cant = $('#ins_cantg').val();

    $("#insGuardar").hide()
    $("#insGuardando").show()

    var sql = "CALL Insumos_Add('" + nom + "', '" + uni + "', '" + cant + "');";
    con.query(sql, function (err, results, fields) {

        if (err) {
            throw err;
        } else {
            if (navigator.onLine) {
                insert_insumosS(nom, uni, cant);
            } else {
                ('#msg_alert_mod').html('<p>Error al guardar producto en la nube.</p>');
                $('#msg_alert_mod').show('fast')
            }
        }

    })
}

function insert_insumosS(nom, uni, cant) {

    var dataserver = nom + '|' + uni + '|' + cant
    var dataserverb = window.btoa(dataserver);
    var insumos = {
        "insertar": dataserverb
    };

    console.log(dataserverb);

    $.ajax({
        type: 'POST',
        url: base + 'ServerShakeIt/Servicios/Insumos.php',
        data: insumos,
        dataType: 'json',
        success: function (response) {
            if (response.Respuesta != 0) {
                $("#btns").html("<a class='btn btn-danger bt  n-sm' href='RegInsumos.html' role='button'>Aceptar</a>");
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
