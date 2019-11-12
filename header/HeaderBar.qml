/****************************************************************************
**
** Copyright (C) 2019 Eric Lee.
** Contact: levanhong05@gmail.com
** Company: Freelancer
**
** This file is part of the QtMusicPlayer project.
**
**All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
**
****************************************************************************/

import QtQuick 2.10
import QtQuick.Extras 1.4
import QtQuick.Window 2.10
import QtQuick.Dialogs 1.3
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import QtGraphicalEffects 1.0
import QtQuick.Controls.Material 2.1

import "../scripts/global.js" as Global
import "../scripts/branding.js" as Branding

Frame {
    property bool drawerVisible: true

    property bool topSpacing: true

    padding: 10

    Layout.fillWidth: true

    background: Rectangle {
        color: "#38addb"
        border.color: "transparent"
        radius: 0
    }

    property var navigationModel: [
        {"type": "../header/NavigationButtonItem.qml", "name": qsTr("About us"), "icon": "about.png" },
        {"type": "../header/NavigationButtonItem.qml", "name": qsTr("Help and Support"), "icon": "help.png" }
    ]

    property int headerBarIndex: -1

    onHeaderBarIndexChanged: {
        //TODO

        //After process, reset header index by -1
        headerBarIndex = -1
    }

    ColumnLayout {
        anchors.fill: parent

        RowLayout {
            Layout.fillWidth: true

            spacing: 30

            Image {
                id: btnMenu

                Layout.preferredWidth: 24
                Layout.preferredHeight: 24

                fillMode: Image.PreserveAspectFit
                smooth: true

                horizontalAlignment: Image.AlignHCenter
                verticalAlignment: Image.AlignVCenter

                source: "qrc:/musicplayer/images/header/menu.png"

                MouseArea {
                    anchors.fill: parent

                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor

                    onClicked: {
                        navigationBar.open()
                    }
                }
            }

            TextField {
                id: txtSearch

                Layout.fillWidth: true

                selectByMouse: true

                background: Rectangle {
                    color: enabled ? "transparent" : "#e4e4e4"

                    anchors.fill: parent

                    Rectangle {
                        width: parent.width
                        height: 2
                        anchors.bottom: parent.bottom
                        color: "transparent"
                        border.color: txtSearch.hovered ? "#000000" : txtSearch.focus ? "#0ea6f9" : "#bcbcbc"
                    }
                }

                font.pointSize: 12
                placeholderText: enabled ? qsTr("Enter search key word") : ""

                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            Image {
                id: btnSearch

                Layout.preferredWidth: 24
                Layout.preferredHeight: 24

                fillMode: Image.PreserveAspectFit
                smooth: true

                horizontalAlignment: Image.AlignHCenter
                verticalAlignment: Image.AlignVCenter

                source: "qrc:/musicplayer/images/header/search.png"

                MouseArea {
                    anchors.fill: parent

                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                }
            }
        }
    }

    // The sliding Drawer
    NavigationBar {
        id: navigationBar
    }
}
