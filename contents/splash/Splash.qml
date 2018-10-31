/*
 *   Copyright 2014 Marco Martin <mart@kde.org>
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License version 2,
 *   or (at your option) any later version, as published by the Free
 *   Software Foundation
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details
 *
 *   You should have received a copy of the GNU General Public
 *   License along with this program; if not, write to the
 *   Free Software Foundation, Inc.,
 *   51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */

import QtQuick 2.5
import QtQuick.Window 2.2

Rectangle {
    id: root
    color: "black"

    property int stage

    onStageChanged: {
        if (stage == 1) {
            introAnimation1.running = true;
        } else if (stage == 2) {
            introAnimation1.running = false;
            introAnimation2.running = true;
        } else if (stage == 3) {
            introAnimation2.running = false;
            introAnimation3.running = true;
        } else if (stage == 3) {
            introAnimation3.running = false;
            introAnimation4.running = true;
        } else if (stage == 4) {
            introAnimation4.running = false;
            introAnimation5.running = true;
        } else if (stage == 5) {
            introAnimation4.running = false;
            introAnimation5.running = true;
        }
    }

    Item {
        id: content
        anchors.fill: parent
        opacity: 1
        TextMetrics {
            id: units
            text: "M"
            property int gridUnit: boundingRect.height
            property int largeSpacing: units.gridUnit
            property int smallSpacing: Math.max(2, gridUnit/4)
        }

        Image {
            id: logo
            //match SDDM/lockscreen avatar positioning
            property real size: units.gridUnit * 8

            anchors.centerIn: parent

            source: "images/arch.svgz"

            sourceSize.width: size
            sourceSize.height: size
        }
        Row {
            spacing: units.smallSpacing*4
            anchors {
                bottom: parent.bottom
                right: parent.horizontalCenter
                bottomMargin: units.gridUnit*16
            }
            Text {
                id: maintext
                color: "#ffffff"
                // Work around Qt bug where NativeRendering breaks for non-integer scale factors
                // https://bugreports.qt.io/browse/QTBUG-67007
                renderType: Screen.devicePixelRatio % 1 !== 0 ? Text.QtRendering : Text.NativeRendering
                anchors.verticalCenter: parent.verticalCenter
                text: 'btw i use arch'
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 24
                font.weight: Font.Bold
                font.bold: true
                font.wordSpacing: 6
                font.letterSpacing: 2
            }
        }
        Rectangle {
            id: rectOverlay
            anchors {
                bottom: parent.bottom
                right: parent.right
                rightMargin: units.gridUnit*33
                bottomMargin: units.gridUnit*15
            }
            height: 50
            width: 230
            opacity: 0.8
            color: '#000000'
        }
    }

    PropertyAnimation {
        id: introAnimation1
        running: false
        property: "width"
        target: rectOverlay
        to: 160
        duration: 1500
        easing.type: Easing.Linear
        easing.overshoot: 1.0
    }
    
    PropertyAnimation {
        id: introAnimation2
        running: false
        property: "width"
        target: rectOverlay
        to: 100
        duration: 1500
        easing.type: Easing.Linear
        easing.overshoot: 1.0
    }
    
    PropertyAnimation {
        id: introAnimation3
        running: false
        property: "width"
        target: rectOverlay
        to: 80
        duration: 1500
        easing.type: Easing.Linear
        easing.overshoot: 1.0
    }
    
    PropertyAnimation {
        id: introAnimation4
        running: false
        property: "width"
        target: rectOverlay
        to: 40
        duration: 1500
        easing.type: Easing.Linear
        easing.overshoot: 1.0
    }
    
    PropertyAnimation {
        id: introAnimation5
        running: false
        property: "width"
        target: rectOverlay
        to: 0
        duration: 800
        easing.type: Easing.InOutBack
        easing.overshoot: 1.0
    }
}
