import QtCore
import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

ApplicationWindow {
    width: 640
    height: 480
    visible: true

    header: ToolBar {
        Button {
            text: qsTr("Choose Image...")
            onClicked: fileDialog.open()
        }
    }

    Image {
        id: image
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
    }

    FileDialog {
        id: fileDialog
        currentFolder: StandardPaths.standardLocations(StandardPaths.PicturesLocation)[0]
        onAccepted: image.source = selectedFile
    }
}
