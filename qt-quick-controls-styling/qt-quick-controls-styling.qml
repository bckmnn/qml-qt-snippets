import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 1.3
import com.bckmnn.customstyle 1.0

Window {
    id: window1
    width: 600
    height: 300
    visible: true

    MouseArea {
        anchors.fill: parent
        onClicked: {
            Qt.quit();
        }


    }

    Text {
        width: 363
        height: 35
        text: qsTr("Custom Style Example")
        anchors.left: parent.left
        anchors.leftMargin: 16
        anchors.top: parent.top
        anchors.topMargin: 16
    }

    ProgressBar {
        id: progressBar1
        x: 16
        y: 118
        width: 568
        height: 23
        value:0.5
        style: RedStyle.progressBarStyle
    }

    ProgressBar {
        id: progressBar2
        x: 16
        y: 231
        width: 568
        height: 23
        value: 0.5
    }

    Button {
        id: button2
        x: 16
        y: 199
        text: "Standard Button"
    }

    Button {
        id: button1
        x: 16
        y: 86
        text: "Styled Button"
        style: RedStyle.btnStyle
    }

    Button {
        id: button3
        x: 16
        y: 158
        text: "2nd Styled Button"
        style: RedStyle.btnStyle2
    }



}

