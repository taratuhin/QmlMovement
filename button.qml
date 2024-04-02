import QtQuick
import QtQuick.Controls


Item {
    id: itm
    width: 300
    height: 600

    Button {
        id: btn
        width: 20
        height: 20
        x: Math.random() * 280// + width
        y: Math.random() * 100
        onClicked: destroy()

        MouseArea {
            id: mouseArea
            hoverEnabled: true
            property bool hovered: false

            onEntered: hovered = true
        }

        function btnMove() {
            if (hovered)
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
