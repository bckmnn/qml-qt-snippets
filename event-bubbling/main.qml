import QtQuick 2.2
import QtQuick.Window 2.1
import QtQuick.Controls 1.2

Window {
    visible: true
    width: 600
    height: 300
    Item {
        id: stage
        anchors.fill: parent

        TextArea{
            id: logger
            readOnly: true
            width: 300
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            text: "new stuff is on top ^"
        }

        Rectangle{
            id: parentRect
            x:25
            y: 25
            width: 250
            height: 250
            color: "#eafffd"

            focus: true

            border.color: "red"
            border.width: focus ? 5 : 0     // if has focus then 5 else 0

            Keys.onPressed: {
                logger.text = "evaluating [Keys.onPressed] of parentRect\n" + logger.text
                if(event.key === Qt.Key_A){
                    childA.focus = true;
                }
                if(event.key === Qt.Key_B){
                    childB.focus = true;
                }
            }

            onFocusChanged: {
                if(focus){
                    logger.text = "parentRect recieved focus\n" + logger.text
                }
            }

            Rectangle{
                id:childA
                x: 25; y:25
                width: parent.width/2 - 50
                height: parent.height-50
                color: "#b1dbff"

                border.color: "red"
                border.width: focus ? 5 : 0

                Keys.onPressed: {
                    logger.text = "evaluating [Keys.onPressed] of childA\n" + logger.text
                    if(event.key === Qt.Key_A){
                        childAChildA.focus = true;
                        event.accepted = true;
                    }
                    if(event.key === Qt.Key_B){
                        childAChildB.focus = true;
                        event.accepted = true;
                    }
                }

                onFocusChanged: {
                    if(focus){
                        logger.text = "childA recieved focus\n" + logger.text
                    }
                }

                Rectangle{
                    id:childAChildA
                    x: 25; y:25
                    width: parent.width - 50
                    height: parent.height/2-50
                    color: "#cfb1ff"

                    border.color: "red"
                    border.width: focus ? 5 : 0

                    Keys.onPressed: {
                        logger.text = "evaluating [Keys.onPressed] of childAChildA\n" + logger.text
                    }

                    onFocusChanged: {
                        if(focus){
                            logger.text = "childAChildA recieved focus\n" + logger.text
                        }
                    }
                }

                Rectangle{
                    id:childAChildB
                    x: 25; y:parent.height/2+25
                    width: parent.width - 50
                    height: parent.height/2-50
                    color: "#fff7b9"

                    border.color: "red"
                    border.width: focus ? 5 : 0

                    Keys.onPressed: {
                        logger.text = "evaluating [Keys.onPressed] of childAChildB\n" + logger.text
                        if(event.key === Qt.Key_B){
                            parentRect.focus = true;
                            event.accepted = true;
                        }
                    }

                    onFocusChanged: {
                        if(focus){
                            logger.text = "childAChildB recieved focus\n" + logger.text
                        }
                    }
                }

            }

            Rectangle{
                id:childB
                x: parent.width/2 + 25; y:25
                width: parent.width/2 - 50
                height: parent.height-50
                color: "#c2ffb1"

                border.color: "red"
                border.width: focus ? 5 : 0

                Keys.onPressed: {
                    logger.text = "evaluating [Keys.onPressed] of childB\n" + logger.text
                    if(event.key === Qt.Key_A){
                        childBChildA.focus = true;
                    }
                    if(event.key === Qt.Key_B){
                        childBChildB.focus = true;
                    }
                }

                onFocusChanged: {
                    if(focus){
                        logger.text = "childB recieved focus\n" + logger.text
                    }
                }

                Rectangle{
                    id:childBChildA
                    x: 25; y:25
                    width: parent.width - 50
                    height: parent.height/2-50
                    color: "#ffb1e5"

                    border.color: "red"
                    border.width: focus ? 5 : 0

                    onFocusChanged: {
                        if(focus){
                            logger.text = "childBChildA recieved focus\n" + logger.text
                        }
                    }
                }

                Rectangle{
                    id:childBChildB
                    x: 25; y:parent.height/2+25
                    width: parent.width - 50
                    height: parent.height/2-50
                    color: "#ffe2b9"

                    border.color: "red"
                    border.width: focus ? 5 : 0

                    onFocusChanged: {
                        if(focus){
                            logger.text = "childBChildB recieved focus\n" + logger.text
                        }
                    }
                }
            }

        }
    }

}
