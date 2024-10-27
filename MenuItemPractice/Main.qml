import QtQuick
import QtQuick.Controls

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("Menu Example")

    MenuBar{
        Menu {
            title: "File"
            MenuItem { text: "New"}
            MenuItem { text: "Open"}
            MenuItem { text: "Save" }
        }
        Menu {
            title: "Edit"
            MenuItem { text: "Cut"}
            MenuItem { text: "Copy"}
            MenuItem { text: "Paste"}
        }
    }
}
