import QtQuick
import QtQuick.Controls
import QtQuick.Window

import "."

Window {
    width: 720
    height: 720
    visible: true
    title: qsTr("Music Chart")

    MusicChartSearchModel {
        id: musicSearchModel
    }

    // UI

    // ListView 상단의 검색 필드, 버튼
    Row{
        id: searchRow
        anchors{
            top: parent.top
            topMargin: 5
            left: parent.left
            leftMargin: 5
            right: parent.right
            rightMargin: 5
        }
        spacing: 5
        TextField{
            id: searchField
            focus: true
            placeholderText: "Search song ..."
            width: parent.width - searchButton.width - 20

            Keys.onPressed: (event)=>{
                                // Enter Key -> call search()
                                if(event.key === Qt.Key_Return || event.key === Qt.Key_Enter){
                                    musicSearchModel.search(searchField.text)
                                }
                            }
        }

        Button {
            id: searchButton
            anchors {
                top: searchField.top
                bottom: searchField.bottom
            }
            text: "Search"
            onClicked: {
                musicSearchModel.search(searchField.text)
            }
        }
    }

    // Loading Indicator
    BusyIndicator{
        id: searchLoadingIndicator
        visible: musicSearchModel.isSearching
        anchors{
            centerIn: parent
        }
        implicitWidth: 250
        implicitHeight: 250

        running: musicSearchModel.isSearching
    }

    // ListView !!
    ListView{
        id: musicChartList
        visible: !musicSearchModel.isSearching
        anchors{
            top: searchRow.bottom
            left: parent.left
            leftMargin: 5
            right: parent.right
            rightMargin: 5
            bottom: parent.bottom
            bottomMargin: 5
        }
        clip: true

        model: musicSearchModel
        ScrollBar.vertical: ScrollBar{
            id: verticalScrollBar
            width: 12
            anchors.right: parent.right
            policy: ScrollBar.AlwaysOn
        }

        // iteration about musicSearchModel
        delegate: Item{
            height: 110

            Rectangle {
                height: parent.height
                border.width: 1

                Row{
                    anchors {
                        top: parent.top
                        topMargin: 5
                        bottom: parent.bottom
                        bottomMargin: 5
                        left: parent.left
                        leftMargin: 5
                    }
                    spacing: 8
                    Image{
                        height: 100
                        width: 100
                        source: model.musicImageSource // model means each list node
                    }
                    Column {
                        id: column
                        Text {
                            text: model.musicName
                            font.pixelSize: 16
                            font.bold: true
                            color: "black"
                        }
                        Text{
                            text: model.musicSinger
                            color: "grey"
                        }
                    }
                }
            }
        }
    }
}
