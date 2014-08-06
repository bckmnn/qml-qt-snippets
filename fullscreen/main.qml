import QtQuick 2.2
import QtQuick.Window 2.1

Window {
    id: mainWindow
    visible: true
    width: 500
    height: 300

    color: "#000000"

    Rectangle {
        id: stage
        width: 500
        height: 300
        anchors.centerIn: parent        // center in parent to keep stage centered
                                        // in fullscreen mode

        focus:true                      // to recieve keyboard input
                                        // note: windows can't have focus. window
                                        // focus is managed by the os. to recieve
                                        // keyboard events you have to set focus
                                        // to true for one of your items inside
                                        // the window

        color: "white"

        Keys.onPressed: {
            if(event.key === Qt.Key_F){
                if(mainWindow.visibility ==  Window.FullScreen){
                    mainWindow.hide();  // workaround for osx, not needed on windows
                                        // without it you would get a white window. at
                                        // least on my macbook with qt 5.3
                    mainWindow.showNormal();
                }else{
                    mainWindow.hide();  // workaround for osx, not needed on windows
                                        // without it you would get a white window
                    mainWindow.showFullScreen();
                }
                event.accepted = true;  // prevent event from bubbling upwards
            }
            if(event.key === Qt.Key_Escape){
                Qt.quit();              // quit app
            }
        }

        // put stuff here that should be on the stage:

        Rectangle{
            color: "#ff0000"
            width: 20
            height: 20
            x: 20
            y: 20
        }

        Rectangle{
            color: "#0000ff"
            width: 20
            height: 20
            x: stage.width - 40
            y: stage.height - 40
        }

        Text {
            anchors.centerIn: parent
            color: "#666666"
            text: "hit ESC to quit\nhit F to toggle fullscreen"
        }
    }
}
