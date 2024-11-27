import QtQuick
import QtQuick.Controls

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Exchanger")

    Rectangle{
        anchors.fill: parent
        color: "white"

        Column{
            anchors.centerIn: parent
            spacing: 10

            Row{
                spacing: 10
                ComboBox{
                    id: currencyComboBox
                    width: 100
                    model: ["KRW", "USD"]
                }
                TextField{
                    id: amountField
                    placeholderText: "Enter amount"
                    width: 200
                }
            }

            Button{
                id: convertButton
                text: "Convert"
                onClicked: {
                    if(currencyComboBox.currentText === "KRW"){
                        var krwAmount = parseFloat(amountField.text)
                        if(!isNaN(krwAmount)){
                            var usdAmount = krwAmount / 1000 // 1USD = 1000KRW
                            resultLabel.text = "USD: " + usdAmount.toFixed(2)
                        }
                    }else if(currencyComboBox.currentText === "USD"){
                        var usdAmount = parseFloat(amountField.text)
                        if(!isNaN(usdAmount)){
                            var krwAmount = usdAmount * 1000
                            resultLabel.text = "KRW: " + krwAmount.toFixed(2)
                        }
                    }
                }
            }

            Label {
                id: resultLabel
                text: ""
            }
        }
    }
}
