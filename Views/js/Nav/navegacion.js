function get_modulo() {

    var item = sessionStorage.getItem("itemNav");
    var modulo = sessionStorage.getItem("modulo");

    switch (item) {
        case "1":
            Vista_Productos()
            break;
        case "2":
            Vista_RegProductos()
            break;
        case "3":
            Vista_Insumos()
            break;
        case "4":
            Vista_RegInsumos()
            break;
        case "5":
            Vista_Zonas()
            break;
        default:
            if (modulo == "productos") {
                Vista_Productos()
            } else {
                if (modulo == 'inventario') {
                    Vista_Inventario()
                } else {
                    if (modulo == 'caja') {
                        Vista_Caja()
                    } else {
                        if (modulo == 'admin') {
                            Vista_Admin()
                        } else {
                            if (modulo == 'reportes') {
                                Vista_Reportes()
                            }else{
                                alert("Error")
                            }
                        }
                    }
                }
            }
    }

}

function Vista_Productos() {
    $("#L_contenido").load("ListProductos.html");
    sessionStorage.setItem("itemNav", 1);
    $('#modal_msg').modal('hide');
    removeActive();
    $('#item_1').addClass('active_nav')
}

function Vista_RegProductos() {
    $("#L_contenido").load("RegProductos.html");
    sessionStorage.setItem("itemNav", 2);
    $('#modal_msg').modal('hide');
    removeActive();
    $('#item_2').addClass('active_nav')
}

function Vista_Insumos() {
    $("#L_contenido").load("ListInsumos.html");
    sessionStorage.setItem("itemNav", 3);
    $('#modal_msg').modal('hide');
    removeActive();
    $('#item_3').addClass('active_nav')
}

function Vista_RegInsumos() {
    $("#L_contenido").load("RegInsumos.html");
    sessionStorage.setItem("itemNav", 4);
    $('#modal_msg').modal('hide');
    removeActive();
    $('#item_4').addClass('active_nav')
}

function removeActive() {

    $(".active_nav").each(function () {
        $(this).removeClass("active_nav");
    });

}

$(document).ready(function () {
    //verificacionI()
    //user_data()
    get_modulo()
});