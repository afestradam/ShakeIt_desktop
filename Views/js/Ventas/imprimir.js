/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


const ThermalPrinter = require("../node-thermal-printer").printer;
const PrinterTypes = require("../node-thermal-printer").types;

function print() {

    let printer = new ThermalPrinter({
        type: PrinterTypes.EPSON,
        interface: 'tcp://xxx.xxx.xxx.xxx'
    });

    printer.alignCenter();
    printer.println("Hello world")    
    printer.cut();

    try {
        let execute = printer.execute()
        alert('si salió')
    } catch (error) {
        alert('no salió')
    }

}

