/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function validarGuardar() {

    var val = ValidarCamposAlert('ins_g')

    if (val == true) {

        insert_insumos();

    }

}


$(document).ready(function () {
    Get_Unidades('#ins_unig');
});