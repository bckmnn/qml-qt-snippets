import QtQuick 2.2
import QtQuick.Window 2.1

Window {
    id: mainWindow
    visible: true
    width: 500
    height: 300

    Row{
        anchors.fill: parent
        anchors.margins: 20
        spacing: 20
        CustomButton{
            text: "Hello World!"
            Rectangle{
             anchors.fill: parent
             color:"red"
            }
        }

        CustomButton{
            text: "Hello again!"
            Rectangle{
             anchors.fill: parent
             color:"green"
            }
        }
        CustomButton{
            text: "And goodbye!"
            Rectangle{
             anchors.fill: parent
             color:"yellow"
            }
        }
    }


    Text {
        text: qsTr("press UP/DOWN to cycle through list\npress ESC to quit")
        color: "#666"
        x: (parent.width - width)/2
        y: (parent.height - height) -20

        Keys.onEscapePressed: {
            Qt.quit();
        }
    }
}
