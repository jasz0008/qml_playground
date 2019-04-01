import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12

ApplicationWindow {
    id: window
    title: "Image View"
    visible: true
    // width: 1000
    // height: 300

    // Force the window to honor the layout items' minimum size constraints
    property real aspectRatio: width / height
    // minimumWidth: layout.implicitWidth
    // minimumHeight: layout.implicitHeight

    Material.theme: Material.Dark
    Material.accent: Material.DeepPurple

    // Single item fills application window
    // Row of uniformly sized items, honor item aspect ratios
    // N x N items
    // M x N items

    // if items < 4, {row, column} only
    //   if window.aspectRatio >=1, row layout
    //     if window.aspectRatio > layout.aspectRatio, pad [left, right]
    //     else, pad [top, bottom]
    //   else, column layout
    // else, {row, column, grid} all possibilities


    // https://stackoverflow.com/questions/26152097/how-does-one-create-a-staggered-grid-view-in-qml/26152698

    Flow {
        id: layout
        anchors.fill: parent
        property real aspectRatio: implicitWidth / implicitHeight

        //columns: 3
        Rectangle {
            color: "red"
            property real aspectRatio: 1.5
            // Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            // Layout.minimumWidth: 300
            // Layout.minimumHeight: 200
            x: ((window.width / 2) - (layout.implicitWidth / 2))
            y: ((window.height / 2) - (layout.implicitHeight / 2))
            width: {
                const winAR = window.aspectRatio;
                const layAR = layout.aspectRatio;
                if (isNaN(winAR) || isNaN(winAR)) {
                    return 300;
                }

                if (winAR >= 1.0) {
                    // Row layout
                    if (winAR >= layAR) {
                        // Pad [left, right]
                        return (window.width / 3);
                    } else {
                        // Pad [top, bottom]
                        return (window.width / 3);
                    } 
                } else {
                    if (winAR >= layAR) { 
                        return window.width;
                    } else {
                        return window.width;
                    }
                    return window.width;
                } 
            }
            height: (width / aspectRatio)
            // Layout.fillWidth: true
            // Layout.fillHeight: true
        }
        Rectangle {
            color: "green"
            property real aspectRatio: 1.5
            // Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            // Layout.minimumWidth: 300
            // Layout.minimumHeight: 200
            width: (window.aspectRatio > 1.0 ? (window.width / 3) : window.width)
            height: (width / aspectRatio)
            // Layout.fillWidth: true
            // Layout.fillHeight: true
        }
        Rectangle {
            color: "blue"
            property real aspectRatio: 1.5
            // Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            // Layout.minimumWidth: 300
            // Layout.minimumHeight: 200
            width: (window.aspectRatio > 1.0 ? (window.width / 3) : window.width)
            height: (width / aspectRatio)
            // Layout.fillWidth: true
            // Layout.fillHeight: true
        }
        // Rectangle {
        //     color: "blue"
        //     Layout.minimumWidth: 300
        //     Layout.minimumHeight: 300
        //     Layout.fillWidth: true
        //     Layout.fillHeight: true
        // }
        // Rectangle {
        //     color: "green"
        //     Layout.minimumWidth: 300
        //     Layout.minimumHeight: 300
        //     Layout.fillWidth: true
        //     Layout.fillHeight: true
        // }
        // Rectangle {
        //     color: "red"
        //     Layout.minimumWidth: 300
        //     Layout.minimumHeight: 300
        //     Layout.fillWidth: true
        //     Layout.fillHeight: true
        // }
        // Rectangle {
        //     color: "green"
        //     Layout.minimumWidth: 300
        //     Layout.minimumHeight: 300
        //     Layout.fillWidth: true
        //     Layout.fillHeight: true
        // }
        // Rectangle {
        //     color: "red"
        //     Layout.minimumWidth: 300
        //     Layout.minimumHeight: 300
        //     Layout.fillWidth: true
        //     Layout.fillHeight: true
        // }
        // Rectangle {
        //     color: "blue"
        //     Layout.minimumWidth: 300
        //     Layout.minimumHeight: 300
        //     Layout.fillWidth: true
        //     Layout.fillHeight: true
        // }
    }
}