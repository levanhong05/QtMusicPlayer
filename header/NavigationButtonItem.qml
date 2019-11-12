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
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.2
import QtGraphicalEffects 1.0

ItemDelegate {
    id: control

    property bool isActive: false

    Layout.fillWidth: true
    Layout.alignment: Qt.AlignHCenter
    focusPolicy: Qt.NoFocus

    height: 40

    width: drawerVD.width

    Shortcut {
        context: Qt.ApplicationShortcut

        sequences: modelData.shortcut !== undefined ? modelData.shortcut : []

        onActivated: {
            control.clicked()
        }
    }

    Rectangle {
        visible: control.isActive
        height: control.height
        width: control.width
        color: Material.listHighlightColor
    }

    Row {
        spacing: 0
        topPadding: 0

        leftPadding: 30
        rightPadding: 20

        anchors.verticalCenter: parent.verticalCenter

        Item {
            anchors.verticalCenter: parent.verticalCenter

            width: 50
            height: 32

            Image {
                id: icon

                width: 32
                height: 32

                horizontalAlignment: Image.AlignLeft
                anchors.verticalCenter: parent.verticalCenter
                source: "qrc:/musicplayer/images/header/" + modelData.icon
                opacity: control.isActive ? drawerVD.activeOpacity : drawerVD.inactiveOpacity
            }

            ColorOverlay {
                id: colorOverlay
                anchors.fill: icon
                source: icon
            }
        }

        Label {
            anchors.verticalCenter: parent.verticalCenter
            text: modelData.name
            opacity: 0.87
            color: control.down ? "#5bdef0" : "#ffffff"
            font.pointSize: 12
        }
    }

    onClicked: {
        navigationBar.close()

        headerBarIndex = index
    }
}
