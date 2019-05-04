/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//Sedes
function Get_Sedes(select) {
    var sql = "call Sedes_GetSel();"
    con.query(sql, function (err, results, fields) {
        numRows = results[0].length;

        if (numRows > 0) {
            $(select).html("")
            $(select).html("<option value='' selected>Seleccione Sede</option>")
            results[0].forEach(function (element) {
                $(select).append('\
                  <option value="' + element.id + '">' + element.nom + '</option>\n\
                  ');
            });
        } else {
            $(select).html("")
            $(select).html("<option value='' selected>Seleccione Sede</option>")
            results[0].forEach(function (element) {
                $(select).append('\
                  <option value="">No existe información</option>\n\
                  ');
            });
        }
    });
}

function Get_SedesS(select) {

    var sedes = {
        "sedes": "sedes"
    };

    $.ajax({
        type: 'POST',
        url: base + 'ServerShakeIt/Servicios/Comunes.php',
        data: sedes,
        dataType: 'json',
        success: function (response) {
            if (response.Respuesta != 0) {
                $(select).html("")
                $(select).html("<option value='' selected>Seleccione Sede</option>")
                $.each(response.Respuesta, function (i, item) {
                    $(select).append('\
                  <option value="' + item.id + '">' + item.nom + '</option>\n\
                  ');
                });
            }
        }
    });
}
//Departamentos
function Get_DepartamentosSel(select) {
    var sql = "call Departamentos_GetSel();"
    con.query(sql, function (err, results, fields) {
        numRows = results[0].length;

        if (numRows > 0) {
            $(select).html("")
            $(select).html("<option value='' selected>Seleccione Departamento</option>")
            results[0].forEach(function (element) {
                $(select).append('\
                  <option value="' + element.id + '">' + element.nom + '</option>\n\
                  ');
            });
        } else {
            $(select).html("")
            $(select).html("<option value='' selected>Seleccione Departamento</option>")
            results[0].forEach(function (element) {
                $(select).append('\
                  <option value="">No existe información</option>\n\
                  ');
            });
        }
    });
}
//Municipios
function Get_MunicipioSel(select, dep) {

    var iddesp = $(dep).val();
    var sql = "call Municipios_GetSel(" + iddesp + ");"

    con.query(sql, function (err, results, fields) {
        numRows = results[0].length;

        if (numRows > 0) {
            $(select).html("")
            $(select).html("<option value='' selected>Seleccione Municipio</option>")
            results[0].forEach(function (element) {
                $(select).append('\
                  <option value="' + element.id + '">' + element.nom + '</option>\n\
                  ');
            });
        } else {
            $(select).html("")
            $(select).html("<option value='' selected>Seleccione Municipio</option>")
            results[0].forEach(function (element) {
                $(select).append('\
                  <option value="">No existe información</option>\n\
                  ');
            });
        }
    });
}
//Insumos
function Get_InsumosSel(select) {
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
            $(select).append("<option value=''>No existen datos.</option>")
        }
    });
}
//Consumos
function get_ConsumosSel(select) {

    var sql = "call Consumo_GetSel();";
    con.query(sql, function (err, results, fields) {
        numRows = results[0].length;

        if (numRows > 0) {
            $(select).html("")
            $(select).html("<option value='' selected>Seleccione Consumos</option>")
            results[0].forEach(function (element) {
                $(select).append('\
                  <option value="' + element.id + '">' + element.nom + '</option>\n\
                  ');
            });
        } else {
            $(select).html("")
            $(select).html("<option value='' selected>Seleccione Insumo</option>")
            $(select).append("<option value=''>No existen datos.</option>")
        }
    });
}
//Entidades
function get_EntidadesSel(select) {

    var sql = "call Entidades_GetSel();";
    con.query(sql, function (err, results, fields) {
        numRows = results[0].length;

        if (numRows > 0) {
            $(select).html("")
            $(select).html("<option value='' selected>Seleccione entidad</option>")
            results[0].forEach(function (element) {
                $(select).append('\
                  <option value="' + element.id + '">' + element.nom + '</option>\n\
                  ');
            });
        } else {
            $(select).html("")
            $(select).html("<option value='' selected>Seleccione Insumo</option>")
            $(select).append("<option value=''>No existen datos.</option>")
        }
    });
}