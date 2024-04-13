import QtQuick
import QtQuick.Controls

Window {
    id: mainWindow
    width: 300
    height: 600
    visible: true
    title: qsTr("QmlMovement")

    Timer {
        id: mTimer
        interval: Math.random() * 900 + 100
        repeat: true
        running: true
        onTriggered: {
            var ccb = compBtn.createObject(mainWindow)
            mTimer.interval = Math.random() * 900 + 100
        }
    }

    Timer {
        id: btnTimer
        interval: 10
        repeat: true
        running: true
        signal signalBtnTimer
        onTriggered: {
            btnTimer.signalBtnTimer()
        }
    }

    Component {
        id: compBtn

        Button {
            id: btn
            width: 20
            height: 20
            hoverEnabled: true
            onClicked: destroy()

            property double dy: Math.random() % 0.5 + 0.1

            Connections {
                target: btnTimer
                function onSignalBtnTimer() {
                    btn.hovered ? btn.y += dy * 2 : btn.y += dy

                    if (btn.y > mainWindow.height)
                    {
                        mainWindow:title = qsTr("Game Over!")
                        mainWindow:color = "Red"
                        btn.destroy()
                    }
                }
            }

            Component.onCompleted: {
                btn.x = Math.random() * (mainWindow.width - btn.width)
                btn.y = Math.random() * 100
            }
        }
    }
}
