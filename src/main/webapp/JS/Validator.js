function isNumeric(n) {
    return !isNaN(parseFloat(n)) && isFinite(n);
}
let lastClickedRadius = 5;
function getX(){
    const elements = document.querySelectorAll('input[name="X"]')
    for (const e of elements) {
        if (e.checked) {
            return parseFloat(e.value);
        }
    }
    return null;
}
function getY(){
    let var_y = document.getElementById("Y");
    let numY = parseFloat(var_y.value.replace(',', '.'));
    return numY;
}
function validateY (event) {
    const MIN = -3;
    const MAX = 5;
    const expPattern = /^[+\-]?\d+(\.\d+)?([eE][+\-]?\d+)$/;
    let var_y = document.getElementById("Y");
    numY = parseFloat(var_y.value.replace(',', '.'));
    if(expPattern.test(numY)){
        alert("Число не может быть введено в экспоненциальной форме")
        event.preventDefault();
        return false;
    } else if(isNumeric(numY) && numY<= MAX && numY >= MIN){
        return true;
    }else {
        alert("Число должно быть больше -3 и меньше 5")
        event.preventDefault();
        return false;
    }

}
