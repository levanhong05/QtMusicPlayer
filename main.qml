import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.VirtualKeyboard 2.3

import "header"
import "launchbar"
import "screens"

ApplicationWindow {
    id: window

    visible: true

    width: 460
    height: 640

    title: qsTr("Music Player")

    property int launchBarMenuIndex: 0

    property var launchBarMenuModel: [
        { name: qsTr("Home"), icon: "home.png", page: "screens/HomeScreen.qml" },
        { name: qsTr("Videos"), icon: "video.png", page: "screens/VideoScreen.qml" },
        { name: qsTr("Charts"), icon: "chart.png", page: "screens/ChartScreen.qml" },
        { name: qsTr("Topics"), icon: "topic.png", page: "screens/TopicScreen.qml" },
        { name: qsTr("Notifications"), icon: "notification.png", page: "screens/NotificationScreen.qml" }
    ]

    header: HeaderBar {
        id: headerBarMenu
    }

    SwipeView {
        id: swipeView

        anchors.fill: parent

        currentIndex: launchBarMenuIndex

        HomeScreen {
        }

        VideoScreen {
        }

        ChartScreen {
        }

        TopicScreen {
        }

        NotificationScreen {
        }
    }

    footer: BottomNavigationBar {
        id: launchBarMenu

        launchBarModel: launchBarMenuModel
    }

    InputPanel {
        id: inputPanel
        z: 99
        x: 0
        y: window.height
        width: window.width

        states: State {
            name: "visible"
            when: inputPanel.active

            PropertyChanges {
                target: inputPanel
                y: window.height - inputPanel.height
            }
        }

        transitions: Transition {
            from: ""
            to: "visible"
            reversible: true

            ParallelAnimation {
                NumberAnimation {
                    properties: "y"
                    duration: 250
                    easing.type: Easing.InOutQuad
                }
            }
        }
    }
}
