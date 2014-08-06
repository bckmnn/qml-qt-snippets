import QtQuick 2.2
import QtQuick.Window 2.1

Window {
    id: mainWindow
    visible: true
    width: 500
    height: 300

    ListModel {                         // data source for PathView
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
        id: pathView
        y: 20
        x: (parent.width-pathView.width)/2 // center pathView horizontaly
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

        preferredHighlightBegin: 0.5      // to center currentItem on PathView
        preferredHighlightEnd: 0.5        // path.
        pathItemCount: 1                  // show exactly one Item on Path
        snapMode:PathView.SnapOneItem

        path: Path {
            startX: pathView.width/2; startY: 0                 // start path in top center of PathView
            PathLine{ x:pathView.width/2; y:pathView.height}    // end path on bottom center of PathView
        }
    }

    Text {
        text: qsTr("press UP/DOWN to cycle through list\npress ESC to quit")
        color: "#666"
        x: (parent.width - width)/2
        y: (parent.height - height) -20
    }
}
