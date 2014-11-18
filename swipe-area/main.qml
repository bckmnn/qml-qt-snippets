import QtQuick 2.2
import QtQuick.Window 2.1

import "./components"

Window {
    visible: true
    width: 500; height: 500

    Rectangle {
        id: rect
        width: 200; height: 200

        x: 150; y: 150

        color: "#f00"

        SwipeArea {
            anchors.fill: rect

            onClicked: {
                if(active === false) rect.color = rect.color == "#ff0000" ? "#0f0" : "#f00"
            }

            onSwipe: {
                switch ( direction ) {
                    case "right" :
                        rect.x = 300
                        break
                    case "left" :
                        rect.x = 0
                        break
                    case "up" :
                        rect.y = 0
                        break
                    case "down" :
                        rect.y = 300
                        break
                }
            }
        }
    }
}
