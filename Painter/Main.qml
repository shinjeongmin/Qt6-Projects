import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("Painter Example")

    StackLayout {
        id: stackLayout
        anchors.fill: parent

        // index == 0
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "white"
            CanvasPainter {
                anchors.fill: parent
            }
        }

        // index == 1
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "lightblue"
            // TODO::ShapePainter
            ShapePainter{
                anchors.fill: parent
            }
        }
    }

    Row {
        anchors {
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
            bottomMargin: 20
        }

        Button {
            text: "Canvas Painter"
            onClicked: stackLayout.currentIndex = 0
        }
        Button {
            text: "Shape Painter"
            onClicked: stackLayout.currentIndex = 1
        }
    }
}
