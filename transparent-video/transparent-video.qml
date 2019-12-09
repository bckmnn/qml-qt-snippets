import QtQuick 2.11
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtMultimedia 5.12

Window {
    id: rect
    color: "#555"

    width: 800
    height: 600

    Component.onCompleted: {
        // setting the width and height of the root window
        Window.window.title = "Transparent Video"
    }

    Item {
        id: transparentVideo
            width: 960
            height: 540
            MediaPlayer {
                id: mediaPlayer
                source: "test.mp4"
                autoPlay: true
                loops: MediaPlayer.Infinite
                autoLoad: false
            }

            VideoOutput {
                id: video
                width: parent.width
                height: parent.height*2
                source: mediaPlayer
            }

            ShaderEffect {
                property variant source: ShaderEffectSource { sourceItem: video; hideSource: true }
                anchors.fill: parent
                opacity: 1
                fragmentShader: "
                    varying highp vec2 qt_TexCoord0;
                    uniform lowp float qt_Opacity;
                    uniform sampler2D source;
                    void main(void)
                    {
                        highp vec2 texCoord = qt_TexCoord0;
                        texCoord.y = texCoord.y*0.5;
                        gl_FragColor = texture2D(source, texCoord);
                        texCoord.y = texCoord.y + 0.50;
                        vec4 alpha = texture2D(source, texCoord);
                        float a = min(dot(alpha.rgb,alpha.rgb),1.0);
                        a = smoothstep(0.0,1.0,a);
                        gl_FragColor.rgb *= a;
                        gl_FragColor.a = a;
                        gl_FragColor *=  qt_Opacity;
                    }
                "
            }
        }

    MouseArea{
        anchors.fill: parent
        hoverEnabled: true
        onPositionChanged: {
            transparentVideo.x = mouseX - transparentVideo.width/2
            transparentVideo.y = mouseY - transparentVideo.height/2
            transparentVideo.opacity = Math.min(mouseX/(width/2),1.0)
        }
    }


}
