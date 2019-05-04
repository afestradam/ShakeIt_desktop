/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

const escpos = require('escpos');
const usbDevice = new escpos.USB();
const usbPrinter = new escpos.Printer(usbDevice);

function ProductosPrint() {

  var datos = [];

  $("#tabVentas > tbody > tr").each(function() {

    var idpro = $(this).data("prod");
    var nom = $(this).data("prodnom");
    var cant = $(this).data("cant");
    var tot = $(this).data("prodtot");

    var items = {
      "id": idpro,
      "nom": nom,
      "cant": cant,
      "tot": tot
    };
    datos.push(items);
  });
  return datos;
  //update_restarInsumosS(datos);
}

function print() {
  debugger
  var telefonos = localStorage.getItem('tel_sede') + " - " + localStorage.getItem('what_sede')
  var fechaF = dia + "-" + mes + "-" + anioC;
  var fac = localStorage.getItem("iden_sede") + anio + mes + dia + "-" + NumeroVenta
  var consumo = $('#combo_consumo').val();
  var cambioVal = parseInt($('#dinero_recibido').val()) - parseInt($('#s-subtotal').val())
  var productos = ProductosPrint();


  device.open(function() {
debugger
      printer
        .font('a')
        .align('ct')
        .style('bu')
        .size(1, 1)
        .text(localStorage.getItem('nom_sede'))
        .text(localStorage.getItem('dir_sede'))
        .text(telefonos)
        .text(localStorage.getItem('nit_sede'))
        .text(localStorage.getItem('mun_sede'))
        .text(' ')
        .text(' ')
        .align('lt')
        .text('Atendido(a) por: ' + localStorage.getItem('nom_user'))
        .text('Fecha: ' + fechaF)
        .text('Ticket N°: ' + fac)
        .text(' ')
        .text(' ')
        .align('ct')
      productos.forEach(function(element) {

        .text(element.nom + " " + element.cant + " " + element.tot)

      });
      .text(' ')
        .align('lt')
      if ($('#combo_entidad').val() != 5) {
        .text('Medio Pago: Electrónivo ' + $("#combo_entidad option:selected").text())
      } else {
        .text('Medio Pago: ' + $("#combo_entidad option:selected").text())
      }
      .text('Total: ' + $("#s-subtotal").val())
        .text('Dinero Recibido: ' + $("#dinero_recibido").val())
        .text('Cambio: ' + cambioVal)
        .text(' ')
      if (consumo == 1) {
        .align('ct')
          .text('-------DOMICILIO-------')
          .align('lt')
          .text($('#cli_nom').val() + " " + $('#cli_ape').val())
          .text($('#cli_dir').val())
          .text($('#cli_barr').val())
          .text($('#cli_tel').val())
      }

    );

  });

}
