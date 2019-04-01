import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12

ApplicationWindow {
    id: mainWindow
    title: "Overlay Menu"
    visible: true
    width: 640
    height: 480

    Material.theme: Material.Dark
    Material.accent: Material.DeepPurple

    Column {
        Row {
            Button {
                text: "Click Me"
                onClicked: {
                    overlay.visible = !overlay.visible
                }
            }
        }
        Row {
            Rectangle {
                color: "red"
                width: 320
                height: 240

                Popup {
                    id: overlay
                    width: 160
                    height: 120
                    visible: true

                    Overlay.modeless: Label {
                        text: "Hello there"
                    }
                }
            }
        }
    }


}