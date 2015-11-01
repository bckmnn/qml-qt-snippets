import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

ButtonStyle {
        label:Item{
            anchors.fill:parent
            Label{
                anchors.centerIn: parent
                text:control.text
            }
        }
        background: Rectangle {
            implicitWidth: 200
            implicitHeight: 25
            border.width:  1
            border.color: control.activeFocus ? "#fcc":"#666"
            radius: 4
            gradient: Gradient {
                GradientStop { position: control.pressed ? 0 : 1 ; color: "#3fffef" }
                GradientStop { position: control.pressed ? 1 : 0 ; color: "#a0e0f3" }
            }
        }
}
