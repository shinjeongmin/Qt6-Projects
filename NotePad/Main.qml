import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs
import NotePad

ApplicationWindow {
    width: 800
    height: 800
    visible: true
    title: qsTr("NotePad Example")

    // 파일 읽기, 쓰기용 모델 객체
    FileIO {
        id: fileIO
    }

    // 메뉴 버튼 눌렀을 때 동작
    function saveFile(){
        fileDialog.title = "Save"
        fileDialog.open()
    }
    function openFile(){
        fileDialog.title = "Open"
        fileDialog.open()
    }

    // 파일 탐색기를 확인 버튼 눌러서 닫을 때의 동작
    function saveTextToFile(fileUrl){
        fileIO.write(fileUrl, textArea.text)
    }
    function openTextFromFile(fileUrl){
        textArea.text = fileIO.read(fileUrl)
    }

    menuBar: MenuBar{
        id: menuBar
        Menu{
            title: "File"
            MenuItem{
                text: "Save"
                onTriggered: saveFile()
            }
            MenuItem{
                text: "Open"
                onTriggered: openFile()
            }
        }
    }

    // 텍스트 컨텐츠 영역
    Rectangle {
        anchors.fill: parent
        color: "white"
        TextArea {
            id: textArea
            anchors.fill: parent
            focus: true
            wrapMode: Text.Wrap
        }
    }

    // 파일 탐색기 (다이얼로그)
    FileDialog {
        id: fileDialog
        fileMode: {
            switch(fileDialog.title){
            case "Save":
                return FileDialog.SaveFile
            case "Open":
                return FileDialog.OpenFile
            default:
                return FileDialog.OpenFile
            }
        }
        nameFilters: ["Text files (*.txt)"]
        currentFolder: ""
        onAccepted: {
            if(fileDialog.fileUrl !== ""){
                if(fileDialog.title === "Save"){
                    // saveText
                    saveTextToFile(selectedFile)
                } else if (fileDialog.title === "Open"){
                    // openText
                    openTextFromFile(selectedFile)
                }
            }
        }
    }
}
