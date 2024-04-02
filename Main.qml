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
            interval: 1000
            repeat: true
            running: true
            onTriggered: {
                var component = Qt.createComponent("button.qml")
                var button = component.createObject(mainWindow)
                button.show()
            }
        }
    }
}
