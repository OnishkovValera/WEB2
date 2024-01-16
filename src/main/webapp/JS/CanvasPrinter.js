canvas = document.getElementById("canvas");
context = canvas.getContext("2d");
context.lineWidth = 2;
canvas.width = 400;
canvas.height = 400;
COLOR_RED = "#b50300"
COLOR_GREEN = "#00b509"
LINE_WIDTH = 2;
context.fillStyle = "#898989";
TEXT_SIZE = 20;
TEXT_MARGIN = 15;
TEXT_LINE_HEIGHT = 3;
SIZE = 400;
GRAPH_SIZE = 165;
let width = canvas.width;
let height = canvas.height;
let color = "rgba(20, 20, 20, 0.3)"
let points = new Array();
context.font = "1.2rem mono";

function drawGraph(r){
    context.clearRect(0,0, 400, 400);
    context.save();
    context.transform(1,0,0,-1,SIZE/2, SIZE/2);
    drawFigures(r);
    context.restore();
    drawArrow(-SIZE, SIZE / 2, SIZE, SIZE / 2);
    drawArrow( SIZE / 2, SIZE, SIZE / 2, 0);
    setPointerAtDot(1);
    setPointerAtDot(5);

}
function drawFigures(r){
    context.beginPath();
    context.moveTo(0,0);
    context.lineTo(0,GRAPH_SIZE*r/5);
    context.lineTo(-GRAPH_SIZE/2*r/5, 0);
    context.lineTo(0,0);
    context.stroke();
    context.moveTo(-1, 1);
    context.fill();
    context.moveTo(-GRAPH_SIZE/2*r/5, 0);
    context.lineTo(0,0);
    context.lineTo(0, -GRAPH_SIZE/2*r/5)
    context.arc(0,0, GRAPH_SIZE/2*r/5, Math.PI, Math.PI*3/2, false)
    context.stroke();
    context.fill();
    context.moveTo(0,0);
    context.lineTo(0,-GRAPH_SIZE/2*r/5);
    context.lineTo(GRAPH_SIZE*r/5, -GRAPH_SIZE/2*r/5);
    context.lineTo(GRAPH_SIZE*r/5,0);
    context.lineTo(0,0);
    context.stroke();
    context.moveTo(1, -1);
    context.fill();
    context.moveTo(0,0);

}


function setPointerAtDot(max_r = 5) {
    const totalPoints = 12;
    const pointInPixels = SIZE / totalPoints;
    context.textAlign = "center";
    context.textBaseline = "middle";
    context.fillText(`${max_r}`, SIZE / 2 + pointInPixels * max_r, SIZE / 2 - TEXT_MARGIN);
    context.fillText(`${max_r}`, SIZE / 2 + TEXT_MARGIN, SIZE / 2 - pointInPixels * max_r);

    context.beginPath()
    context.lineWidth = LINE_WIDTH;
    context.moveTo(SIZE / 2 + pointInPixels * max_r, SIZE / 2 + TEXT_LINE_HEIGHT);
    context.lineTo(SIZE / 2 + pointInPixels * max_r, SIZE / 2 - TEXT_LINE_HEIGHT);
    context.moveTo(SIZE / 2 + TEXT_LINE_HEIGHT, SIZE / 2 - pointInPixels * max_r);
    context.lineTo(SIZE / 2 - TEXT_LINE_HEIGHT, SIZE / 2 - pointInPixels * max_r);
    context.stroke();
}
function drawPoint(x, y, r, success = true) {
    let r_now = validator.lastClickedR
    if (r_now != null) {
        x *= r_now / r
        y *= r_now / r
    }

    context.fillStyle = success ? COLOR_GREEN : COLOR_RED;
    const totalPoints = 12;
    const pointInPixels = SIZE / totalPoints;
    context.beginPath();
    context.arc(
        SIZE / 2 + pointInPixels * x,
        SIZE / 2 - y * pointInPixels,
        5,
        0,
        Math.PI * 2,
    );
    context.fill();
    context.beginPath();
    context.fillStyle = "black"
    context.lineWidth = 1.5
    context.arc(
        SIZE / 2 + pointInPixels * x,
        SIZE / 2 - y * pointInPixels,
        5,
        0,
        Math.PI * 2
    )
    context.stroke();
}
function drawArrow(fromX, fromY, toX, toY){
    let headLen = 10; // length of head in pixels
    let dx = toX - fromX;
    let dy = toY - fromY;
    let angle = Math.atan2(dy, dx);
    context.beginPath();
    context.lineWidth = 2;
    context.moveTo(fromX, fromY);
    context.lineTo(toX, toY);
    context.lineTo(toX - headLen * Math.cos(angle - Math.PI / 6), toY - headLen * Math.sin(angle - Math.PI / 6));
    context.moveTo(toX, toY);
    context.lineTo(toX - headLen * Math.cos(angle + Math.PI / 6), toY - headLen * Math.sin(angle + Math.PI / 6));
    context.stroke();
}
function drawPoints(){
    let arrData=[];
    arrData.shift() // Delete headers
    arrData.forEach(dot =>{
        drawPoint(dot.x, dot.y, dot.r, dot.status)
    })
}
