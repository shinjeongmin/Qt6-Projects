import QtQuick
import QtQuick.Controls

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Canvas Example")

    Canvas{
        id: canvas
        anchors.fill: parent
        onPaint: {
            var ctx = getContext("2d")
            ctx.fillStyle = "blue" // Fill Color of Rectangle
            ctx.fillRect(50,50,100,100) // Draw Rectangle
            ctx.strokeStyle = "red"; // 선 색상 설정
            ctx.lineWidth = 2; // 선 굵기 설정
            ctx.beginPath();
            ctx.moveTo(200, 200); // Start Point
            ctx.lineTo(300, 300); // End Point
            ctx.stroke(); // Draw line!
            ctx.closePath();
        }
    }
}
