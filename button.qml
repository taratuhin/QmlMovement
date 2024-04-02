import QtQuick
import QtQuick.Controls


Item {
    id: itm
    width: mainWindow.width
    height: mainWindow.height

    Button {
        id: btn
        width: 20
        height: 20
        x: Math.random() * (itm.width - btn.width)
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
