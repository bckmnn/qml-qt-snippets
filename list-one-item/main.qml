import QtQuick 2.2
import QtQuick.Window 2.1

Window {
    id: mainWindow
    visible: true
    width: 500
    height: 300

    MouseArea {
        anchors.fill: parent
        onClicked: {
            Qt.quit();
        }
    }

    ListModel {
        id: myModel
        ListElement {
            name: "Red"
            rectColor: "#ff0000"
        }
        ListElement {
            name: "Green"
            rectColor: "#00ff00"
        }
        ListElement {
            name: "Blue"
            rectColor: "#0000ff"
        }
    }

    Component {
        id: delegate
        Rectangle {
            id: wrapper
            width: 150
            height: 150
            Rectangle {
                anchors.horizontalCenter: nameText.horizontalCenter
                anchors.fill: parent
                color: rectColor
            }
            Text {
                id: nameText
                text: name
                font.pointSize: 16
                anchors.centerIn: parent
                color: "#fff"
            }
        }
    }

    PathView{
        width: 150
        height: 150
        model: myModel
        delegate: delegate

        focus: true

        Keys.onDownPressed:  {
            decrementCurrentIndex();
        }
        Keys.onUpPressed: {
            incrementCurrentIndex();
        }
        Keys.onEscapePressed: {
            Qt.quit();
        }

        preferredHighlightBegin: 0.5
        preferredHighlightEnd: 0.5
        pathItemCount: 1
        snapMode:PathView.SnapOneItem

        path: Path {
            startX: width/2; startY: 0
            PathLine{ x:width/2; y:150}
        }
    }

    Text {
        text: qsTr("press UP/DOWN to cycle through list\npress ESC to quit")
        color: "#666"
        x: (parent.width - width)/2
        y: (parent.height - height) -20
    }
}
