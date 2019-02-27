var SQUARE_SIZE = 71;
var ANGLE_FREEZING_LENGTH = 40;
var NUM_START = 1001;

var USER_SELECTED = 'orange';
var USER_DESELECTED = 'green';
var USER_DISABLED = 'red';

var EDITED_ENABLED = 'green';
var EDITED_DISABLED = 'red';

var squareColor = new Color(0, 0.5, 0, 0.25);
var draggingShouldStart = false;
var drawSquaresOnMouseUp = false;
var shouldMoveMap = false;
var shouldMoveGroupOnDrag = false;
var current_line;
var editMode = true;
var raster = null;
var square_num = NUM_START;
var selectedGroup = null;
var emplacementsVendus = [];

tool.onMouseDown = function(e) {
    var hit = project.hitTest(e.point);
    draggingShouldStart = false;

    console.log("onMouseDown Project " + hit);
    if (editMode == false) {
        if (hit && hit.item) {
            var item = hit.item,
                cls = item.className;

            if (cls == 'PointText')
                toogleSelection(item.parent);
            else if (cls == 'Shape')
                toogleSelection(item);
        }
    } else if (hit && hit.item) {
        var item = hit.item;

        if (item.className == "Shape" || item.className == "PointText") {
            var parent = hit.item.parent;
            console.log("select group " + parent);
            if (parent.className == 'Group') {
                selectGroup(parent);
                shouldMoveGroupOnDrag = true;
            }
        } else if (hit.item.className == "Raster") {
            if (e.modifiers.alt) {
                draggingShouldStart = true;
                drawSquaresOnMouseUp = true;
            }
        }
    }

    if (hit && hit.item && hit.item.className == "Raster") {

        if (editMode == true)
            selectGroup(null);

        shouldMoveMap = true;
    }

    return true;
}

tool.onMouseDrag = function(event) {
    if (draggingShouldStart) {
        current_line = new Path.Line(event.downPoint, event.point);
        current_line.strokeColor = 'orange';
        current_line.strokeWidth = 4;
        current_line.dashArray = [10, 4];
        current_line.strokeCap = 'butt';

        current_line.removeOnDrag();
    } else if (shouldMoveMap) {
        project.activeLayer.position += event.delta;
    } else if (shouldMoveGroupOnDrag) {
        console.log("dragging group");
        selectedGroup.position += event.delta;
    }
};

tool.onMouseUp = function(event) {
    console.log("onMouseUp Project");
    if (editMode == false)
        return;

    var hit = project.hitTest(event.point);

    if (drawSquaresOnMouseUp) {
        drawSquares(event.downPoint, event.point);
        current_line.remove();
    } else if (hit == null || hit.item.className == 'Raster') {
        var selectedgroups = selectedItems(Group);
        selectedgroups.forEach(function(g) { selectThisGroup(g, false) });
    }

    draggingShouldStart = false;
    drawSquaresOnMouseUp = false;
    shouldMoveMap = false;
    shouldMoveGroupOnDrag = false;

    return true;
}

tool.onKeyDown = function(e) {

    console.log(e.key);
    var key = e.key;

    if (key == 'e') {
        window.globals._setEditMode(!editMode);
        return;
    }

    if (editMode == false)
        return;

    if (key == 'n') {
        var response = prompt("Please enter a Number", square_num);

        if (response && !isNaN(response)) {
            square_num = parseInt(response);
        }

        return;
    }

    if (selectedGroup == null)
        return;

    if (e.modifiers.shift) {
        if (key == 'left')
            selectedGroup.rotate(-1);
        else if (key == 'right')
            selectedGroup.rotate(1);
    }
    else if (key == 'delete' || key == 'backspace')
        selectedGroup.remove();
    else if (key == 'up')
        selectedGroup.translate(0, -1);
    else if (key == 'down')
        selectedGroup.translate(0, 1);
    else if (key == 'left')
        selectedGroup.translate(-1, 0);
    else if (key == 'right')
        selectedGroup.translate(1, 0);
};

var selectThisGroup = function(aGroup, shouldSelect) {
    var items = aGroup.getItems({ class: Shape });

    items.forEach(function(item) {
        item.strokeColor = shouldSelect ? 'red' : 'black';
    });

    aGroup.data.selected = shouldSelect;
};

var drawSquares = function(from, to) {
    var new_group = new Group({
        data: { selected: false }
    });

    var vector = to - from;
    var length = vector.abs().length;
    var num = Math.floor(length / SQUARE_SIZE);

    for (var i = 0; i < num; i++) {
        var shape_and_text = square(from, vector.angle, i, square_num);
        new_group.addChild(shape_and_text[0]);
        new_group.addChild(shape_and_text[1]);
        //new_group.addChildren(rect.children);

        updateColorState(shape_and_text[0]);

        square_num++;
    }
};

var enableShape = function(aShape, shouldEnable) {
    console.log("Numero " + aShape.data.numero + " enable=" + shouldEnable);
    aShape.data.enabled = shouldEnable;
    updateColorState(aShape);
};

var toogleSelection = function(aShape) {
    selectShape(aShape, !aShape.data.selected);
};

var promptForRenumbering = function(rect, text) {
    console.log('promptForRenumbering rect' + rect.data.numero);
    if (editMode == false)
        return false;

    if (rect.data.index !== 0)
        return false;

    var response = prompt("Please enter a Number", text.content);

    if (response == null || isNaN(response))
        return false;

    var start_num = parseInt(response);
    var parent = rect.parent;
    var siblings = parent.getItems({ class: Shape });

    for (var k = 0; k < siblings.length; k++) {
        var item = siblings[k];
        var new_numero = start_num + item.data.index;

        console.log(" " + item.data.numero + ' ' + rect.children);

        var textItemsWithSameIndex = parent.getItems({ class: PointText, data: { index: item.data.index } });

        item.data.numero = new_numero;
        textItemsWithSameIndex[0].content = new_numero;
    }

    square_num = start_num + siblings.length;

    return true;
};

var square = function(from, angle, groupIndex, globalIndex) {
    var rect = new Shape.Rectangle({
        center: from + { length: (groupIndex * SQUARE_SIZE + SQUARE_SIZE / 2), angle: angle },
        size: [SQUARE_SIZE, SQUARE_SIZE],
        fillColor: squareColor,
        strokeColor: 'black',
        strokeWidth: 2,
        rotation: angle,
        data: { type: "emplacement", squareIndex: globalIndex, index: groupIndex, numero: globalIndex, selected: false, enabled: !isEmplacementVendu(globalIndex) }
    });

    //rect.bringToFront();

    var text = new PointText(rect.center);
    text.size = [SQUARE_SIZE, SQUARE_SIZE];
    text.justification = 'center';
    text.fillColor = 'black';
    text.strokeColor = 'black';
    text.fontSize = '24px';
    text.fontFamily = "menlo";
    text.content = globalIndex;
    text.rotation = angle;
    text.data = { index: groupIndex, selected: false };

    rect.addChild(text);
/*
    text.select = rect.select;
    text.toogleSelection = rect.toogleSelection;
    text.promptForRenumbering = rect.promptForRenumbering;
*/
    text.hitTest = function(e) {
        return rect.hitTest(e);
    }

    return [rect, text];
};

var selectedItems = function (cls) {
    return project.getItems({
        class: cls,
        match: function(item) {
            return item.data.selected == true;
        }
    });
};

var emplacements = function() {
    return project.getItems({
        class: Shape,
        match: function(item) {
            return item.data.type == 'emplacement';
        }
    });
}

var selectedShapes = function() {
    return project.getItems({
        class: Shape,
        match: function(item) {
            return item.data.type == 'emplacement' && item.data.selected == true && item.data.enabled == true;
        }
    });
};

var selectGroup = function(aGroup) {
    var selectedgroups = selectedItems(Group);
    selectedgroups.forEach(function(g) { selectThisGroup(g, false) });

    if (aGroup)
        selectThisGroup(aGroup, true);

    selectedGroup = aGroup;
};

var selectShape = function(aShape, shouldSelect) {
    if (editMode == false && aShape.data.enabled) {
        aShape.data.selected = shouldSelect;
        updateColorState(aShape);
    }

    var numeros = selectedShapes().map(function(shape) {
        return shape.data.numero;
    });

    window.selectionDidChange(numeros);
};

var updateColorState = function(item) {
    var selected = item.data.selected,
        enabled = item.data.enabled,
        color = "black";

    if (editMode) {
        color = enabled ? EDITED_ENABLED : EDITED_DISABLED;
    }
    else {
        if (!enabled)
            color = USER_DISABLED;
        else {
            color = selected ? USER_SELECTED : USER_DESELECTED;
        }
    }

    item.fillColor = color;
};

var changeZoom = function(oldZoom, delta) {
    var factor = 1.05;
    if (delta < 0)
        return oldZoom * factor;

    if (delta > 0)
        return oldZoom / factor;

    return oldZoom;
};

var isEmplacementVendu = function(numero) {
    return (emplacementsVendus.indexOf(numero) !== -1);
};

window.globals = {
    _setEditMode: function(mode) {
        editMode = mode;
        if (editMode == false)
            selectGroup(null);

        emplacements().forEach(function(item) {
            updateColorState(item);
        });

        console.log("Edit Mode is " + (editMode ? "ON" : "OFF"));
    },
    imageDidLoad: function(path) {
        raster = new Raster(path);
        raster.sendToBack();
    },
    setEmplacementsVendus: function(selectedNumeros) {
        emplacementsVendus = selectedNumeros;

        var items = project.getItems({
            class: Shape,
            match: function(item) {
                return item.data.type == "emplacement";
            }
        });
        console.log("Numéros dejà vendus:" + emplacementsVendus);
        items.forEach(function(item) {
            var shouldEnable = !isEmplacementVendu(item.data.numero);
            enableShape(item, shouldEnable);
        });
    },
    selection: function() {
        return selectedShapes();
    },
    mouseScrollBy: function(event) {
        view.zoom = changeZoom(view.zoom, event.deltaY);
    },
    exportJSON: function() {
        return project.exportJSON();
    },
    importJSON: function(json_string) {
        project.clear();
        project.importJSON(json_string);
        view.zoom = 0.25;
    }
};
