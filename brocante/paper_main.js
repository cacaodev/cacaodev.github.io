
var NUM_START = 1001;
var SQUARE_SIZE = 71;
var ZOOM_FACTOR = 1.1;

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

var tool = new paper.Tool();
tool.activate();

tool.onMouseDown = function(e) {
    var hit = project.hitTest(e.point);

    if (!hit || !hit.item)
        return;

    var item = hit.item;
    draggingShouldStart = false;

    //console.log("onMouseDown Project " + hit);
    if (editMode == false) {
            var cls = item.className;

            if (cls == 'PointText') {
                var shape = getHomologOfType(item, Shape);
                if (shape)
                    toogleSelection(shape);
            }
            else if (cls == 'Shape')
                toogleSelection(item);
    } else  {
        if (item.className == "Shape" || item.className == "PointText") {
            var parent = item.parent;
            console.log("select group " + parent);
            if (parent.className == 'Group') {
                selectGroup(parent);
                shouldMoveGroupOnDrag = true;
            }
        }
    }

    if (item.className == "Raster") {

        if (editMode == true) {
            if (e.modifiers.alt) {
                draggingShouldStart = true;
                drawSquaresOnMouseUp = true;
            }
            else {
                selectGroup(null);
            }
        }

        shouldMoveMap = true;
    }

    return draggingShouldStart || shouldMoveGroupOnDrag || shouldMoveMap;
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
        globals.moveBy(event.delta);
    } else if (shouldMoveGroupOnDrag) {
        //console.log("dragging group");
        selectedGroup.position += event.delta;
    }
};

tool.onMouseUp = function(event) {
    //console.log("onMouseUp Project");
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
        window.setEditMode(!editMode);
        return;
    }

    if (editMode == false)
        return;

    if (e.modifiers.meta && key == 's') {
        e.preventDefault();
        e.stopPropagation();

        window.downloadProject();
        return;
    }

    if (key == 'n') {
        var response = prompt("Réinitialiser la nmérotation à partir de:", square_num);

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
        item.strokeColor = shouldSelect ? 'blue' : 'black';
        item.strokeWidth = shouldSelect ? 3 : 1;
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
    aShape.data.enabled = shouldEnable;
    updateColorState(aShape);
};

var toogleSelection = function(aShape) {
    selectShape(aShape, !aShape.data.selected);
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

    var text = new PointText(rect.position);
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

var getZoomLevel = function(oldZoom, delta) {
    var factor = ZOOM_FACTOR;
    if (delta > 0)
        return oldZoom * factor;

    if (delta < 0)
        return oldZoom / factor;

    return oldZoom;
};

var isEmplacementVendu = function(numero) {
    var result = emplacementsVendus.indexOf(numero) !== -1;
    // console.log(numero + " est vendu =" + result);
    return result;
};

var projectDidLoad = function() {
    view.zoom = 0.25;
    emplacements().forEach(function(item) { initShape(item) });
    project.getItems({class:PointText}).forEach(function(item) { initText(item) });
    //project.activeLayer.emit('mousedown', {type:'mousedown', target:project.activeLayer, point:new Point(10,10)});
};

var initText = function(item) {
    var shape = getHomologOfType(item, Shape);
    item.position = shape.position;
};

var initShape = function(item) {
    updateMouseOver(item);

    item.data.selected = false;
    item.data.enabled = false;
    item.fillColor = 'lightgray';
    item.locked = true;
};

var updateMouseOver = function(item) {
    var text = getHomologOfType(item, PointText);

    if (editMode == false) {
        item.onMouseEnter = function(e) {
            window.setCursor(item.data.enabled ? "pointer" : "not-allowed");
        };

        item.onMouseLeave = function(e) {
            window.setCursor("move");
        };

        text.onMouseEnter = function(e) {
            window.setCursor(item.data.enabled ? "pointer" : "not-allowed");
        };
    }
    else {
        item.onMouseEnter = null;
        item.onMouseLeave = null;
        text.onMouseEnter = null;
    }
}

var getHomologOfType = function(item, className) {
    var targets = item.parent.getItems({class:className, match:function(child){
        return child.data.index == item.data.index;
    }});

    if (targets.length == 1)
        return targets[0];

    return null;
};

var lockGroups = function(flag) {
    emplacements().forEach(function(shape) { shape.locked = flag });
};

window.globals = {
    _setEditMode: function(mode) {
        editMode = mode;

        if (editMode == false)
            selectGroup(null);

        emplacements().forEach(function(item) {
            updateColorState(item);
            updateMouseOver(item);
        });

        if (editmode)
            window.setCursor("default");

        console.log("Edit Mode is " + (editMode ? "ON" : "OFF"));
    },
    imageDidLoad: function(path) {
        raster = new Raster(path);
        raster.sendToBack();
    },
    setEmplacementsVendus: function(selectedNumeros) {
        emplacementsVendus = selectedNumeros;

        var items = emplacements();
        console.log("Numéros dejà vendus:" + emplacementsVendus);
        items.forEach(function(item) {
            var shouldEnable = !isEmplacementVendu(item.data.numero);
            enableShape(item, shouldEnable);
            updateMouseOver(item);
        });

        lockGroups(false);
    },
    selection: function() {
        return selectedShapes();
    },
    zoomBy: function(deltaY) {
        view.zoom = getZoomLevel(view.zoom, deltaY);
    },
    moveBy: function(delta) {
        project.activeLayer.position += delta;
    },
    setZoom: function(zoomLevel) {
        view.zoom = zoomLevel;
    },
    exportJSON: function() {
        return project.exportJSON();
    },
    importJSON: function(json_string) {
        project.clear();
        project.importJSON(json_string);
        projectDidLoad();
    },
    lock: lockGroups
};
