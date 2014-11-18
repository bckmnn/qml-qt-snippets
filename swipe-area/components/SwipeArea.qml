import QtQuick 2.0

MouseArea {
    property point origin
    property bool active: false
    signal move( int x, int y )
    signal swipe( string direction )

    onPressed: {
        drag.axis = Drag.XAndYAxis
        active = false
        origin = Qt.point( mouse.x, mouse.y )
    }

    onPositionChanged: {
        switch ( drag.axis ) {
            case Drag.XAndYAxis:
                if ( Math.abs( mouse.x - origin.x ) > 10 ) {
                    drag.axis = Drag.XAxis
                    active = true
                }
                else if ( Math.abs( mouse.y - origin.y ) > 10 ) {
                    drag.axis = Drag.YAxis
                    active = true
                }
                break
            case Drag.XAxis:
                move( mouse.x - origin.x, 0 )
                break
            case Drag.YAxis:
                move( 0, mouse.y - origin.y )
                break
        }
    }

    onReleased: {
        switch ( drag.axis ) {
            case Drag.XAndYAxis:
                canceled( mouse )
                break
            case Drag.XAxis:
                swipe( mouse.x - origin.x < 0 ? "left" : "right" )
                break
            case Drag.YAxis:
                swipe( mouse.y - origin.y < 0 ? "up" : "down" )
                break
        }
    }
}
