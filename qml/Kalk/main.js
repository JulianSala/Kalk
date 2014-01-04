var gridSpacing = 2;

function doOperation(op) {
    if (op  == "DEL" && edit.text != "") {
        edit.remove(edit.text.length - 1, edit.text.length);
        console.log("Undo function")
    } else if (op == "AC")
        edit.text = "";
    else if (op == "=")
        runEquation(edit.text);
}

function runEquation(eq)
{
    for (var i = 0; i < eq.lengt; i++) {

    }
}
