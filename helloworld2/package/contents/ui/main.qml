/*
    Copyright (C) 2015  Leslie Zhai <xiang.zhai@i-soft.com.cn>

    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Lesser General Public
    License as published by the Free Software Foundation; either
    version 2.1 of the License, or (at your option) any later version.

    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public
    License along with this library; if not, write to the Free Software
    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
*/

import QtQuick 2.0
import QtQuick.Layouts 1.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras
import org.kde.kcoreaddons 1.0 as KCoreAddons               // KUser
import org.kde.kquickcontrolsaddons 2.0                     // KCMShell

Item {
    Layout.minimumWidth: 200
    Layout.minimumHeight: 300

    KCoreAddons.KUser {
        id: kuser
    }

    Image {
        id: faceIcon
        source: kuser.faceIconUrl
        width: units.gridUnit * 3
        height: width
    }

    PlasmaCore.IconItem {
        source: "user-identity"
        visible: faceIcon.status !== Image.Ready
        width: units.gridUnit * 3
        height: width
        anchors {
            top: faceIcon.top
            right: faceIcon.right
            rightMargin: -units.gridUnit / 2
        }

        MouseArea {
            anchors.fill: parent
            acceptedButtons: Qt.LeftButton
            cursorShape: Qt.PointingHandCursor
            onClicked: {
                KCMShell.open("kcm_useraccount")
            }
        }
    }

    PlasmaExtras.Heading {
        id: nameLabel

        level: 2
        text: kuser.fullName
        elide: Text.ElideRight
        verticalAlignment: Text.AlignTop
        height: paintedHeight

        anchors {
            left: faceIcon.right
            top: faceIcon.top
            right: parent.right
            leftMargin: units.gridUnit
            rightMargin: units.gridUnit
        }
    }
}
