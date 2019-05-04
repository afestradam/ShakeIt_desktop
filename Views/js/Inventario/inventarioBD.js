
function show_Iventario(id) {

    $("#invActualizar").show()
    $("#invActualizando").hide()
    var sql = "call Inventario_GetXId(" + id + ");"
    con.query(sql, function (err, results, fields) {
        numRows = results[0].length;

        if (numRows > 0) {

            $("#inv_ide").val(results[0][0].id_inventario);
            $("#inv_inse").val(results[0][0].fk_insumo);
            $("#inv_cante").val(results[0][0].cantidad_inventario);
            $("#inv_unidade").val(results[0][0].unidad);
            $('#inv_mod_editar').modal({backdrop: 'static', keyboard: true, show: true})
        } else {
            $("#btns").html("<center><input data-dismiss='modal' aria-label='Close' class='btn btn-primary m-r-1em' value='Aceptar'/></center>");
            $("#msg").html("<center><p>No existe información.</p></center>");
            $("#modal_msg").modal({backdrop: 'static', keyboard: true, show: true});
        }
    });
}

function Get_Inventaio() {
    $('#modal_msg').modal("hide")
    $('#tab_InvBody').html('<div class="text-center">\n\
                            <div class="spinner-border" role="status">\n\
                                <span class="sr-only">Loading...</span>\n\
                            </div>\n\
                            </div>');
    var idSede = localStorage.getItem("id_sede");

    var sql = "call Inventario_GetXSede(" + idSede + ");";
    con.query(sql, function (err, results, fields) {
        numRows = results[0].length;
        //debugger
        if (numRows > 0) {
            $('#tab_InvBody').html("");
            results[0].forEach(function (element) {
                $('#tab_InvBody').append('<tr>\n\
                       <th scope="row">' + element.id_inventario + '</th>\n\
                       <td>' + element.nom_insumo + '</td>\n\
                       <td>' + element.cantidad_inventario + '</td>\n\
                       <td>' + element.unidad + '</td>\n\
                       <td>' + element.nom_sede + '</td>\n\
                       <td><a class="btn btn-primary btn-sm" href="javascript: show_Iventario(' + element.id_inventario + ')" role="button">Editar</a>\n\
                       </td><td><a class="btn btn-danger btn-sm" href="javascript: confirmarEliminar(' + element.id_inventario + ')" role="button">Eliminar</a></td>\n\
                       </tr>');
            });
        } else {
            $('#tab_InvBody').html("");
            $('#tab_InvBody').html("<center><p>No existe información.</p></center>");
        }
    });
}

function update_inventario() {
    
    var id = $("#inv_ide").val();
    var ins = $("#inv_inse").val();
    var cant = $("#inv_cante").val();
    var sed = localStorage.getItem("id_sede");

    $("#invActualizar").hide()
    $("#invActualizando").show()

    var sql = "CALL Inventario_Update('" + id + "', '" + ins + "', '" + cant + "', '" + sed + "');";
    con.query(sql, function (err, results, fields) {

        if (err) {
            throw err;
        } else {
            if (navigator.onLine) {
                update_inventarioS(id, ins, cant, sed);
            } else {
                ('#msg_alert_mod').html('<p>Error al actualizar insumo en la nube.</p>');
                $('#msg_alert_mod').show('fast')
            }
        }

    })
}

function update_inventarioS(id, ins, cant, sed) {

    var dataserver = id + '|' + ins + '|' + cant + '|' + sed
    var dataserverb = window.btoa(dataserver);
    var insumo = {
        "actualizar": dataserverb
    };

    console.log(dataserverb);

    $.ajax({
        type: 'POST',
        url: base + 'ServerShakeIt/Servicios/Inventario.php',
        data: insumo,
        dataType: 'json',
        success: function (response) {
            if (response.Respuesta != 0) {
                $('#inv_mod_editar').modal('hide')
                $("#btns").html("<a class='btn btn-danger btn-sm' href='javascript: Get_Inventaio()()' role='button'>Aceptar</a>");
                $("#msg").html("<center><p>" + response.Mensaje + "</p></center>");
                $('#modal_msg').modal({backdrop: 'static', keyboard: true, show: true})
            } else {
                $("#invActualizar").show()
                $("#invActualizando").hide()
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
        $("#invActualizar").show()
        $("#invActualizando").hide()
    });

}

function delete_inventario(id) {

    var sql = "CALL Inventario_Delete('" + id + "');";
    con.query(sql, function (err, results, fields) {

        if (err) {
            throw err;
        } else {
            if (navigator.onLine) {
                delete_inventarioS(id);
            } else {
                 $("#btns").html("<a class='btn btn-danger btn-sm' data-dismiss='modal' aria-label='Close' role='button'>Aceptar</a>");
                $("#msg").html("<center><p>Error al eliminar en la nube</p></center>");
                $('#modal_msg').modal({backdrop: 'static', keyboard: true, show: true})
            }
        }

    })
}

function delete_inventarioS(id) {

    var dataserver = id + '|' + "Dato"
    var dataserverb = window.btoa(dataserver);
    var inventario = {
        "eliminar": dataserverb
    };

    console.log(dataserverb);

    $.ajax({
        type: 'POST',
        url: 'http://localhost/ServerShakeIt/Servicios/Inventario.php',
        data: inventario,
        dataType: 'json',
        success: function (response) {
            if (response.Respuesta != 0) {
                $("#btns").html("<a class='btn btn-danger btn-sm' href='javascript: Get_Inventaio()' role='button'>Aceptar</a>");
                $("#msg").html("<center><p>" + response.Mensaje + "</p></center>");
                $('#modal_msg').modal({backdrop: 'static', keyboard: true, show: true})
            } else {
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

function insert_inventario() {

    var ins = $("#inv_ins").val();
    var cant = $("#inv_cant").val();
    var sed = localStorage.getItem("id_sede");

    $("#invGuardar").hide()
    $("#invGuardando").show()

    var sql = "CALL Inventario_Add('" + ins + "', '" + cant + "', '" + sed + "');";
    con.query(sql, function (err, results, fields) {

        if (err) {
            throw err;
        } else {
            if (navigator.onLine) {
                insert_inventarioS(ins, cant, sed);
            } else {
                $('#msg_alert_modG').html('<p>Error al guardar producto en la nube.</p>');
                $('#msg_alert_modG').show('fast')
            }
        }

    })
}

function insert_inventarioS(ins, cant, sed) {

    var dataserver = ins + '|' + cant + '|' + sed;
    var dataserverb = window.btoa(dataserver);
    var inventario = {
        "insertar": dataserverb
    };

    console.log(dataserverb);

    $.ajax({
        type: 'POST',
        url: base + 'ServerShakeIt/Servicios/Inventario.php',
        data: inventario,
        dataType: 'json',
        success: function (response) {
            if (response.Respuesta != 0) {
                $('#inv_mod_guardar').modal('hide')
                $("#btns").html("<a class='btn btn-danger btn-sm' href='javascript: Get_Inventaio()' role='button'>Aceptar</a>");
                $("#msg").html("<center><p>" + response.Mensaje + "</p></center>");
                $('#modal_msg').modal({backdrop: 'static', keyboard: true, show: true})
            } else {
                $("#invGuardar").show()
                $("#invGuardando").hide()
                $('#msg_alert_mod').html("<center><p>" + response.Mensaje + "</p></center>");
                $('#msg_alert_mod').show('fast')
            }
        },
        beforeSend: function () {

        }
    }).fail(function (jqXHR, textStatus, errorThrown) {
        $('#msg_alert_mod').html("<center><p>" + jqXHR + " " + textStatus + " " + errorThrown + "</center>");
        $('#msg_alert_mod').show('fast');
        $("#invGuardar").show()
        $("#invGuardando").hide()
    });

}

function Get_InsiumoXId(d, input) {

    var id = $(d).val();

    var sql = "call Insumos_GetXId(" + id + ");"
    con.query(sql, function (err, results, fields) {
        numRows = results[0].length;

        if (numRows > 0) {
            $(input).val(results[0][0].nomSI_unidad);
        } else {
            $(input).val('');
        }
    });
}