import QtQuick 2.0
import "main.js" as Main

Rectangle {
    id: rectangle1
    width: 480
    height: 800

    Image {
        id: backgroud
        source: "background.png"
        anchors.fill: parent
        fillMode: Image.Tile
    }

    Flickable {
        id: display
        anchors {
            top: parent.top
            bottom: numericGrid.top
            right: parent.right
            left: parent.left
            margins: 10
        }

        Image {
            anchors.fill: parent
            fillMode: Image.Tile
            source: "display_background.png"
        }

        function ensureVisible(r)
        {
            if (contentX >= r.x)
                contentX = r.x;
            else if (contentX + width <= r.x + r.width)
                contentX = r.x + r.width - width;

            if (contentY >= r.y)
                contentY = r.y;
            else if (contentY + height <= r.y + r.height)
                contentY = r.y + r.height - height;
        }

        TextEdit {
            id: edit
            width: display.width
            height: display.height
            wrapMode: TextEdit.Wrap
            horizontalAlignment: TextEdit.AlignRight

            font.pixelSize: height / 4
//            font.capitalization: Font.AllLowercase

            onCursorRectangleChanged: display.ensureVisible(cursorRectangle)
        }
    }


    GridView {
        id: numericGrid

        height: cellHeight * 4

        cellWidth: width / 5
        cellHeight: cellWidth

        anchors {
//            top: display.bottom
            right: parent.right
            left: parent.left
            bottom: parent.bottom
            margins: 10
        }

        ListModel {
            id: basicKeys
            ListElement { operator: false; funct: false; text: "7"; display: "7"; }
            ListElement { operator: false; funct: false; text: "8"; display: "8" }
            ListElement { operator: false; funct: false; text: "9"; display: "9" }
            ListElement { operator: true;  funct: true;  text: "DEL"; display: "" }
            ListElement { operator: true;  funct: true;  text: "AC"; display: "" }

            ListElement { operator: false; funct: false; text: "4"; display: "4" }
            ListElement { operator: false; funct: false; text: "5"; display: "5" }
            ListElement { operator: false; funct: false; text: "6"; display: "6" }
            ListElement { operator: true;  funct: false; text: "X"; display: "*" }
            ListElement { operator: true;  funct: false; text: "&#247;"; display: "/" }

            ListElement { operator: false; funct: false; text: "1"; display: "1" }
            ListElement { operator: false; funct: false; text: "2"; display: "2" }
            ListElement { operator: false; funct: false; text: "3"; display: "3" }
            ListElement { operator: true;  funct: false; text: "+"; display: "+" }
            ListElement { operator: true;  funct: false; text: "-"; display: "-" }

            ListElement { operator: false; funct: false; text: "0"; display: "0" }
            ListElement { operator: false; funct: false; text: "."; display: "." }
            ListElement { operator: true;  funct: false; text: "EXP"; display: "E" }
            ListElement { operator: true;  funct: false; text: "ANS"; display: "Ans" }
            ListElement { operator: true;  funct: true; text: "="; display: "" }
        }

        model: basicKeys
//            ["7", "8", "9", "DEL", "AC",
//                "4", "5", "6", "*", "/",
//                "1", "2", "3", "+", "-",
//                "0", ".", "Exp", "Ans" ,"="]

        delegate: Rectangle {
            width: numericGrid.cellWidth;
            height: numericGrid.cellHeight;
            color: "transparent"
            Button {
                anchors.fill: parent
                anchors.margins: 2
                text: model.text
                funct: model.funct
                operator: model.operator
                display: model.display
                color: if (model.operator) "darkgrey"; else "lightgrey";
                onSend: edit.text = edit.text + Message;
                onTrigger: Main.doOperation(Operation);
            }
        }
    }
}
