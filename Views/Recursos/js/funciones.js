var fecha = new Date();
var anio = fecha.getYear() - 100;
var anioC = anio + 2000;
var mes = fecha.getMonth() + 1;
var dia = fecha.getDate();
var fechaAhora = anio+"-"+mes+"-"+dia;
var fechaLocal = localStorage.getItem("backupDete");
var NumeroVenta = localStorage.getItem('Venta_Num');
var base = 'http://localhost/';
var baseRem = 'http://shakeitcol.co/';

function buscarD(tabla)
{
    var tableReg = document.getElementById(tabla);
    var searchText = document.getElementById('filtrar').value.toLowerCase();
    var cellsOfRow = "";
    var found = false;
    var compareWith = "";

    // Recorremos todas las filas con contenido de la tabla
    for (var i = 1; i < tableReg.rows.length; i++)
    {
        cellsOfRow = tableReg.rows[i].getElementsByTagName('td');
        found = false;
        // Recorremos todas las celdas
        for (var j = 0; j < cellsOfRow.length && !found; j++)
        {
            compareWith = cellsOfRow[j].innerHTML.toLowerCase();
            // Buscamos el texto en el contenido de la celda
            if (searchText.length == 0 || (compareWith.indexOf(searchText) > -1))
            {
                found = true;
            }
        }
        if (found)
        {
            tableReg.rows[i].style.display = '';
        } else {
            // si no ha encontrado ninguna coincidencia, esconde la
            // fila de la tabla
            tableReg.rows[i].style.display = 'none';
        }
    }
}

function ValidarCampos(name) {

    var tot = countCampos(name);
    var cont = 0;
    $("input[name ='" + name + "'], select[name ='" + name + "'], textarea[name ='" + name + "']").each(function () {
        if ($(this).val().length == 0) {
            var camp = $(this).attr("campo");

            $.notify("<p>Es necesario llenar el campo " + camp + "</p>", {
                animate: {
                    enter: 'animated fadeInRight',
                    exit: 'animated fadeOutRight',
                    position: 'absolute'
                }
            });

            $(this).addClass("is-invalid");
            $(this).focus();
            //$("#amsg").focus();
            return false;
        }
        cont++;
    });
    if (cont == tot) {
        return true;
    }

}

function ValidarCamposAlert(name) {

    var tot = countCampos(name);
    var cont = 0;
    $("input[name ='" + name + "'], select[name ='" + name + "'], textarea[name ='" + name + "']").each(function () {
        if ($(this).val().length == 0) {
            var camp = $(this).attr("campo");

            $('#msg_alert_mod').html('<p>Es necesario que llene el campo ' + camp + '</p>');
            $('#msg_alert_mod').show('fast')

            $(this).addClass("is-invalid");
            $(this).focus();
            //$("#amsg").focus();
            return false;
        }
        cont++;
    });
    if (cont == tot) {
        return true;
    }

}

function ValidarCamposAlertGuardar(name) {

    var tot = countCampos(name);
    var cont = 0;
    $("input[name ='" + name + "'], select[name ='" + name + "'], textarea[name ='" + name + "']").each(function () {
        if ($(this).val().length == 0) {
            var camp = $(this).attr("campo");

            $('#msg_alert_modG').html('<p>Es necesario que llene el campo ' + camp + '</p>');
            $('#msg_alert_modG').show('fast')

            $(this).addClass("is-invalid");
            $(this).focus();
            //$("#amsg").focus();
            return false;
        }
        cont++;
    });
    if (cont == tot) {
        return true;
    }

}

function countCampos(name) {
    var cont = 0;
    $("input[name ='" + name + "'], select[name ='" + name + "'], textarea[name ='" + name + "']").each(function () {
        cont++;
    });

    return cont;
}

function removec(d) {
    //$(d).popover('destroy');
    $('#msg_alert_modG').hide('fast')
    $('#msg_alert_modE').hide('fast')
    $('#msg_alert_mod').hide('fast')
    $('.alert').hide('fast')
    $(d).removeClass("is-invalid");
}

var getUrlParameter = function getUrlParameter(sParam) {
    var sPageURL = decodeURIComponent(window.location.search.substring(1)),
            sURLVariables = sPageURL.split('&'),
            sParameterName,
            i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : sParameterName[1];
        }
    }
};
