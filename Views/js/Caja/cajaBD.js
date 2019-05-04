/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 * 
 */

function Caja_Estado() {

    var idsede = localStorage.getItem("id_sede")

    var dataserver = idsede + '|' + 'data'
    var dataserverb = window.btoa(dataserver);
    var request = {
        "cajaxsede": dataserverb
    };

    $.ajax({
        type: 'POST',
        url: base + 'ServerShakeIt/Servicios/Caja.php',
        data: request,
        dataType: 'json',
        success: function (response) {

            if (response.Respuesta != 0) {
                localStorage.setItem('caja', response.Respuesta[0].estado_caja);

                if (response.Respuesta[0].estado_caja == 4) {

                    $('#abrirCaja').hide('fast');
                    $('#cerrarCaja').show('fast');
                    Get_Ventas(response.Respuesta[0].valor_caja);
                }

                if (response.Respuesta[0].estado_caja == 5) {
                    $('#cerrarCaja').hide('fast');
                    $('#abrirCaja').show('fast');
                    $('#caja_din').val(response.Respuesta[0].valor_caja);
                }
            } else {
                $("#btns").html('<center><a class="btn btn_sh_normal" href="inicio.html" role="button">aceptar</a></center>');
                $("#msg").html("<center><p>No xiste información de caja para esta sede</p></center>");
                $("#modal_msg").modal({backdrop: 'static', keyboard: true, show: true});
            }


        }
    });

}

function Verificar_IdInventario(input) {
    //debugger
    var idinv = $(input).val();
    var estadoCaja = parseInt(localStorage.getItem('caja'))

    var dataserver = idinv + '|' + 'data';
    var dataserverb = window.btoa(dataserver);
    var request = {
        "inventarioiden": dataserverb
    };

    $.ajax({
        type: 'POST',
        url: base + 'ServerShakeIt/Servicios/Inventario.php',
        data: request,
        dataType: 'json',
        success: function (response) {
            //debugger
            if (response.Respuesta != 0) {
                if (response.Respuesta[0].fk_estado == 4 && estadoCaja == 4) {
                    $("#msg_alert_modG").html("<center><p>El identificador escrito pertenece a una caja abierta.</center>");
                    $("#msg_alert_modG").show('fast');
                    $("#msg_alert_mod").html("<center><p>El identificador escrito pertenece a una caja abierta.</center>");
                    $("#msg_alert_mod").show('fast');
                    $(input).focus();
                    $(input).addClass('is-invalid');
                    localStorage.setItem('Iden_inventario', 0);
                } else {
                    if (response.Respuesta[0].fk_estado == 5 && estadoCaja == 5) {
                        $("#msg_alert_modG").html("<center><p>El identificador escrito pertenece a una caja cerrada.</center>");
                        $("#msg_alert_modG").show('fast');
                        $("#msg_alert_mod").html("<center><p>El identificador escrito pertenece a una caja cerrada.</center>");
                        $("#msg_alert_mod").show('fast');
                        $(input).focus();
                        $(input).addClass('is-invalid');
                        localStorage.setItem('Iden_inventario', 0);
                    } else {
                        $(input).addClass('is-valid');
                        localStorage.setItem('Iden_inventario', 1);
                    }
                }


            } else {
                $("#msg_alert_modG").html("<center><p>El identificador escrito no existe.</center>");
                $("#msg_alert_modG").show('fast');
                $("#msg_alert_mod").html("<center><p>El identificador escrito no existe.</center>");
                $("#msg_alert_mod").show('fast');
                $(input).focus();
                $(input).addClass('is-invalid');
                localStorage.setItem('Iden_inventario', 0);
            }
        }
    });

}

function Get_Ventas(caja) {

    var idsede = localStorage.getItem("id_sede");

    var sql = "call Ventas_GetTotal(" + idsede + ");"
    con.query(sql, function (err, results, fields) {
        numRows = results[0].length;

        if (numRows > 0) {

            var valCaja = parseInt(caja) + parseInt(results[0][0].total_ventas)
            $('#caja_dinc').val(valCaja);
            $('#caja_dincaux').val(valCaja);
            $('#caja_ventasc').val(results[0][0].total_ventas)

        }
    });

}

function guardarCajaInfo(val, est) {

    var idsede = localStorage.getItem("id_sede")
    var estado;

    if (est == 4) {
        estado = "abierta";
    } else {
        estado = "cerrada";
    }

    var dataserver = val + '|' + est + '|' + idsede
    var dataserverb = window.btoa(dataserver);
    var request = {
        "insertar": dataserverb
    };

    $.ajax({
        type: 'POST',
        url: base + 'ServerShakeIt/Servicios/Caja.php',
        data: request,
        dataType: 'json',
        success: function (response) {
            debugger
            if (response.Respuesta != 0) {

                if (guardarCajaInfoLocal(val, est) == true) {

                    localStorage.setItem('Venta_Num', 0);
                    localStorage.setItem('caja', est)

                    $("#btns").html('<center><a class="btn btn_sh_normal" href="inicio.html" role="button">Aceptar</a></center>');
                    $("#msg").html("<center><p>Caja " + estado + " con éxito</p></center > ");
                    $("#modal_msg").modal({backdrop: 'static', keyboard: true, show: true});

                } else {
                    $("#msg_alert_modG").html("<center><p>Error al guardar datos locales.</center>");
                    $("#msg_alert_modG").show('fast');
                    $("#msg_alert_mod").html("<center><p>Error al guardar datos locales.</center>");
                    $("#msg_alert_mod").show('fast');
                }

            } else {
                $("#btns").html('<center><a class="btn btn_sh_normal" href="inicio.html" role="button">Aceptar</a></center>');
                $("#msg").html("<center><p>No xiste información de caja para esta sede</p></center>");
                $("#modal_msg").modal({backdrop: 'static', keyboard: true, show: true});
            }


        }
    });

}

function guardarCajaInfoLocal(val, est) {

    var idsede = localStorage.getItem("id_sede")
    var cont = 0;
    var sql = "CALL Caja_Add('" + val + "', '" + est + "', '" + idsede + "');";
    con.query(sql, function (err, results, fields) {

        if (err) {
            cont++;
        }
    });

    if (cont > 0) {
        return false
    } else {
        return true
    }

}

