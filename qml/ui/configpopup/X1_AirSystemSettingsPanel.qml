import QtQuick 2.0

import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Dialogs 1.0
import QtQuick.Controls.Material 2.12

import Qt.labs.settings 1.0

import OpenHD 1.0

import "../../ui" as Ui
import "../elements"

// Temporary dummy
Rectangle {

    Layout.fillHeight: true
    Layout.fillWidth: true

    //width: parent.width
    //height: 600

    property int rowHeight: 64
    property int elementHeight: 48

    Component {
        id: delegateAirPiSettingsValue
        Item {
            id: item
            width: 200
            height: 64
            Row {
                anchors.fill: parent
                spacing: 5

                Label {
                    width:150
                    text: model.unique_id
                    font.bold: true
                }
                Label {
                    width:100
                    text: "Val: "+model.value
                    font.bold: true
                }
                Button {
                    text: "GET"
                    onClicked: _airPiSettingsModel.try_fetch_parameter(model.unique_id)
                }
                TextInput {
                    id: xTextInput
                    width:100
                    text: ""+model.value
                    cursorVisible: false
                }
                Button {
                    text: "SET"
                    onClicked: _airPiSettingsModel.try_update_parameter( model.unique_id,xTextInput.text)
                }
            }
        }
    }

    ColumnLayout {
        anchors.fill: parent

        /*Label{
            width:200
            height:64
            text: "Not found yet"
            visible: _airPiSettingsModel.rowCount() > 0
        }*/

        Button {
            height: 48
            id: fetchAllButtonId
            text:"FetchAllAir"
            onClicked: {
                var result=_airPiSettingsModel.try_fetch_all_parameters()
                /*visible=false;
                if(result===true){
                    visible=true;
                }*/
            }
        }
        Rectangle{
            width:parent.width
            height: parent.height-64

            ScrollView{
                anchors.fill: parent

                ListView {
                    //top: fetchAllButtonId.bottom
                    width: parent.width
                    model: _airPiSettingsModel
                    delegate: delegateAirPiSettingsValue
                }
            }
        }
    }
}