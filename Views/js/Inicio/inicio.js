/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function ActualizarBtn(){

$("actActualizar").hide()
$("actActualizando").show()
dropTables()
$("actActualizar").show()
$("actActualizando").hide()
}

function ventas() {

    var caja = localStorage.getItem("caja");

    if (caja == 5) {

        $("#btns").html("<center><input data-dismiss='modal' aria-label='Close' class='btn btn-primary m-r-1em' value='Aceptar'/></center>");
        $("#msg").html("<center><p>La caja está cerrada en estos momentos.</p></center>");
        $("#modal_msg").modal('show');

    } else {

window.location = 'ventas.html';

    }

}
