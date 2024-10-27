import QtQuick 2.15
import QtQuick.Controls 2.15
import Calculator

ApplicationWindow{
    width: 300
    height: 400
    title: "Calculator"

    CalculatorModel{
        id: calculator
    }

    Rectangle{
        anchors.fill: parent
        color: "white"

        Column{
            anchors.fill:parent
            spacing: 10

            Text{
                id: display
                color: "black"
                text: calculator.result
                font.pixelSize: 120
                horizontalAlignment: Text.AlignLeft
                width: parent.width
                maximumLineCount: 1
            }

            Row{
                spacing: 10
                Repeater {
                    model: ["7", "8", "9", "/"]
                    CustomButton{
                        text: modelData
                    }
                }
            }
            Row{
                spacing: 10
                Repeater {
                    model: ["4", "5", "6", "*"]
                    CustomButton{
                        text: modelData
                    }
                }
            }
            Row{
                spacing: 10
                Repeater {
                    model: ["1", "2", "3", "-"]
                    CustomButton{
                        text: modelData
                    }
                }
            }
            Row{
                spacing: 10
                Repeater {
                    model: ["C", "0", "=", "+"]
                    CustomButton{
                        text: modelData
                    }
                }
            }
        }
    }

    component CustomButton : Button {
        id: customButton
        width: 100
        height: 100

        onClicked: {
            switch(text){
            case "C":
                calculator.calMode = CalculatorModel.None
                calculator.result = 0
                break
            case "=":
                calculator.calMode = CalculatorModel.None
                break
            case "+":
                calculator.calMode = CalculatorModel.Plus
                break
            case "-":
                calculator.calMode = CalculatorModel.Minus
                break
            case "*":
                calculator.calMode = CalculatorModel.Multiply
                break
            case "/":
                calculator.calMode = CalculatorModel.Divide
                break
            default:
                calculator.calculate(Number(modelData))
                break
            }
        }
    }
}
