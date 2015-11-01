//Style.qml with custom singleton type definition
pragma Singleton
import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

AbstractStyle {
    id:root
    btnFontColor: "white"
    btnFontSize: 14
    btnStyle: ButtonStyle {
        label:Item{
            anchors.fill:parent
            Label{
                font.pixelSize: root.btnFontSize
                color: root.btnFontColor
                anchors.centerIn: parent
                text:control.text
            }
        }
        background: Rectangle {
            implicitWidth: 200
            implicitHeight: 25
            border.width:  1
            border.color: control.activeFocus ? "#de2c2c":"#2c1616"
            radius: 4
            gradient: Gradient {
                GradientStop { position: control.pressed ? 0 : 0.5 ; color: control.pressed ? "#bf2638" : "#ec4255" }
                GradientStop { position: control.pressed ? 0.5 : 1 ; color: control.pressed ? "#ec4255" : "#bf2638" }
            }
        }
    }
    btnStyle2: MyButtonStyle{
    }
    progressBarStyle: ProgressBarStyle{
        background: Rectangle {
            radius: 2
            color: "#d3d3d3"
            border.color: "gray"
            border.width: 1
            implicitWidth: 200
            implicitHeight: 24
        }
        progress: Rectangle {
            color: "#ec4255"
            border.color: "#bf2638"
        }
    }
}

