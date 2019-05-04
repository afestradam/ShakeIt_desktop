/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var reporte = localStorage.getItem("iden_sede") + anio + mes + dia

function guardarReporteInfo(val) {
debugger
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