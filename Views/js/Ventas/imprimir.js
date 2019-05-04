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

  var telefonos = localStorage.getItem('tel_sede') + " - " + localStorage.getItem('what_sede')
  var fechaF = dia + "-" + mes + "-" + anioC;
  var fac = localStorage.getItem("iden_sede") + anio + mes + dia + "-" + NumeroVenta
  var productos = ProductosPrint();

  device.open(function() {

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

      productos.forEach(function(element) {

        .text(element.nom + " " + element.cant + " " + element.tot)

      });

    );

  });

}
