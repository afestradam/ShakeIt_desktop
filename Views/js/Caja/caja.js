/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function AbrirCaja() {
    
Verificar_IdInventario('#caja_idinv');
    var dineroCaja = $('#caja_din').val();
    var dineroIngreso = $('#caja_ing').val();
    var valdin = parseInt(dineroCaja) + parseInt(dineroIngreso);
    var val = ValidarCamposAlert('caja_ap');

    if (val == true) {
        var iden = localStorage.getItem('Iden_inventario');
        if (iden == 1) {
           guardarReporteInfo(0);
                guardarCajaInfo(valdin, 4);
           
        }
    }

}

function CerrarCaja() {
    
Verificar_IdInventario('#caja_idinvc');
    var dineroCaja = $('#caja_dinc').val();
    var ventas = $('#caja_ventasc').val();
    var val = ValidarCamposAlert('caja_ce');

    if (val == true) {
        var iden = localStorage.getItem('Iden_inventario');
        if (iden == 1) {
           guardarReporteInfo(ventas);
                guardarCajaInfo(dineroCaja, 5);
           
        }
    }

}

function CalcularCaja(){
    
    var dineroCaja = $('#caja_dincaux').val();
    var dineroRetiro = $('#caja_ret').val();
    var valdin = parseInt(dineroCaja) - parseInt(dineroRetiro);
    
    if(dineroRetiro == ""){
        
        $('#caja_dinc').val(dineroCaja);
        
    }else{
        
    $('#caja_dinc').val(valdin);    
    
    }
    
}

$(document).ready(function () {
    Caja_Estado();
});