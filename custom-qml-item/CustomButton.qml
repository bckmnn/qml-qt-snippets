import QtQuick 2.0

Item {
    id:root
    property string text: "Label"
    default property alias content:container.children;
    width: 100
    height: 32

    Item{
        id: container
        anchors.fill: parent
    }

    Text {
        id: label
        text: root.text
        anchors.centerIn: parent
    }
}
