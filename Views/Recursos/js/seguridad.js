/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var softan1 = "5c0596eca63a46d68f072479a8ed5dca";
var softan2 = "75b0b4b8adc0065355cf49561c8ddee2|SoftanSo_1";
function verificacionI() {
    var login = sessionStorage.getItem("ses_estado");

    if (login != "ShakeItDESK") {
        window.location = 'login.html';
    }else{  
        $("body").show();
    }
}

function verificacionL() {
    var login = sessionStorage.getItem("ses_estado");

    if (login == "ShakeItDESK") {
        window.location = 'inicio.html';
    }
}