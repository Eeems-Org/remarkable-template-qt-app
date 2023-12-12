import QtQuick 2.10
import QtQuick.Window 2.3
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.0

ApplicationWindow {
    id: window
    objectName: "window"
    visible: stateController.state !== "loading"
    width: screenGeometry.width
    height: screenGeometry.height
    title: Qt.application.displayName
    Component.onCompleted: {
        controller.startup();
    }
    header: Rectangle {
        color: "black"
        height: menu.height
        RowLayout {
            id: menu
            anchors.left: parent.left
            anchors.right: parent.right
            Label {
                text: "⬅️"
                color: "white"
                topPadding: 5
                bottomPadding: 5
                leftPadding: 10
                rightPadding: 10
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        console.log("Back button pressed");
                        if(stateController.state === "loaded"){
                            console.log("Quitting");
                            Qt.quit();
                            return;
                        }
                        console.log("Going back to main view");
                        stateController.state = "loaded";
                    }
                }
            }
            Item { Layout.fillWidth: true }
            Label {
                color: "white"
                text: window.title
            }
            Item { Layout.fillWidth: true }
        }
    }
    contentData: [
        Rectangle {
            anchors.fill: parent
            color: "white"
            Text {
                anchors.centerIn: parent
                text: "Hello World!"
            }
        }
    ]
    StateGroup {
        id: stateController
        objectName: "stateController"
        state: "loading"
        states: [
            State { name: "loaded" },
            State { name: "loading" }
        ]
        transitions: [
            Transition {
                from: "*"; to: "loaded"
                SequentialAnimation {
                    ScriptAction { script: {
                        console.log("Display loaded");
                    } }
                }
            },
            Transition {
                from: "*"; to: "loading"
                SequentialAnimation {
                    ScriptAction { script: {
                        console.log("Loading display");
                        controller.startup();
                    } }
                }
            }
        ]
    }
}
