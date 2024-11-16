import QtQuick
import QtQuick.Controls
import QtQuick.Shapes

Item {
    id: shapePainter
    readonly property int pointLimit: 6

    Component {
        id: pathComponent
        PathLine {

        }
    }

    function addPoint(x,y) {
        if(path.pathElements.length >= pointLimit){
            return
        }

        if(path.pathElements.length === 0){
            path.startX = x
            path.startY = y
        }
        path.pathElements.push(pathComponent.createObject(
                                   shapePainter,
                                   {x:x, y:y}))

        if(path.pathElements.length === pointLimit){
            path.pathElements.push(pathComponent.createObject(
                                       shapePainter,
                                       {x: path.startX, y:path.startY}))
        }
    }

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
                shape.visible = false

                for(var i=0; i<path.pathElements.length; i++){
                    path.pathElements[i].destroy()
                }
                path.pathElements = []
            }
        }
    }


    Item {
        anchors {
            top: buttons.bottom
            left: parent.left
            bottom: parent.bottom
            right: parent.right
        }

        MouseArea{
            z:1
            anchors.fill: parent
            onClicked: {
                addPoint(mouseX, mouseY)
                shape.visible = true
            }
        }

        layer.enabled: true
        layer.samples: 8 // higher => cost up + antialiasing up
        Shape {
            id: shape
            anchors.fill: parent

            ShapePath{
                id: path
                strokeWidth: 3
                strokeColor: "black"
                fillColor: "pink"

            }
        }
    }
}
