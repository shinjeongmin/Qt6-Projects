import QtCore
import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

ApplicationWindow {
    visible: true
    width: 1280
    height: 720
    title: "Photo Viewer"

    Rectangle {
        anchors.fill: parent
        color: "black"

        Image {
            id: imageView
            x: 0
            y: 0
            width: parent.width
            height: parent.height
            visible: fileDialog.fileUrl !== ""
            fillMode: Image.PreserveAspectFit
        }
    }

    Button {
        z: 1
        anchors {
            right: parent.right
            bottom: parent.bottom
            margins: 10
        }
        text: "Choose photo.."
        onClicked: {
            fileDialog.open()
        }
    }

    FileDialog{
        id: fileDialog
        title: "Choose photo file"
        nameFilters: ["Image files (*.jpg *.png *.bmp)"]
        onAccepted: {
            console.log("selectedFile:", selectedFile)
            imageView.source = selectedFile
        }
    }

    MouseArea{
        id: mouseArea
        anchors.fill: parent

        // 이미지 이동을 위한 변수
        property real pressedX: 0.0
        property real pressedY: 0.0

        onWheel: (wheel) => {
            if(wheel.angleDelta.y > 0){
                 imageView.scale += 0.1
             }
             else{
                 imageView.scale -= 0.1
             }
        }

        onPressed: {
            pressedX = mouseX
            pressedY = mouseY
        }
        onPositionChanged: {
            if(mouseArea.pressed){
                var dx = mouseX - pressedX
                var dy = mouseY - pressedY

                imageView.x += dx
                imageView.y += dy

                pressedX = mouseX
                pressedY = mouseY
            }
        }
    }
}
