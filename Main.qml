import QtQuick
import QtQuick.Controls

Window {
    id: mainWindow
    width: 300
    height: 600
    visible: true
    title: qsTr("QmlMovement")

    Column {
        Timer {
            id: m_timer
            interval: Math.random() * 900 + 100
            repeat: true
            running: true
            onTriggered: {
                var ccb = compBtn.createObject(mainWindow)
                m_timer.interval = Math.random() * 900 + 100
            }
        }
    }

    Component {
        id: compBtn

        Button {
            id: btn
            width: 20
            height: 20
            x: Math.random() * (mainWindow.width - btn.width)
            y: Math.random() * 100
            hoverEnabled: true
            onClicked: destroy()

            function btnMove() {
                if (btn.hovered)
                {
                    btn.y += 0.5
                }
                else
                {
                    btn.y += 0.25
                }

                if (btn.y > mainWindow.height)
                {
                    mainWindow:title = qsTr("Game Over!")
                    mainWindow:color = "Red"
                    btn.destroy()
                }
            }

            Timer {
                id: btn_timer
                interval: Math.random() * 10 + 5
                repeat: true
                running: true
                onTriggered: btn.btnMove()
            }
        }
    }
}
