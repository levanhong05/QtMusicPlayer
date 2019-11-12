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

import "../scripts/global.js" as Global

Pane {
    id: launchBar

    Material.elevation: 8

    property real activeOpacity: 0.9
    property real inactiveOpacity: 0.6

    property var launchBarModel

    leftPadding: 0
    rightPadding: 0

    height: 70

    Layout.fillWidth: true

    background: Rectangle {
        color: "#0d384e"
    }

    RowLayout {
        focus: false

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top

        spacing: 0

        anchors.verticalCenter: parent.verticalCenter

        Repeater {
            model: launchBarModel

            BottomNavigationButton {
                id: myButton

                visible: true
            }
        }
    }
}
