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
import QtQuick.Controls 1.1
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras
import org.kde.kcoreaddons 1.0 as KCoreAddons               // KUser
import org.kde.kquickcontrolsaddons 2.0                     // KCMShell
import org.kde.plasma.networkmanagement 0.2 as PlasmaNM

Item {
    id: root
    Layout.minimumWidth: 200
    Layout.minimumHeight: 300

    property bool iconChanged: false

    Plasmoid.toolTipSubText: networkStatus.activeConnections

    KCoreAddons.KUser {
        id: kuser
    }

    PlasmaNM.NetworkStatus {
        id: networkStatus
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

    Button {
        id: hidePopupBtn
        text: "hidePopup"
        anchors.top: faceIcon.bottom
        onClicked: {
            plasmoid.expanded = false;
        }
    }

    Button {
        id: changeIconBtn
        text: "changeIcon"
        anchors.top: hidePopupBtn.bottom
        onClicked: {
            root.iconChanged = !root.iconChanged;
            plasmoid.icon = root.iconChanged ? "security-high" : "security-low";
        }
    }
}
