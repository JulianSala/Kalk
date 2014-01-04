import QtQuick 2.0

Item {
    width: 100
    height: 100

    property alias text: displayText.text
    property alias color: backgroundRect.color
    property bool operator: false
    property bool funct: flase
    property string display: ""

    signal send(string Message)
    signal trigger(string Operation)

    Rectangle {
        id: backgroundRect
        color: "lightgrey"
        anchors.fill: parent
    }

    Text {
        id: displayText
        text: "N/A"
        textFormat: Text.RichText
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: parent.height / 2
        anchors.fill: parent
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            if (funct)
                trigger(displayText.text);
            else
                send(display);

            console.log(text + " Clicked");
        }
    }
}
