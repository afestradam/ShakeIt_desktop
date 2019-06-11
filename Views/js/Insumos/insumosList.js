/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function validarActualizar() {

    var val = ValidarCamposAlert('ins_e')

    if (val == true) {

        update_insumos()

    }

}

function confirmarEliminar(id) {

    $("#msg").html("<center><p>¿Realmente desea eliinar este insumo?</p></center>");
    $("#btns").html('<a class="btn btn-danger" data-dismiss="modal" aria-label="Close" href="#" role="button">Cancelar</a>\n\
                     <a class="btn btn-primary" href="javascript: delete_insumos(' + id + ')" role="button">Aceptar</a>');
    $("#modal_msg").modal({backdrop: 'static', keyboard: true, show: true});

}

$(document).ready(function () {
    Get_Insumos();
    Get_Unidades('#ins_unie');
});