/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function show_Producto(id) {

    var sql = "call Productos_GetXId(" + id + ");"
    con.query(sql, function (err, results, fields) {
        numRows = results[0].length;

        if (numRows > 0) {
            $("#pro_mod_nuevo_insumos").html("")
            $("#num_ins").val(0);
            $('#pro_ide').val(results[0][0].id_producto)
            $('#pro_nome').val(results[0][0].nom_producto)
            $('#pro_nomce').val(results[0][0].nomG_producto)
            $('#pro_prece').val(results[0][0].precio_producto)
            $('#pro_cate').val(results[0][0].fk_categoria)
            $('#pro_desce').val(results[0][0].descripcion_producto)
            Get_InsumosProd(id)
        } else {
            $("#btns").html("<center><input data-dismiss='modal' aria-label='Close' class='btn btn-primary m-r-1em' value='Aceptar'/></center>");
            $("#msg").html("<center><p>No existe información para esta categoría.</p></center>");
            $("#modal_msg").modal('show');
            $("#ingresar").show();
            $("#ingresando").hide();
        }
    });
}

function id_producto() {

    var sql = "call Productos_GetNuevoId();"
    con.query(sql, function (err, results, fields) {
        numRows = results[0].length;

        if (numRows > 0) {
            $("#pro_idg").val(results[0][0].nid);
        }
    });
}

function id_productoS() {

    var request = {
        "getid": "getid"
    };

    $.ajax({
        type: 'GET',
        url: 'http://localhost/ServerShakeIt/Servicios/Productos.php',
        data: request,
        dataType: 'json',
        success: function (response) {

            $("#pro_idg").val(response.Respuesta[0].nid);

        }
    });
}

function Get_Productos() {

    var sql = "call Productos_Get();"
    con.query(sql, function (err, results, fields) {
        numRows = results[0].length;
        //debugger
        if (numRows > 0) {
            results[0].forEach(function (element) {
                $('#tab_ProBody').append('<tr>\n\
                       <th scope="row">' + element.id_producto + '</th>\n\
                       <td>' + element.nom_producto + '</td>\n\
                       <td>' + element.nomG_producto + '</td>\n\
                       <td>' + element.precio_producto + '</td>\n\
                       <td>' + element.nomcategoria + '</td>\n\
                       <td><a class="btn btn_sh_normal btn-sm" href="javascript: show_Producto(' + element.id_producto + ')" role="button">Editar</a>\n\
                       </td><td><a class="btn btn-danger btn-sm" href="javascript: confirmarEliminar(' + element.id_producto + ')" role="button">Eliminar</a></td>\n\
                       </tr>')
            });
            $("#modal_msg").modal("hide")
        } else {
            $("#btns").html("<center><input data-dismiss='modal' aria-label='Close' class='btn btn-primary m-r-1em' value='Aceptar'/></center>");
            $("#msg").html("<center><p>No existe información para esta categoría.</p></center>");
            $("#modal_msg").modal('show');
            $("#ingresar").show();
            $("#ingresando").hide();
        }
    });
}

function Get_InsiumoPro() {

    var id = $("#pro_ins").val();

    var sql = "call Insumos_GetXId(" + id + ");"
    con.query(sql, function (err, results, fields) {
        numRows = results[0].length;

        if (numRows > 0) {
            $('#pro_ins_unidad').val(results[0][0].nomSI_unidad);
        } else {
            $('#pro_ins_unidad').val('');
        }
    });
}

function Get_InsumosProd(id) {
    var sql = "call Relacion_GetXProd(" + id + ");"
    $('#pro_mod_editar_insumos').html("")
    con.query(sql, function (err, results, fields) {
        numRows = results[0].length;
        if (numRows > 0) {
            results[0].forEach(function (element) {
                $('#pro_mod_editar_insumos').append('\
                  <div class="alert alert-primary row" role="alert" id="regIns-' + element.fk_insumo + '">\n\
                  <div class="col-5" style="display: none;"><input id="ins_i" name="ins_gd" value="' + element.fk_insumo + '" /></div>\n\
                  <div class="col-5">' + element.nom_insumo + '</div>\n\
                  <div class="col-3">Cantidad: ' + element.insumoUnidad_rel + '</div>\n\
                  <div class="col-3">' + element.nomSI_unidad + '(' + element.simbolo_unidad + ')</div>\n\
                  <div class="col-1"><a href="javascript: delete_Relacion(' + element.fk_insumo + ',' + element.fk_producto + ',' + element.insumoUnidad_rel + ')"><i class="far fa-trash-alt"></i></div></a>\n\
                  </div>')
            });
        }
        $('#pro_mod_editar').modal({backdrop: 'static', keyboard: true, show: true})
    });
}

function Get_CategoríasPro(select) {
    var sql = "call Categorias_Get();"
    con.query(sql, function (err, results, fields) {
        numRows = results[0].length;

        if (numRows > 0) {
            $(select).html("")
            $(select).html("<option value='' selected>Seleccione Categoría</option>")
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

function Get_InsumosPro(select) {
    var sql = "call Insumos_GetSel();";
    con.query(sql, function (err, results, fields) {
        numRows = results[0].length;

        if (numRows > 0) {
            $(select).html("")
            $(select).html("<option value='' selected>Seleccione Insumo</option>")
            results[0].forEach(function (element) {
                $(select).append('\
                  <option value="' + element.id + '">' + element.nom + '</option>\n\
                  ');
            });
        } else {
          $(select).html("")
          $(select).html("<option value='' selected>Seleccione Insumo</option>")
          $(select).append("<option value=''>No existe información</option>")
        }
    });
}

function update_producto() {

    $("#proActualizar").hide()
    $("#proActualizando").show()

    var id = $('#pro_ide').val();
    var nom = $('#pro_nome').val();
    var nomG = $('#pro_nomce').val();
    var prec = $('#pro_prece').val();
    var cat = $('#pro_cate').val();
    var desc = $('#pro_desce').val();

    var sql = "CALL Productos_Update('" + id + "', '" + nom + "', '" + nomG + "', '" + prec + "', '" + cat + "', '" + desc + "');";
    con.query(sql, function (err, results, fields) {

        if (err) {
            throw err;
        } else {
            if (navigator.onLine) {
                update_productoS(id, nom, nomG, prec, cat, desc);
            } else {
                ('#msg_alert_mod').html('<p>Error al guardar producto en la nube.</p>');
                $('#msg_alert_mod').show('fast')
                $("#proActualizar").show()
                $("#proActuaizando").hide()
            }
        }

    })
}

function update_productoS(id, nom, nomG, prec, cat, desc) {

    var dataserver = id + '|' + nom + '|' + nomG + '|' + prec + '|' + cat + '|' + desc
    var dataserverb = window.btoa(dataserver);
    var persona = {
        "actualizar": dataserverb
    };

    $.ajax({
        type: 'POST',
        url: base + 'ServerShakeIt/Servicios/Productos.php',
        data: persona,
        dataType: 'json',
        success: function (response) {
            if (response.Respuesta != 0) {
                $('#pro_mod_editar').modal('hide')
                $("#btns").html("<a class='btn btn-danger btn-sm' href='ListProductos.html' role='button'>Aceptar</a>");
                $("#msg").html("<center><p>" + response.Mensaje + "</p></center>");
                $('#modal_msg').modal({backdrop: 'static', keyboard: true, show: true})
            } else {
                $('#pro_mod_editar').modal('hide')
                $("#btns").html("<a class='btn btn-danger btn-sm' data-dismiss='modal' aria-label='Close' role='button'>Aceptar</a>");
                $("#msg").html("<center><p>" + response.Mensaje + "</p></center>");
                $('#modal_msg').modal({backdrop: 'static', keyboard: true, show: true})
                $("#proActualizar").show()
                $("#proActualizando").hide()
            }
        },
        beforeSend: function () {

        }
    }).fail(function (jqXHR, textStatus, errorThrown) {
        $('#pro_mod_editar').modal('hide')
        $("#btns").html("<input data-dismiss='modal' aria-label='Close' class='btn btn-primary m-r-1em' value='Aceptar'/>");
        $("#msg").html("<center><p>" + jqXHR + " " + textStatus + " " + errorThrown + "</center>");
        $("#modal_msg").modal('show');
        $("#proActualizar").show()
        $("#proActualizando").hide()
    });

}

function delete_Relacion(ins, pro, cant) {

    var sql = "CALL Relacion_Delete('" + pro + "', '" + ins + "');";
    con.query(sql, function (err, results, fields) {
        if (err) {
            throw err;
            ('#msg_alert_mod').html('<p>Error al eliminar insumo.</p>');
            $('#msg_alert_mod').show('fast')
        } else {
            if (navigator.onLine) {
                delete_RelacionS(pro, ins, cant);
            } else {
                insert_relacionLocal(pro, ins, cant);
                ('#msg_alert_mod').html('<p>Error al eliminar insumo en la nube.</p>');
                $('#msg_alert_mod').show('fast')
            }
        }

    })

}

function delete_RelacionS(pro, ins, cant) {

    var dataserver = pro + '|' + ins
    var dataserverb = window.btoa(dataserver);
    var persona = {
        "eliminar": dataserverb
    };

    console.log(dataserverb);

    $.ajax({
        type: 'POST',
        url: base + 'ServerShakeIt/Servicios/RelacionInsumos.php',
        data: persona,
        dataType: 'json',
        success: function (response) {
            if (response.Respuesta != 0) {
                $('#regIns-' + ins).remove();
            } else {
                insert_relacionLocal(pro, ins, cant);
                ('#msg_alert_mod').html('<p>Error al eliminar producto.</p>');
                $('#msg_alert_mod').show('fast');
            }
        },
        beforeSend: function () {

        }
    }).fail(function (jqXHR, textStatus, errorThrown) {
        insert_relacionLocal(pro, ins, cant);
        $('#pro_mod_editar').modal('hide')
        $("#btns").html("<input data-dismiss='modal' aria-label='Close' class='btn btn-primary m-r-1em' value='Aceptar'/>");
        $("#msg").html("<center><p>" + jqXHR + " " + textStatus + " " + errorThrown + "</center>");
        $("#modal_msg").modal('show');
        $("#ingresar").show();
        $("#ingresando").hide();
    });

}

function insert_relacionLocal(pro, ins, cant) {

    var sql = "CALL Relacion_Add('" + pro + "', '" + ins + "', '" + cant + "');";
    con.query(sql, function (err, results, fields) {
        if (err) {
            throw err;
            ('#msg_alert_mod').html('<p>Error al guardar insumo.</p>');
            $('#msg_alert_mod').show('fast')
        }

    })
}

function insert_RelacionMas(datos, val) {

    var cont = 0;

    datos.forEach(function (element) {
        var sql = "CALL Relacion_Add('" + element.pro + "', '" + element.ins + "', '" + element.cant + "');";
        con.query(sql, function (err, results, fields) {
            if (err) {
                throw err;
                cont++
            }
        })
    })
    if (cont == 0) {

        if (navigator.onLine) {
            insert_RelacionMasS(datos, val);
        } else {
            if (val == 1) {
                insert_producto();
            } else {
                update_producto();
            }

            ('#msg_alert_mod').html('<p>Error al guardar insumo en la nube.</p>');
            $('#msg_alert_mod').show('fast')
        }

    }

}

function insert_RelacionMasS(datos, val) {

    INFO = new FormData();
    var ainfo = JSON.stringify(datos);
    INFO.append('insertarmas', ainfo);

    $.ajax({

        type: "POST",
        processData: false,
        contentType: false,
        cache: false,
        data: INFO,
        url: base + 'ServerShakeIt/Servicios/RelacionInsumos.php',
        success: function (response) {

            if (response.Respuesta != 0) {

                if (val == 1) {
                    insert_producto();
                } else {
                    update_producto();
                }

            }
        },
        beforeSend: function () {

        }
    }).fail(function (jqXHR, textStatus, errorThrown) {
        $('#pro_mod_editar').modal('hide')
        $("#btns").html("<input data-dismiss='modal' aria-label='Close' class='btn btn-primary m-r-1em' value='Aceptar'/>");
        $("#msg").html("<center><p>" + jqXHR + " " + textStatus + " " + errorThrown + "</center>");
        $("#modal_msg").modal('show');
        $("#proGuardar").show()
        $("#proGuardando").hide()
        $("#proActualizar").show()
        $("#proActuaizando").hide()
    });

}

function insert_producto() {

    $("#proGuardar").hide()
    $("#proGuardando").show()

    var id = $('#pro_idg').val();
    var nom = $('#pro_nomg').val();
    var nomG = $('#pro_nomcg').val();
    var prec = $('#pro_precg').val();
    var cat = $('#pro_catg').val();
    var desc = $('#pro_descg').val();

    var sql = "CALL Productos_Add('" + id + "', '" + nom + "', '" + nomG + "', '" + prec + "', '" + cat + "', '" + desc + "');";
    con.query(sql, function (err, results, fields) {

        if (err) {
            throw err;
        } else {
            if (navigator.onLine) {
                insert_productoS(id, nom, nomG, prec, cat, desc);
            } else {
                ('#msg_alert_mod').html('<p>Error al guardar producto en la nube.</p>');
                $('#msg_alert_mod').show('fast')
                $("#proGuardar").show()
                $("#proGuardando").hide()
            }
        }

    })
}

function insert_productoS(id, nom, nomG, prec, cat, desc) {

    var dataserver = id + '|' + nom + '|' + nomG + '|' + prec + '|' + cat + '|' + desc
    var dataserverb = window.btoa(dataserver);
    var producto = {
        "insertar": dataserverb
    };

    console.log(dataserverb);

    $.ajax({
        type: 'POST',
        url: base + 'ServerShakeIt/Servicios/Productos.php',
        data: producto,
        dataType: 'json',
        success: function (response) {
            if (response.Respuesta != 0) {
                $('#pro_mod_editar').modal('hide')
                $("#btns").html("<a class='btn btn-danger btn-sm' href='RegProductos.html' role='button'>Aceptar</a>");
                $("#msg").html("<center><p>" + response.Mensaje + "</p></center>");
                $('#modal_msg').modal({backdrop: 'static', keyboard: true, show: true})
            } else {
                $('#pro_mod_editar').modal('hide')
                $("#btns").html("<a class='btn btn-danger btn-sm' data-dismiss='modal' aria-label='Close' role='button'>Aceptar</a>");
                $("#msg").html("<center><p>" + response.Mensaje + "</p></center>");
                $('#modal_msg').modal({backdrop: 'static', keyboard: true, show: true})
                $("#proGuardar").show()
                $("#proGuardando").hide()
            }
        },
        beforeSend: function () {

        }
    }).fail(function (jqXHR, textStatus, errorThrown) {
        $('#pro_mod_editar').modal('hide')
        $("#btns").html("<input data-dismiss='modal' aria-label='Close' class='btn btn-primary m-r-1em' value='Aceptar'/>");
        $("#msg").html("<center><p>" + jqXHR + " " + textStatus + " " + errorThrown + "</center>");
        $("#modal_msg").modal('show');
        $("#proGuardar").show()
        $("#proGuardando").hide()
    });

}

function delete_producto(id) {



    var sql = "CALL Productos_Delete('" + id + "');";
    con.query(sql, function (err, results, fields) {

        if (err) {
            throw err;
        } else {
            if (navigator.onLine) {
                delete_productoS(id);
            } else {
                ('#msg_alert_mod').html('<p>Error al guardar producto en la nube.</p>');
                $('#msg_alert_mod').show('fast')
            }
        }

    })
}

function delete_productoS(id) {

    var dataserver = id + '|' + 'dato'
    var dataserverb = window.btoa(dataserver);
    var producto = {
        "eliminar": dataserverb
    };

    console.log(dataserverb);

    $.ajax({
        type: 'POST',
        url: base + 'ServerShakeIt/Servicios/Productos.php',
        data: producto,
        dataType: 'json',
        success: function (response) {
            if (response.Respuesta != 0) {
                $('#pro_mod_editar').modal('hide')
                $("#btns").html("<a class='btn btn-danger btn-sm' href='ListProductos.html' role='button'>Aceptar</a>");
                $("#msg").html("<center><p>" + response.Mensaje + "</p></center>");
                $('#modal_msg').modal({backdrop: 'static', keyboard: true, show: true})
            } else {
                $('#pro_mod_editar').modal('hide')
                $("#btns").html("<a class='btn btn-danger btn-sm' data-dismiss='modal' aria-label='Close' role='button'>Aceptar</a>");
                $("#msg").html("<center><p>" + response.Mensaje + "</p></center>");
                $('#modal_msg').modal({backdrop: 'static', keyboard: true, show: true})
            }
        },
        beforeSend: function () {

        }
    }).fail(function (jqXHR, textStatus, errorThrown) {
        $('#pro_mod_editar').modal('hide')
        $("#btns").html("<input data-dismiss='modal' aria-label='Close' class='btn btn-primary m-r-1em' value='Aceptar'/>");
        $("#msg").html("<center><p>" + jqXHR + " " + textStatus + " " + errorThrown + "</center>");
        $("#modal_msg").modal('show');
        $("#ingresar").show();
        $("#ingresando").hide();
    });

}
