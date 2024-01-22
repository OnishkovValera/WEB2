
path = String();
window.onload = function (){
    drawGraph(5);
    document.querySelectorAll('input[name="radius"]').forEach(radio => {
        radio.addEventListener('click', () => {
            lastClickedRadius = radio.value;
            drawGraph(radio.value);
        })
    })
    document.getElementById("feedBack").addEventListener("submit", event=>submitEvent(event));
}
function submitEvent(event){
    if(!validateY(event)){
        event.preventDefault();
        alert("Неправильный ввод данных");
    }else{

    }
}
canvas.addEventListener("click", function (event){
    parseCanvasClick(event);
});