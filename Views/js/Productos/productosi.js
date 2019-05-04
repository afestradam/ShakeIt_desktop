
function load_Menu() {

    $("a[name='productoi']").each(function () {
        $(this).removeClass("backText");
    });
    sessionStorage.setItem("modulo", 'productos');
}

$(document).ready(function () {
    //verificacionI()
    //user_data()
    load_Menu()
});