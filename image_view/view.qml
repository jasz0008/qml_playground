import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12

ApplicationWindow {
    id: mainWindow
    title: "Image View"
    visible: true
    width: 934
    height: 1399

    Material.theme: Material.Dark
    Material.accent: Material.DeepPurple

    // Scroll wheel zoom
    // Double click zoom
    // Drag to pan
    // Zoom indication delegate

    Flickable {
        id: flick
        width: 640 // Viewport dimensions
        height: 480
        boundsBehavior: Flickable.StopAtBounds
        boundsMovement: Flickable.StopAtBounds
        contentWidth: image.sourceSize.width // TODO: What does this actually do?
        contentHeight: image.sourceSize.height
        clip: true

        Rectangle {
            id: rect
            width: Math.max(image.sourceSize.width, flick.width)
            height: Math.max(image.sourceSize.height, flick.height)
            transform: Scale {
                id: scaler
                origin.x: pinchArea.m_x2
                origin.y: pinchArea.m_y2
                xScale: pinchArea.m_zoom2
                yScale: pinchArea.m_zoom2
            }

            Image {
                id: image
                source: "./photo-1500259571355-332da5cb07aa.jpg" // TODO: Make property
                anchors.fill: parent
                z: dragArea.z + 1 // TODO: What does this do?
            }

            PinchArea {
                id: pinchArea
                anchors.fill: parent
                property real m_x1: 0
                property real m_y1: 0
                property real m_y2: 0
                property real m_x2: 0
                property real m_zoom1: 0.5 // TODO: Make property
                property real m_zoom2: 0.5 // TODO: Make property
                property real m_max: 2 // TODO: Make property
                property real m_min: 0.5 // TODO: Make property

                // TODO: Wheel/double-click/pinch zoom shares a lot of common code
                function zoomIn() {

                }

                function zoomOut() {

                }

                // onPinchStarted: {
                //     console.log("Pinch started");
                //     m_x1 = scaler.origin.x;
                //     m_y1 = scaler.origin.y;
                //     m_x2 = pinch.startCenter.x;
                //     m_y2 = pinch.startCenter.y;

                //     const dx = (pinchArea.m_x1 - pinchArea.m_x2);
                //     const dy = (pinchArea.m_y1 - pinchArea.m_y2);
                //     rect.x += (dx * (1 - pinchArea.m_zoom1));
                //     rect.y += (dy * (1 - pinchArea.m_zoom1));
                // }

                // onPinchUpdated: {
                //     console.log("Pinch updated");
                //     m_zoom1 = scaler.xScale;
                //     const dz = pinch.scale - pinch.previousScale;
                //     const newZoom = m_zoom1 + dz;
                //     if ((newZoom <= m_max) && (newZoom >= m_min)) {
                //         m_zoom2 = newZoom;
                //     }
                // }

                MouseArea {
                    id: dragArea
                    anchors.fill: parent
                    drag.axis: Drag.XAndYAxis
                    drag.filterChildren: true // TODO: What does this do?
                    drag.minimumX: 0
                    drag.minimumY: 0
                    drag.maximumX: flick.width - image.sourceSize.width
                    drag.maximumY: flick.height - image.sourceSize.height
                    drag.target: rect
                    hoverEnabled: true

                    // onDoubleClicked: {
                    //     var button;
                    //     if (mouse.button === Qt.LeftButton) {
                    //         button = "left";
                    //     } else if (mouse.button == Qt.RightButton) {
                    //         button = "right";
                    //     } else {
                    //         button = "middle";
                    //     }
                    //     console.log("Double clicked " + button + " mouse button!");
                    // }

                    onWheel: {
                        pinchArea.m_x1 = scaler.origin.x;
                        pinchArea.m_y1 = scaler.origin.y;
                        pinchArea.m_zoom1 = scaler.xScale;
                        pinchArea.m_x2 = mouseX;
                        pinchArea.m_y2 = mouseY;

                        var newZoom;
                        if (wheel.angleDelta.y > 0) {
                            newZoom = pinchArea.m_zoom1 + 0.1;
                            pinchArea.m_zoom2 = Math.min(newZoom, pinchArea.m_max);
                        } else {
                            newZoom = pinchArea.m_zoom1 - 0.1;
                            pinchArea.m_zoom2 = Math.max(newZoom, pinchArea.m_min);
                        }

                        const dx = (pinchArea.m_x1 - pinchArea.m_x2);
                        const dy = (pinchArea.m_y1 - pinchArea.m_y2);
                        rect.x += (dx * (1 - pinchArea.m_zoom1));
                        rect.y += (dy * (1 - pinchArea.m_zoom1));
                    }
                }
            }
        }
    }
}