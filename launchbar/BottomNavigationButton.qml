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

Item {
    id: control

    property bool isActive: index == launchBarMenuIndex

    Layout.alignment: Qt.AlignHCenter

    implicitHeight: 50
    implicitWidth: (launchBar.width - 62) / launchBarMenuModel.length

    Column {
        spacing: 10
        topPadding: 0

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        Item {
            anchors.horizontalCenter: parent.horizontalCenter
            width: 24
            height: 24

            Image {
                id: contentImage

                width: 24
                height: 24

                verticalAlignment: Image.AlignTop
                anchors.horizontalCenter: parent.horizontalCenter

                source: "qrc:/musicplayer/images/launchbar/" + modelData.icon
                opacity: control.isActive ? launchBar.activeOpacity : launchBar.inactiveOpacity
            }

            ColorOverlay {
                id: colorOverlay
                anchors.fill: contentImage
                source: contentImage
                color: control.isActive ? "#039be6" : "#b0b0b0"
            }
        }

        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            text: modelData.name
            opacity: control.isActive ? 1.0 : 0.7
            color: control.isActive ? "#039be6" : "#b0b0b0"
            font.pointSize: 12

            font.weight: Font.Normal
        }
    }

    MouseArea {
        anchors.fill: parent

        anchors.margins: 0
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor

        onClicked: {
            launchBarMenuIndex = index
        }
    }
}
