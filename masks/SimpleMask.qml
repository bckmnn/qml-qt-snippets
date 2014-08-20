import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    anchors.fill: parent
    Item {
        id: myMask
        anchors.fill: mySource
        visible:false
        Rectangle{
            id: innerGradient
            width: 50
            height: 100
            y: (mouseArea.mouseX/mouseArea.width)*-height
            x: 0
            gradient: Gradient {
                GradientStop { position: 0.0; color: "red" }
                GradientStop { position: 0.5; color: "red" }
                GradientStop { position: 1.0; color: "transparent" }
            }
        }
    }



    Rectangle{
        id: mySource
        x:20
        y:100
        width:50
        height:50
        radius: width/2
        color: "transparent"
        border.color: "blue"
        border.width: 5
        visible:false
    }



    OpacityMask{
        source:mySource
        maskSource: myMask
        anchors.fill: mySource;
    }

    Rectangle{
        id: mySourceVisible
        x:120
        y:100
        width:50
        height:50
        radius: width/2
        color: "transparent"
        border.color: "blue"
        border.width: 5
        visible:true
    }


    Item {
        id: myMaskVisible
        anchors.fill: mySourceVisible
        visible:true
        clip: false
        Rectangle{
            id: innerGradientVisible
            width: 50
            height: 100
            y: (mouseArea.mouseX/mouseArea.width)*-height
            x: 0
            gradient: Gradient {
                GradientStop { position: 0.0; color: "red" }
                GradientStop { position: 0.5; color: "red" }
                GradientStop { position: 1.0; color: "transparent" }
            }
        }
    }
    Rectangle{
        id: mySourceVisibleHint
        x:120
        y:100
        width:50
        height:50
        radius: width/2
        color: "transparent"
        border.color: "blue"
        opacity: 0.1
        border.width: 5
        visible:true
    }


    MouseArea {
        id: mouseArea
        hoverEnabled: true
        anchors.fill: parent
    }

    Text {
        y:20
        anchors.topMargin: 20
        anchors.horizontalCenter: mySource.horizontalCenter
        text: "Combined"
    }

    Text {
        y:20
        anchors.topMargin: 20
        anchors.horizontalCenter: mySourceVisible.horizontalCenter
        text: "Source & Mask"
    }

    Text {
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.topMargin: 20
        anchors.rightMargin: 20
        color: "#666666"
        text: "source: blue circle\nmaskSource: red rectangle\n> animating gradient position"
    }
}
