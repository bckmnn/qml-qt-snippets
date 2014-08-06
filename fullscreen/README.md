# fullscreen

this example shows how to set up your qml app to toggle into fullscreen mode. including a quick and dirty workaround for osx showing just a white window after `window.showFullScreen();`

here the size is fixed. to get a dynamic size you could just position your stuff directly in the `window` element, or setting `anchors.fill: parent` for the *stage* rectangle.