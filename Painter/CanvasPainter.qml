import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: canvasPainter
    Row {
        id: buttons
        anchors{
            top: parent.top
            left: parent.left
        }

        Button {
            id: clearButton
            text: "Clear"
            width: 80
            height: 40

            onClicked: {
                // clear canvas
                canvas.clear()
            }
        }
    }

    Canvas {
        id: canvas
        anchors {
            top: buttons.bottom
            left: parent.left
            bottom: parent.bottom
            right: parent.right
        }

        property int lastX: 0
        property int lastY: 0

        function clear() {
            var ctx = getContext("2d")
            ctx.reset()
            canvas.requestPaint()
        } 

        MouseArea {
            id: area
            anchors.fill: parent

            onPressed: {
                canvas.lastX = mouseX
                canvas.lastY = mouseY
            }
            onPositionChanged: {
                canvas.requestPaint()
            }
        }

        onPaint: {
            var ctx = getContext("2d")
            ctx.lineWidth = 5
            ctx.beginPath()
            ctx.moveTo(lastX, lastY)
            lastX = area.mouseX
            lastY = area.mouseY

            ctx.lineTo(lastX, lastY)
            ctx.stroke()
        }
    }
}
