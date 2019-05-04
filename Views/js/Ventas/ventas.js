//Agregar a tabla
function agregar() {

    var id = $('#s-productos').val();
    var sql = "call Productos_getXid(" + id + ");";
    con.query(sql, function (err, results, fields) {
        numRows = results[0].length;
        //debugger
        if (numRows > 0) {
            var nom = results[0][0].nom_producto;
            var cant = $('#s-cantidad').val();
            var cat = results[0][0].nomcategoria;
            var vuni = results[0][0].precio_producto;
            var vtot = cant * vuni;

            if ($("#s-btn-descuento").hasClass('btn-light')) {
                var desc = $('#s-descuento').val() / 100;
                var vdesc = vtot * desc;
                vtot = vtot - vdesc;
                $("#s-resumen").append("<tr id='fil" + id + "' name='" + id + "' data-prod='" + id + "' data-prodnom='" + nom + "' data-cant='" + cant + "' data-prodtot='" + vtot + "' data-desc='" + desc + "'><td>" + id + "</td><td>" + nom + " - Descuento del " + $('#s-descuento').val() + "%" + "</td><td>" + cant + "</td><td>" + cat + "</td><td id='valor_car'>" + vuni + "</td><td id='valor_car'>" + vtot + "</td><td><input type='button' class='btn btn-primary' id='lessitem' value='Eliminar' onclick='removef(" + id + "," + vtot + ")'></td></tr>");
                $("#s-div-idescuento-sub").remove();
                $("#s-btn-descuento").addClass('btn-info');
                $("#s-btn-descuento").removeClass('btn-light');
            } else {

                $("#s-resumen").append("<tr id='fil" + id + "' name='" + id + "' data-prod='" + id + "' data-prodnom='" + nom + "' data-cant='" + cant + "' data-prodtot='" + vtot + "' data-desc='0'><td>" + id + "</td><td>" + nom + "</td><td>" + cant + "</td><td>" + cat + "</td><td id='valor_car'>" + vuni + "</td><td id='valor_car'>" + vtot + "</td><td><input type='button' class='btn btn-primary' id='lessitem' value='Eliminar' onclick='removef(" + id + "," + vtot + ")'></td></tr>");
            }
            var tot = parseFloat($("#s-subtotal").val());
            var valp = parseFloat(vtot);
            var res = tot + valp;
            $("#s-subtotal").val("");
            $("#s-subtotal").val(res);
            limpiar_campos();
        } else {
            $("#btns").html("<center><input data-dismiss='modal' aria-label='Close' class='btn btn-primary m-r-1em' value='Aceptar'/></center>");
            $("#msg").html("<center><p>No existe información para este producto.</p></center>");
            $("#modal_msg").modal('show');
        }
    });
}

function agregar_Regalo() {

    var id = $('#s-productos').val();
    var sql = "call Productos_getXid(" + id + ");";
    con.query(sql, function (err, results, fields) {
        numRows = results[0].length;
        //debugger
        if (numRows > 0) {
            var nom = results[0][0].nom_producto;
            var cant = $('#s-cantidad').val();
            var cat = results[0][0].nomcategoria;
            var vuni = 0;
            var vtot = cant * vuni;
            $("#s-resumen").append("<tr id='fil" + id + "' name='" + id + "' valorc='" + vtot + "'><td>" + id + "</td><td>" + nom + " - Regalo" + "</td><td>" + cant + "</td><td>" + cat + "</td><td id='valor_car'>" + vuni + "</td><td id='valor_car'>" + vtot + "</td><td><input type='button' class='btn btn-primary' id='lessitem' value='Eliminar' onclick='removef(" + id + "," + vtot + ")'></td></tr>");
            var tot = parseFloat($("#s-subtotal").val());
            var valp = parseFloat(vtot);
            var res = tot + valp;
            $("#s-subtotal").val("");
            $("#s-subtotal").val(res);
            limpiar_campos();
        } else {
            $("#btns").html("<center><input data-dismiss='modal' aria-label='Close' class='btn btn-primary m-r-1em' value='Aceptar'/></center>");
            $("#msg").html("<center><p>No existe información para este producto.</p></center>");
            $("#modal_msg").modal('show');
        }
    });
}

function btndescuento() {
    if ($("#s-btn-descuento").hasClass('btn-info')) {
        $("#s-div-idescuento").html('<div id="s-div-idescuento-sub"><label for="s-descuento">Decuento</label><input type="number" class="form-control" id="s-descuento" placeholder="Porcentaje(%)" campo="Descuento" name="gventa" value="" min="0" max="100" onkeyup="validar_descuento()"></div>');
        $("#s-btn-descuento").removeClass('btn-info');
        $("#s-btn-descuento").addClass('btn-light');
    } else {
        $("#s-div-idescuento-sub").remove();
        $("#s-btn-descuento").addClass('btn-info');
        $("#s-btn-descuento").removeClass('btn-light');
    }
}

function validar_descuento() {

    if ($("#s-descuento").val() > 100 || $("#s-descuento").val() < 1) {
        $("#btns").html("<a href='#'><input data-dismiss='modal' aria-label='Close' class='btn btn-primary m-r-1em' value='Aceptar'/></a>");
        $("#msg").html("<center><p>El valor del porcentaje no puede ser menor a 1 y tampoco mayor a 100.</p></center>");
        $("#modal_msg").modal('show');
        $("#s-descuento").val("")
        $("#s-descuento").focus()
    }
}

function limpiar_campos() {
    $('#s-productos').val("");
    $('#s-precio').val(0);
    $('#s-cantidad').val(0);
}

function cancelar_venta() {

    $('#s-resumen').html('');
    limpiar_campos();

}

//Eliminar producto de tabla
function removef(d, v) {
    $("#fil" + d).remove();

    var tot = $("#s-subtotal").val();
    var ser_v = v;
    var res = tot - ser_v;
    $("#s-subtotal").val("");
    $("#s-subtotal").val(res);
}

//Pasar a confirmación de venta
function finalizarVenta() {

    var rowCount = $('#s-resumen tr').length;

    if (rowCount == 0) {

        $("#btns").html("<a href='#'><input data-dismiss='modal' aria-label='Close' class='btn btn-primary m-r-1em' value='Aceptar'/></a>");
        $("#msg").html("<center><p>No hay ventas pendientes por finalizar.</p></center>");
        $("#modal_msg").modal('show');

    } else {
        $('#vtotalh1').html($('#s-subtotal').val());
        get_ConsumosSel('#combo_consumo');
        get_EntidadesSel('#combo_entidad');
        $('#modal_Confirmar').modal({backdrop: 'static', keyboard: false, show: true});
        $('#con_btns').html('<a class="btn btn-danger" id="con_btns_canc" href="#" data-dismiss="modal" aria-label="Close" role="button">Cancelar</a>\n\
                             <a class="btn btn-primary" id="con_btns_conf" href="javascript: confirmaVenta()" role="button">Confirmar</a>\n\
                             <a class="btn btn-primary backText" id="con_btns_acept" href="ventas.html" role="button">Aceptar</a>');
    }

}

//Aciones en confirmar venta
function consumo() {

    var consumo = $('#combo_consumo').val();

    if (consumo == 1) {
        Get_DepartamentosSel('#cli_dep')
        $('#cli_form').show('fast');
        $('#cli_dep').val(parseInt(localStorage.getItem('depid_sede')));
        Get_MunicipioSel('#cli_mun', '#cli_dep')
        $('#cli_mun').val(parseInt(localStorage.getItem('munid_sede')));

    } else {

        $('#cli_form').hide('fast');

    }

}

function medioEfectivo() {

    if ($('#mEfectivo').hasClass('btn-primary')) {

        $('#mElectronico').removeClass('btn-light');
        $('#mElectronico').addClass('btn-primary');

        $('#mEfectivo').removeClass('btn-primary');
        $('#mEfectivo').addClass('btn-light');

        $('#dinero_recibido').prop('disabled', false);
        $('#dinero_recibido').val(0);
        $('#input_mediopago').val(1);
        $('#div_entidad').hide('fast');
        $('#combo_entidad').val(5);
        $('#dinero_recibido').focus()
    }
}

function medioEelectronico() {

    if ($('#mElectronico').hasClass('btn-primary')) {

        $('#mEfectivo').removeClass('btn-light');
        $('#mEfectivo').addClass('btn-primary');

        $('#mElectronico').removeClass('btn-primary');
        $('#mElectronico').addClass('btn-light');

        $('#dinero_recibido').prop('disabled', true);
        $('#dinero_recibido').val($('#s-subtotal').val());
        $('#vcambioh1').html('0')
        $('#input_mediopago').val(2);
        $('#combo_entidad').val('');
        $('#div_entidad').show('fast');

    }
}

function validaDinero() {
    if (parseInt($('#dinero_recibido').val()) < 0) {
        $('#msg_dinrec').html('El valor ingresado no puede ser menor a 0')
        $('#msg_dinrec').show('slow')
        $('#dinero_recibido').focus()
    } else {
        if (parseInt($('#dinero_recibido').val()) < parseInt($('#s-subtotal').val())) {
            $('#msg_dinrec').html('El valor ingresado no puede ser menor al total de la venta')
            $('#msg_dinrec').show('slow')
            $('#dinero_recibido').focus()
        } else {
            if (parseInt($('#dinero_recibido').val()) == 0) {
                $('#msg_dinrec').html('El valor ingresado no puede ser 0')
                $('#msg_dinrec').show('slow')
                $('#dinero_recibido').focus()
            } else {
                var cambio = parseInt($('#dinero_recibido').val()) - parseInt($('#s-subtotal').val())
                $('#vcambioh1').html(cambio)
                $('#msg_dinrec').hide('slow')
                return true;
            }
        }
    }
}

function confirmaVenta() {

    var val = ValidarCamposAlert('conf_v');
    var cli = ValidarCamposAlert('cli_v');
    var consumo = $('#combo_consumo').val();

    if (consumo == 1) {
        if (cli == true) {
            if (val == true) {
                if (validaDinero() == true) {
                    if (navigator.onLine) {
                        insert_ClienteS();
                        GuardarInfoOnline();
                    } else {
                        insert_Cliente();
                        GuardarInfoOffline();
                    }

                }

            }
        }
    } else {
        if (val == true) {
            if (validaDinero() == true) {
                if (navigator.onLine) {
                    GuardarInfoOnline();
                } else {
                    GuardarInfoOffline();
                }

            }

        }
    }

}

function GuardarInfoOnline() {

    var pasoVenta = parseInt(localStorage.getItem('Paso_Venta'));

    switch (pasoVenta) {

        case 0:
            update_restarInsumosS()
            break;
        case 1:
            insert_ProductosVendidosS()
            break;
        case 2:
            insert_InsumosVendidosS();
            break;
        case 3:
            insert_VentaS();
            break;

    }

}

function GuardarInfoOffline() {

    var pasoVenta = parseInt(localStorage.getItem('Paso_Venta'));

    $('#confirmav').hide('fast');
    $('#procesandov').show('fast');
    $('#con_btns_canc').addClass('disabled');
    $('#con_btns_conf').addClass('disabled');

    switch (pasoVenta) {

        case 0:
            if (RecorrerProductoRI() == true) {
                if (insert_ProductosVendidos(0) == true) {
                    if (RecorrerProductoIV(0) == true) {
                        if (insert_Venta(0) == true) {
                            $('#finalizav').show('fast');
                            $('#procesandov').hide('fast');
                            $('#con_btns_canc').hide('fast');
                            $('#con_btns_conf').hide('fast');
                            $('#con_btns_acept').show('fast');
                        }
                    }
                }
            }
            break;
        case 5:
            if (insert_ProductosVendidos(0) == true) {
                if (RecorrerProductoIV(0) == true) {
                    if (insert_Venta(0) == true) {
                        $('#finalizav').show('fast');
                        $('#procesandov').hide('fast');
                        $('#con_btns_canc').hide('fast');
                        $('#con_btns_conf').hide('fast');
                        $('#con_btns_acept').show('fast');
                    }
                }
            }
            break;
        case 6:
            if (RecorrerProductoIV(0) == true) {
                if (insert_Venta(0) == true) {
                    $('#finalizav').show('fast');
                    $('#procesandov').hide('fast');
                    $('#con_btns_canc').hide('fast');
                    $('#con_btns_conf').hide('fast');
                    $('#con_btns_acept').show('fast');
                }
            }
            break;
        case 7:
            if (insert_Venta(0) == true) {
                $('#finalizav').show('fast');
                $('#procesandov').hide('fast');
                $('#con_btns_canc').hide('fast');
                $('#con_btns_conf').hide('fast');
                $('#con_btns_acept').show('fast');
            }
            break;

    }
}
//Operaciones

function RecorrerProductos() {

    var datos = [];

    $("#tabVentas > tbody > tr").each(function () {

        var idpro = $(this).data("prod")
        var cant = $(this).data("cant")
        var desc = $(this).data("desc")
        var sede = localStorage.getItem("id_sede")
        var fac = localStorage.getItem("iden_sede") + anio + mes + dia + "-" + NumeroVenta

        var items = {"pro": idpro, "cant": cant, "desc": desc, "sede": sede, "fac": fac};
        datos.push(items);
    });
    return datos;
    //update_restarInsumosS(datos);
}

function TotalCantidad() {

    var total = 0;

    $("#tabVentas > tbody > tr").each(function () {

        var cant = $(this).data("cant")
        var sum = total + cant;
        total = sum;
    });
    return total;
}

function pruebadefunciones() {
    GuardarInfoOffline();
//update_restarInsumosS();
    //insert_ProductosVendidosS()
    //insert_InsumosVendidosS();
    //insert_VentaS();

}
//-------------------------------------------------------------------------------------------------------------------------
$(document).ready(function () {
    botones();
    localStorage.setItem('Venta_Num', parseInt(localStorage.getItem('Venta_Num')) + 1);
    localStorage.setItem('Paso_Venta', 0);
});
