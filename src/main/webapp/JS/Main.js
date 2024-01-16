JSONObject = String();
window.onload = function (){
    drawGraph(5);

    document.querySelectorAll('input[name="radius"]').forEach(radio => {
        radio.addEventListener('click', () => {
            drawGraph(radio.value);
        })
    })
}
