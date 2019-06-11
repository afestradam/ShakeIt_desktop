/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var reporte = localStorage.getItem("iden_sede") + anio + mes + dia

function guardarReporteInfo(val) {
    var idsede = localStorage.getItem("id_sede")
    var dataserver = reporte + '|' + val + '|' + idsede;
    var dataserverb = window.btoa(dataserver);
    var request = {
        "insertar": dataserverb
    };

    $.ajax({
        type: 'POST',
        url: base + 'ServerShakeIt/Servicios/Reportes.php',
        data: request,
        dataType: 'json',
        success: function (response) {
            if (response.Respuesta != 0) {

                if (guardarReporteInfoLocal(val) == true) {
localStorage.setItem('Reportes', 1);
                } else {
                    localStorage.setItem('Reportes', 0);
                }

            } else {
                localStorage.setItem('Reportes', 0);
            }

        }
    });
}

function guardarReporteInfoLocal(val) {

    var idsede = localStorage.getItem("id_sede")
    var cont = 0;
    var sql = "CALL Reportes_Add('" + reporte + "', '" + val + "', '" + idsede + "');";
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

function Load_ProductosV(fecha, dia, mes, anio, sede) {
  $('#tab_VentasXDia').html('<center><div class="text-center"><div class="spinner-border" role="status"><span class="sr-only">Loading...</span></div></div></center>')
    var sql1 = "call ProductosV_Get(" + fecha + "," + dia + "," + mes + "," + anio + "," + sede + ");"
    con.query(sql1, function (err, results, fields) {
        numRows = results[0].length;
        //debugger
        if (numRows > 0) {
          $('#tab_VentasXDia').html('')
            results[0].forEach(function (element) {
                $('#tab_VentasXDia').append('<tr><th scope="row">' + element.fk_producto + '</th><td>' + element.nom_producto + '</td><td>' + element.precio_producto + '</td><td>' + element.cantidad + '</td><td>' + element.valor + '</td><td>' + element.nom_sede + '</td></tr>')
            });
        } else {
            $('#tab_VentasXDia').html('No existe información')
        }
    });

    var sql2 = "call ProductosV_GetTotal(" + fecha + "," + dia + "," + mes + "," + anio + "," + sede + ");"
    con.query(sql2, function (err, results, fields) {
      debugger
        numRows = results[0].length;
        if (numRows > 0) {
          $('#vtotal').html(results[0][0].total);
        } else {
            $('#vtotal').html("0");
        }
    });
}
