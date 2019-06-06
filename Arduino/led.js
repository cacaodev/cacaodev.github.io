var dragging = false;
var persistent;

function degreesToRadians(degrees) {
    return degrees * (Math.PI / 180);
}

function generateColorWheel(size, centerColor) {
    if (size === void 0) {
        size = 400;
    }
    if (centerColor === void 0) {
        centerColor = 'white';
    } //Generate main canvas to return
    var canvas = document.createElement('canvas');
    var ctx = canvas.getContext('2d');
    canvas.width = canvas.height = size; //Generate canvas clone to draw increments on
    var canvasClone = document.createElement('canvas');
    canvasClone.width = canvasClone.height = size;
    var canvasCloneCtx = canvasClone.getContext('2d');
    //Initiate variables
    var angle = 0;
    var hexCode = [255, 0, 0];
    var pivotPointer = 0;
    var colorOffsetByDegree = 4.322; //For each degree in circle, perform operation
    while (angle++ < 360) { //find index immediately before and after our pivot var
        pivotPointerbefore = (pivotPointer + 3 - 1) % 3;
        var pivotPointerAfter = (pivotPointer + 3 + 1) % 3; //Modify colors
        if (hexCode[pivotPointer] < 255) { //If main points isn't full, add to main pointer
            hexCode[pivotPointer] = (hexCode[pivotPointer] + colorOffsetByDegree > 255 ? 255 : hexCode[pivotPointer] + colorOffsetByDegree);
        } else if (hexCode[pivotPointerbefore] > 0) {
            //If color before main isn't zero, subtract
            hexCode[pivotPointerbefore] = (hexCode[pivotPointerbefore] > colorOffsetByDegree ? hexCode[pivotPointerbefore] - colorOffsetByDegree : 0);
        } else if (hexCode[pivotPointer] >= 255) {
            //If main color is full, move pivot
            hexCode[pivotPointer] = 255;
            pivotPointer = (pivotPointer + 1) % 3;
        }
        //clear clone
        canvasCloneCtx.clearRect(0, 0, size, size);
        //Generate gradient and set as fillstyle
        var grad = canvasCloneCtx.createRadialGradient(size / 2, size / 2, 0, size / 2, size / 2, size / 2);
        grad.addColorStop(0, centerColor);
        grad.addColorStop(1, 'rgb(' + hexCode.map(function(h) {
            return Math.floor(h);
        }).join(',') + ')');
        canvasCloneCtx.fillStyle = grad;
        //draw full circle with new gradient
        canvasCloneCtx.globalCompositeOperation = 'source-over';
        canvasCloneCtx.beginPath();
        canvasCloneCtx.arc(size / 2, size / 2, size / 2, 0, Math.PI * 2);
        canvasCloneCtx.closePath();
        canvasCloneCtx.fill();
        //Switch to 'Erase mode'
        canvasCloneCtx.globalCompositeOperation = 'destination-out';
        //Carve out the piece of the circle we need for this angle
        canvasCloneCtx.beginPath();
        canvasCloneCtx.arc(size / 2, size / 2, 0, degreesToRadians(angle + 1), degreesToRadians(angle + 1));
        canvasCloneCtx.arc(size / 2, size / 2, size / 2 + 1, degreesToRadians(angle + 1), degreesToRadians(angle + 1));
        canvasCloneCtx.arc(size / 2, size / 2, size / 2 + 1, degreesToRadians(angle + 1), degreesToRadians(angle - 1));
        canvasCloneCtx.arc(size / 2, size / 2, 0, degreesToRadians(angle + 1), degreesToRadians(angle - 1));
        canvasCloneCtx.closePath();
        canvasCloneCtx.fill();
        //Draw carved-put piece on main canvas
        ctx.drawImage(canvasClone, 0, 0);
    }
    //return main canvas
    return canvas;
}

function togglePersistent(button) {
    button.value = 1 - parseInt(button.value);
    button.classList.toggle('on', button.value == '1');
    button.classList.toggle('off', button.value == '0');

    if (this.timeout) window.clearTimeout(this.timeout);

    if (button.value == '0') {
        sendMessage('C000000');
        this.timeout = window.setTimeout(function() {
            sendMessage('CFFFFFF');
            button.value = 1;
            button.classList.toggle('on', true);
        }, 600 * 1000);
    }
}

var sendMessage = function(value) {
    var req = new XMLHttpRequest();

    req.onreadystatechange = function(event) {
        if (this.readyState === XMLHttpRequest.DONE) {
            if (this.status === 200) {
                colorDidChange(100, this.responseText);
            } else if (this.status === 250) {
                document.write(this.responseText);
            } else {
                console.log('Erreur: ' + this.status);
                colorDidChange(100, 'AAAAAA');
            }
        }
    };

    req.open('GET', 'http://' + '192.168.0.10' + '/color?c=' + value, true);
    req.send(null);
};

var colorDidChange = function(connection_id, color) {
    if (dragging)
        persistent.style.backgroundColor = '#' + color;
}

var onLoad = function() {
    var colorWheel = generateColorWheel(600);
    // //Add color wheel canvas to document
    document.body.appendChild(colorWheel);
    // //Add ouput field
    var p = document.body.appendChild(document.createElement('p'));
    persistent = document.getElementById('persistent');

    var componentToHex = function(c) {
        var hex = c.toString(16);
        return hex.length == 1 ? '0' + hex : hex;
    }

    var rgbToHex = function(r, g, b) {
        return componentToHex(r) + componentToHex(g) + componentToHex(b);
    }

    var colorWheelEvent = function(evt, modifier) {
        var ctx = colorWheel.getContext('2d');
        var data = ctx.getImageData(evt.touches[0].clientX, evt.touches[0].clientY, 1, 1);
        p.innerHTML = 'R=' + data.data[0] + 'V=' + data.data[1] + 'B=' + data.data[2];
        var hexcolor = rgbToHex(data.data[0], data.data[1], data.data[2]);
        sendMessage(modifier + hexcolor);
    }

    //Bind mouse event
    colorWheel.addEventListener('touchmove', function(e) {
        e.preventDefault();
        if (!dragging) return;
        colorWheelEvent(e, 'C');
    }, {
        passive: false
    });

    colorWheel.addEventListener('touchstart', function(e) {
        e.preventDefault();
        dragging = true;
        colorWheelEvent(e, 'C');
    }, {
        passive: false
    });

    colorWheel.addEventListener('touchend', function(e) {
        e.preventDefault();
        dragging = false;

        if (persistent.value == '0') {
            sendMessage('C000000');
        } else {
            sendMessage('S');
        }
    }, {
        passive: false
    });
}
