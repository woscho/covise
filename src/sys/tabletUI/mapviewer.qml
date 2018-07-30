/****************************************************************************
**
** Copyright (C) 2015 The Qt Company Ltd.
** Contact: http://www.qt.io/licensing/
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** You may use this file under the terms of the BSD license as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

//! [Imports]
import QtQuick 2.0
import QtPositioning 5.5
import QtLocation 5.6
//! [Imports]

Rectangle {
    width: 500
    height: 500
    color: red
    /*
    anchors.fill: parent
    //! [Initialize Plugin]
    Plugin {
        id: myPlugin
        name: "osm" // "mapboxgl", "esri", ...
        //specify plugin parameters if necessary
        //PluginParameter {...}
        //PluginParameter {...}
        //...
    }
    //! [Initialize Plugin]

    //! [Current Location]
//    PositionSource {
//        id: positionSource
//        property variant lastSearchPosition: locationHeli
//        active: true
//        updateInterval: 120000 // 2 mins
//        onPositionChanged:  {
//            var currentPosition = positionSource.position.coordinate
//            map.center = currentPosition
//            var distance = currentPosition.distanceTo(lastSearchPosition)
//            if (distance > 500) {
//                // 500m from last performed pizza search
//                lastSearchPosition = currentPosition
//                searchModel.searchArea = QtPositioning.circle(currentPosition)
//                searchModel.update()
//            }
//        }
//    }
    //! [Current Location]

    //! [PlaceSearchModel]
    property variant locationHeli: QtPositioning.coordinate( 50.9, 6.5)
    property string markerName: "testName"

//    PlaceSearchModel {
//        id: searchModel

//        plugin: myPlugin

//        searchTerm: "Pizza"
//        searchArea: QtPositioning.circle(locationHeli)

//        Component.onCompleted: update()
//    }
    //! [PlaceSearchModel]

    //! [Places MapItemView]
    Map {
        id: map
        anchors.fill: parent
        plugin: myPlugin;
        center: locationHeli
        zoomLevel: 13
        MapQuickItem {
                        id: simpleMarker
                        coordinate: locationHeli

                        anchorPoint.x: simage.width * 0.5
                        anchorPoint.y: simage.height

                        sourceItem: Column {
                            Image { id: simage; source: "marker.png" }
                            Text { id: smarkerlable; text: markerName; font.bold: true }
                        }
            }


        MapPolyline {
                id: polyline
                line.width: 3
                line.color: 'green'
            }

        Component.onCompleted: {
            var lines = []
            console.error("aa");
            for(var i=0; i < size; i++){
                lines[i] = geopath.coordinateAt(i);
            }
            polyline.path = lines
        }
    }
    //! [Places MapItemView]

//    Connections {
//        target: searchModel
//        onStatusChanged: {
//            if (searchModel.status == PlaceSearchModel.Error)
//                console.log(searchModel.errorString());
//        }
//    }
*/
    function setMarker(name, latitude, longitude, altitude)
    {
            locationHeli = QtPositioning.coordinate( latitude, longitude);
            markerName = name;
     }
    function center(latitude, longitude)
    {
            map.center = QtPositioning.coordinate( latitude, longitude);
     }
}

