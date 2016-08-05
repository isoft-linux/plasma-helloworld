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
import org.kde.plasma.components 2.0 as PlasmaComponents

Item {
    Layout.minimumWidth: 200
    Layout.minimumHeight: 300

    ListModel {
        id: testModel

        // FIXME: ki18n lead to QTBUG-16289 https://bugreports.qt.io/browse/QTBUG-16289
        // Qt developers did *NOT* fixed the issue 'ListElement: cannot use script 
        // for property value' until Qt5.4, that means
        // ListElement { name: qsTr("") } also lead to such issue before Qt5.4!
        ListElement { name: i18n("Leslie Zhai") }
    }

    PlasmaComponents.Label {
        text: i18n("Hello World")
    }
}
