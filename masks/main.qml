import QtQuick 2.2
import QtQuick.Window 2.1
import QtQuick.Controls 1.2

Window {
    id: mainWindow
    visible: true
    width: 500
    height: 300

    Item{
        id: stage
        anchors.fill: parent
        focus: true

        Keys.onEscapePressed: {
            Qt.quit();
        }

        TabView{
            anchors.fill: parent
            Tab{
                title: "Simple Mask"
                SimpleMask{

                }
            }
            Tab{
                title: "Gradient Mask"
                GradientMask{

                }
            }
        }

        Text {
            anchors.horizontalCenter: stage.horizontalCenter
            anchors.bottom: stage.bottom
            anchors.bottomMargin: 20
            color: "#666666"
            text: "hit ESC to quit\nmove mouse left right to move mask"
        }
    }




}
