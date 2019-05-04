/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var fecha = new Date();
var NumeroVenta = localStorage.getItem('Venta_Num');
var anio = fecha.getYear() - 100;
var mes = fecha.getMonth() + 1;
var dia = fecha.getDate();


//Gets

function botones() {

    var sql = "call Categorias_GetPrincipales();"
    con.query(sql, function (err, results, fields) {
        numRows = results[0].length;
    
        if (numRows > 0) {
            results[0].forEach(function (element) {
                $('#divcat').append('<a href="javascript: getdatacat(' + element.idcategoria + ",'" + element.nomcategoria + "'" + ')" class="btn btn_v">' + element.nomcategoria + '</a>');
            });
            $('#divcat').append('<a href="inicio.html" class="btn btn_v">Salir</a>');
        } else {
            $("#btns").html("<center><input data-dismiss='modal' aria-label='Close' class='btn btn-primary m-r-1em' value='Aceptar'/></center>");
            $("#msg").html("<center><p>No existe información para esta categoría.</p></center>");
            $("#modal_msg").modal('show');
            $("#ingresar").show();
            $("#ingresando").hide();
        }
    });
}

function milkshakes() {
    
    var sql = "call Categorias_GetSecundarias();"
    $('#divmilk').html("");
    con.query(sql, function (err, results, fields) {
        numRows = results[0].length;
        if (numRows > 0) {
            results[0].forEach(function (element) {
                $('#divmilk').append('<a href="javascript: getdatacat(' + element.idcategoria + ",'" + element.nomcategoria + "'" + ')" class="btn btn_v">' + element.nomcategoria + '</a>');
            });
        } else {
            $("#btns").html("<center><input data-dismiss='modal' aria-label='Close' class='btn btn-primary m-r-1em' value='Aceptar'/></center>");
            $("#msg").html("<center><p>No existe información para esta categoría.</p></center>");
            $("#modal_msg").modal('show');
            $("#ingresar").show();
            $("#ingresando").hide();
        }
    });
}

function getdatacat(id, nom) {
    
    var sql = "call Productos_GetXCategoria(" + id + ");";
    $('#s-productos').html('<option value="">Seeccione ' + nom + '</option>');
    if (id == 7 || id == 1 || id == 3 || id == 5 || id == 6 || id == 10) {
        milkshakes();
        $('#divmilk').show("fast");
    } else {
        $('#divmilk').hide("fast");
    }
    con.query(sql, function (err, results, fields) {
        numRows = results[0].length;
        ;
        if (numRows > 0) {
            results[0].forEach(function (element) {
                $('#s-productos').append('<option value="' + element.id_producto + '">' + element.nom_producto + '</option>');
            });
        } else {
            $("#btns").html("<center><input data-dismiss='modal' aria-label='Close' class='btn btn-primary m-r-1em' value='Aceptar'/></center>");
            $("#msg").html("<center><p>No existe información para esta categoría.</p></center>");
            $("#modal_msg").modal('show');
            $("#ingresar").show();
            $("#ingresando").hide();
        }
    });
}

function getdataprod() {

    var id = $('#s-productos').val();
    var sql = "call Productos_getXid(" + id + ");";
    con.query(sql, function (err, results, fields) {
        numRows = results[0].length;
        
        if (numRows > 0) {
            $('#s-precio').val(results[0][0].precio_producto);
            $('#s-cantidad').val(1);
        } else {
            $("#btns").html("<center><input data-dismiss='modal' aria-label='Close' class='btn btn-primary m-r-1em' value='Aceptar'/></center>");
            $("#msg").html("<center><p>No existe información para este producto.</p></center>");
            $("#modal_msg").modal('show');
            $("#ingresar").show();
            $("#ingresando").hide();
        }
    });
}

function get_consumos() {

    var sql = "call Consumo_Get();";
    con.query(sql, function (err, results, fields) {
        numRows = results[0].length;
        
        if (numRows > 0) {
            results[0].forEach(function (element) {
                $('#combo_consumo').append('<option value="' + element.id_consumo + '">' + element.nom_consumo + '</option>');
            });
        }
    });
}

//Resta de Inventario.

function update_restarInsumosS() {//Online
    
    var datos = RecorrerProductos();

    INFO = new FormData();
    var ainfo = JSON.stringify(datos);
    INFO.append('productos', ainfo);
    $.ajax({

        type: "POST",
        processData: false,
        contentType: false,
        cache: false,
        data: INFO,
        url: base + 'ServerShakeIt/Servicios/Inventario.php',
        success: function (response) {

            if (response.Respuesta != 0) {

                if (RecorrerProductoRI() == true) {
                    insert_ProductosVendidosS();
                    localStorage.setItem('Paso_Venta', 1);
                }

            } else {

                $("#msg_alert_mod").html("<center><p>" + response.Mensaje + "</center>");
                $("#msg_alert_mod").modal('show');
                $('#confirmav').show('fast');
                $('#procesandov').hide('fast');
                $('#con_btns_canc').removeClass('disabled');
                $('#con_btns_conf').removeClass('disabled');
            }
        },
        beforeSend: function () {
            $('#confirmav').hide('fast');
            $('#procesandov').show('fast');
            $('#con_btns_canc').addClass('disabled');
            $('#con_btns_conf').addClass('disabled');
        }
    }).fail(function (jqXHR, textStatus, errorThrown) {
        $("#msg_alert_mod").html("<center><p>" + jqXHR + " " + textStatus + " " + errorThrown + "</center>");
        $("#msg_alert_mod").modal('show');
        $('#confirmav').show('fast');
        $('#procesandov').hide('fast');
        $('#con_btns_canc').removeClass('disabled');
        $('#con_btns_conf').removeClass('disabled');
    });
}

function RecorrerProductoRI() { //Offline
    
    var datos = RecorrerProductos();
    var cont = 0;
    datos.forEach(function (element) {
        get_InsumosXProd(element.pro, element.cant, element.sede)
        if (get_InsumosXProd == false) {
            cont++
        }
    });
    if (cont > 0) {
        $("#msg_alert_mod").html("<center><p>Uno o más productos no se pudieron procesar</center>");
        $("#msg_alert_mod").modal('show');
        $('#confirmav').show('fast');
        $('#procesandov').hide('fast');
        $('#con_btns_canc').removeClass('disabled');
        $('#con_btns_conf').removeClass('disabled');
        return false
    } else {
        localStorage.setItem('Paso_Venta', 5);
        return true
    }
}

function get_InsumosXProd(id, cant, sede) {
    var cont = 0;
    var sql = "call Relacion_GetXProd(" + id + ");";
    con.query(sql, function (err, results, fields) {
        numRows = results[0].length;
        if (numRows > 0) {

            results[0].forEach(function (element) {
                update_RestarInventarioXProd(element.fk_insumo, element.insumoUnidad_rel, cant, sede);
            });
        } else {
            cont++;
        }

    });

    if (cont > 0) {
        return false;
    } else {
        return true;
    }

}

function update_RestarInventarioXProd(ins, cant, cantp, sede) {
    
    var cont = 0;
    var sql = "call Inventario_RestarCant('" + ins + "', '" + cant + "', '" + cantp + "', '" + sede + "');";
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

//Productos Vendidos

function insert_ProductosVendidosS() {//Online

    var datos = RecorrerProductos();

    INFO = new FormData();
    var ainfo = JSON.stringify(datos);
    INFO.append('insertar', ainfo);
    $.ajax({

        type: "POST",
        processData: false,
        contentType: false,
        cache: false,
        data: INFO,
        url: base + 'ServerShakeIt/Servicios/ProductosVendidos.php',
        success: function (response) {

            if (response.Respuesta != 0) {
                if (insert_ProductosVendidos(1) == true) {
                    insert_InsumosVendidosS();
                    localStorage.setItem('Paso_Venta', 2);
                }

            } else {

                $("#msg_alert_mod").html("<center><p>" + response.Mensaje + "</center>");
                $("#msg_alert_mod").show('fast');
                $('#confirmav').show('fast');
                $('#procesandov').hide('fast');
                $('#con_btns_canc').removeClass('disabled');
                $('#con_btns_conf').removeClass('disabled');
            }
        },
        beforeSend: function () {
            $('#confirmav').hide('fast');
            $('#procesandov').show('fast');
            $('#con_btns_canc').addClass('disabled');
            $('#con_btns_conf').addClass('disabled');
        }
    }).fail(function (jqXHR, textStatus, errorThrown) {
        $("#msg_alert_mod").html("<center><p>" + jqXHR + " " + textStatus + " " + errorThrown + "</center>");
        $("#msg_alert_mod").show('fast');
        $('#confirmav').show('fast');
        $('#procesandov').hide('fast');
        $('#con_btns_canc').removeClass('disabled');
        $('#con_btns_conf').removeClass('disabled');
    });
}

function insert_ProductosVendidos(web) {

    var datos = RecorrerProductos();

    var cont = 0;

    datos.forEach(function (element) {
        var sql = "CALL ProductosV_Add('" + element.pro + "', '" + element.cant + "', '" + element.desc + "', '" + element.fac + "', '" + element.sede + "', '" + web + "');";
        con.query(sql, function (err, results, fields) {
            if (err) {
                throw err;
                cont++
            }
        })
    })
    if (cont != 0) {
        $('#msg_alert_mod').html('<p>Error al guardar información localmente.</p>');
        $('#msg_alert_mod').show('fast')
        $('#confirmav').show('fast');
        $('#procesandov').hide('fast');
        $('#con_btns_canc').removeClass('disabled');
        $('#con_btns_conf').removeClass('disabled');
        return false
    } else {
        localStorage.setItem('Paso_Venta', 6);
        return true
    }

}

//Insumos  Vendidos

function insert_InsumosVendidosS() {//Online

    var datos = RecorrerProductos();

    INFO = new FormData();
    var ainfo = JSON.stringify(datos);
    INFO.append('productos', ainfo);
    $.ajax({

        type: "POST",
        processData: false,
        contentType: false,
        cache: false,
        data: INFO,
        url: base + 'ServerShakeIt/Servicios/InsumosVendidos.php',
        success: function (response) {

            if (response.Respuesta != 0) {

                if (RecorrerProductoIV(1) == true) {
                    insert_VentaS()
                    localStorage.setItem('Paso_Venta', 3);
                }

            } else {

                $("#msg_alert_mod").html("<center><p>" + response.Mensaje + "</center>");
                $("#msg_alert_mod").show('fast');
                $('#confirmav').show('fast');
                $('#procesandov').hide('fast');
                $('#con_btns_canc').removeClass('disabled');
                $('#con_btns_conf').removeClass('disabled');
            }
        },
        beforeSend: function () {
            $('#confirmav').hide('fast');
            $('#procesandov').show('fast');
            $('#con_btns_canc').addClass('disabled');
            $('#con_btns_conf').addClass('disabled');
        }
    }).fail(function (jqXHR, textStatus, errorThrown) {
        $("#msg_alert_mod").html("<center><p>" + jqXHR + " " + textStatus + " " + errorThrown + "</center>");
        $("#msg_alert_mod").show('fast');
        $('#confirmav').show('fast');
        $('#procesandov').hide('fast');
        $('#con_btns_canc').removeClass('disabled');
        $('#con_btns_conf').removeClass('disabled');
    });
}

function RecorrerProductoIV(web) { //Offline
    var datos = RecorrerProductos();
    var cont = 0;
    datos.forEach(function (element) {
        get_InsumosXProdIV(element.pro, element.cant, element.sede, web)
        if (get_InsumosXProd == false) {
            cont++
        }
    });
    if (cont > 0) {
        $("#msg_alert_mod").html("<center><p>Uno omás productos no se pudieron procesar</center>");
        $("#msg_alert_mod").show('fast');
        $('#confirmav').show('fast');
        $('#procesandov').hide('fast');
        $('#con_btns_canc').removeClass('disabled');
        $('#con_btns_conf').removeClass('disabled');
        return false
    } else {
        localStorage.setItem('Paso_Venta', 7);
        return true;
    }
}

function get_InsumosXProdIV(id, cant, sede, web) {

    var cont = 0;
    var sql = "call Relacion_GetXProd(" + id + ");";

    con.query(sql, function (err, results, fields) {
        numRows = results[0].length;
        if (numRows > 0) {

            results[0].forEach(function (element) {
                var result = Insert_InsumoVendido(element.fk_insumo, element.insumoUnidad_rel, sede, web);

                if (result == false) {

                    cont++;

                }

            });
        } else {
            return false;
        }

    });

    if (cont > 0) {
        return false
    } else {
        return true
    }

}

function Insert_InsumoVendido(ins, cant, sede, web) {
    var cont = 0
    var sql = "call InsumosV_Add('" + ins + "', '" + cant + "', '" + sede + "', '" + web + "');";
    con.query(sql, function (err, results, fields) {

        if (err) {
            cont++
        }
    });
    if (cont > 0) {
        return false;
    } else {
        return true;
    }
}

//Guardar Venta

function insert_VentaS() {
    var cant = TotalCantidad();
    var fac = localStorage.getItem("iden_sede") + anio + mes + dia + "-" + NumeroVenta;
    var sede = localStorage.getItem("id_sede");
    var consumo = $('#combo_consumo').val();
    var pago = $('#input_mediopago').val();
    var ent = $('#combo_entidad').val();
    var val = $('#s-subtotal').val();

    var dataserver = cant + '|' + fac + '|' + sede + '|' + consumo + '|' + pago + '|' + ent + '|' + val;
    var dataserverb = window.btoa(dataserver);
    var venta = {
        "insertar": dataserverb
    };

    $.ajax({
        type: 'POST',
        url: base + 'ServerShakeIt/Servicios/Ventas.php',
        data: venta,
        dataType: 'json',
        success: function (response) {

            if (response.Respuesta != 0) {

                if (insert_Venta(1) == true) {
                    $('#finalizav').show('fast');
                    $('#procesandov').hide('fast');
                    $('#con_btns_canc').hide('fast');
                    $('#con_btns_conf').hide('fast');
                    $('#con_btns_acept').show('fast');
                    localStorage.setItem('Paso_Venta', 4);
                }

            } else {

                $("#msg_alert_mod").html("<center><p>" + response.Mensaje + "</center>");
                $("#msg_alert_mod").show('fast');
                $('#confirmav').show('fast');
                $('#procesandov').hide('fast');
                $('#con_btns_canc').removeClass('disabled');
                $('#con_btns_conf').removeClass('disabled');
            }
        },
        beforeSend: function () {
            $('#confirmav').hide('fast');
            $('#procesandov').show('fast');
            $('#con_btns_canc').addClass('disabled');
            $('#con_btns_conf').addClass('disabled');
        }
    }).fail(function (jqXHR, textStatus, errorThrown) {
        $("#msg_alert_mod").html("<center><p>" + jqXHR + " " + textStatus + " " + errorThrown + "</center>");
        $("#msg_alert_mod").show('fast');
        $('#confirmav').show('fast');
        $('#procesandov').hide('fast');
        $('#con_btns_canc').removeClass('disabled');
        $('#con_btns_conf').removeClass('disabled');
    });

}

function insert_Venta(web) {
    
    var cont = 0;
    var cant = TotalCantidad();
    var fac = localStorage.getItem("iden_sede") + anio + mes + dia + "-" + NumeroVenta;
    var sede = localStorage.getItem("id_sede");
    var consumo = $('#combo_consumo').val();
    var pago = $('#input_mediopago').val();
    var ent = $('#combo_entidad').val();
    var val = $('#s-subtotal').val();

    var sql = "call Ventas_Add('" + cant + "', '" + fac + "', '" + sede + "', '" + consumo + "', '" + pago + "', '" + ent + "', '" + val + "', '" + web + "');";
    con.query(sql, function (err, results, fields) {

        if (err) {
            cont++;
        }
    });
    if (cont > 0) {
        $('#confirmav').show('fast');
        $('#procesandov').hide('fast');
        $('#con_btns_canc').removeClass('disabled');
        $('#con_btns_conf').removeClass('disabled');
        return false;
    } else {
        localStorage.setItem('Paso_Venta', 8);
        return true;
    }
}

//Clientes

function insert_ClienteS() {

    var nom = $('#cli_nom').val();
    var ape = $('#cli_ape').val();
    var dir = $('#cli_dir').val();
    var barr = $('#cli_barr').val();
    var mun = $('#cli_mun').val();
    var tel = $('#cli_tel').val();

    var dataserver = nom + '|' + ape + '|' + dir + '|' + barr + '|' + mun + '|' + tel;
    var dataserverb = window.btoa(dataserver);
    var cliente = {
        "insertarventa": dataserverb
    };

    $.ajax({
        type: 'POST',
        url: base + 'ServerShakeIt/Servicios/Clientes.php',
        data: cliente,
        dataType: 'json',
        success: function (response) {
            if (response.Respuesta != 0) {
                if (insert_Cliente() == true) {
                    alert('si')
                } else {
                    alert('No')
                }
            }
        }
    });
}

function insert_Cliente() {

    var cont = 0;
    var nom = $('#cli_nom').val();
    var ape = $('#cli_ape').val();
    var dir = $('#cli_dir').val();
    var barr = $('#cli_barr').val();
    var mun = $('#cli_mun').val();
    var tel = $('#cli_tel').val();

    var sql = "call Cliente_AddVenta('" + nom + "', '" + ape + "', '" + dir + "', '" + barr + "', '" + mun + "', '" + tel + "');";
    con.query(sql, function (err, results, fields) {

        if (err) {
            cont++;
        }
    });
    if (cont > 0) {
        return false;
    } else {
        return true;
    }
}