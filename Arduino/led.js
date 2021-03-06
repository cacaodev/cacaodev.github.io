var WS_PORT = 81;
var dragging = false;
var connected = false;
var sendMessage;
var persistent;
/**
 * degreesToRadians
 *
 * @param {number} degrees
 * @returns {number}  radians
 */
function degreesToRadians(degrees) {
    return degrees * (Math.PI / 180);
}
/**
 * generateColorWheel
 *
 * @param {number} [size=400]
 * @param {string} [centerColor='white']
 * @returns {HTMLCanvasElement}
 */
function generateColorWheel(size, centerColor) {
    if (size === void 0) {
        size = 400;
    }
    if (centerColor === void 0) {
        centerColor = 'white';
    }
    //Generate main canvas to return
    var canvas = document.createElement('canvas');
    var ctx = canvas.getContext('2d');
    canvas.width = canvas.height = size;
    //Generate canvas clone to draw increments on
    var canvasClone = document.createElement('canvas');
    canvasClone.width = canvasClone.height = size;
    var canvasCloneCtx = canvasClone.getContext('2d');
    //Initiate variables
    var angle = 0;
    var hexCode = [255, 0, 0];
    var pivotPointer = 0;
    var colorOffsetByDegree = 4.322;
    //For each degree in circle, perform operation
    while (angle++ < 360) {
        //find index immediately before and after our pivot
        var pivotPointerbefore = (pivotPointer + 3 - 1) % 3;
        var pivotPointerAfter = (pivotPointer + 3 + 1) % 3;
        //Modify colors
        if (hexCode[pivotPointer] < 255) {
            //If main points isn't full, add to main pointer
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

console.warn('WEBSOCKETS ENABLED');
var WebSocketClient = function() {
    this.number = 0; // Message number
    this.autoReconnectInterval = 5 * 1000; // ms
};

WebSocketClient.prototype.open = function(url) {
    this.url = url;
    this.instance = new WebSocket(this.url);

    this.instance.onopen = () => {
        this.onopen();
    };
    this.instance.onmessage = (data, flags) => {
        this.number++;
        this.onmessage(data, flags, this.number);
    };
    this.instance.onclose = (e) => {
        switch (e.code) {
            case 1000: // CLOSE_NORMAL
                console.log('WebSocket: closed');
                break;
            default: // Abnormal closure
                this.reconnect(e);
                break;
        }
        this.onclose(e);
    };
    this.instance.onerror = (e) => {
        switch (e.code) {
            case 'ECONNREFUSED':
                this.reconnect(e);
                break;
            default:
                this.onerror(e);
                break;
        }
    };
};

WebSocketClient.prototype.send = function(data, option) {
    try {
        this.instance.send(data, option);
    } catch (e) {
        console.warn(e);
    }
};

WebSocketClient.prototype.reconnect = function(e) {
    console.log('WebSocketClient: retry in %d', this.autoReconnectInterval);
    this.instance.onopen = null;
    this.instance.onclose = null;
    this.instance.onerror = null;
    this.instance.onmessage = null;
    var that = this;
    setTimeout(function() {
        console.log('WebSocketClient: reconnecting...');
        that.open(that.url);
    }, this.autoReconnectInterval);
};

WebSocketClient.prototype.onopen = function(e) {
    console.log('WebSocketClient: open', arguments);
};
WebSocketClient.prototype.onmessage = function(data, flags, number) {
    console.log('WebSocketClient: message', arguments);
};
WebSocketClient.prototype.onerror = function(e) {
    console.log('WebSocketClient: error', arguments);
};
WebSocketClient.prototype.onclose = function(e) {
    console.log('WebSocketClient: closed', arguments);
};

getWSSHostname('http://node-tracker.herokuapp.com/store?get=ip', function(hostname, error) {
    if (error !== null) {
        console.warn(error);
        return;
    }

    console.log('connecting to ws://' + hostname);
    var wsc = new WebSocketClient();
    wsc.open('ws://' + hostname + ':' + WS_PORT + '/');

    wsc.onopen = function(e) {
        console.log('WebSocketClient connected: ' + e);
        //setDisabled(false);
    };
    wsc.onclose = function(e) {
        console.log('WebSocketClient closed: ' + e);
        //setDisabled(true);
    };
    wsc.onerror = function(e) {
        console.log('WebSocketClient error: ' + e);
        //setDisabled(true);
    };
    wsc.onmessage = function(message, flags, number) {
        var json = JSON.parse(message.data);
        var type = json.type;
        var data = json.data;

        //console.log('WebSocketClient message ' + message + ' type ' + type);

        if (type == 'color') {
            colorDidChange(json.connection, data);
        } else if (type == 'connection') {
            connected = true;
            layoutConnections(data);
        }
    };

    sendMessage = function(m) {
        wsc.send(m);
    };

    loadPage();
});

function getWSSHostname(url, callback) {
    var wsshost = null;

    if (location.hostname.indexOf('192.168') !== -1)
        wsshost = location.hostname;
    else
        wsshost = new URLSearchParams(location.search).get('wss');

    if (wsshost) {
        callback(wsshost, null);
        return;
    }

    var req = new XMLHttpRequest();
    req.onreadystatechange = function(event) {
        if (this.readyState === XMLHttpRequest.OPENED) {
            // req.setRequestHeader();
        } else if (this.readyState === XMLHttpRequest.DONE) {
            if (this.status === 200) {
                callback(JSON.parse(this.responseText).value, null);
            } else {
                callback(null, 'Error ' + this.status + ' ' + this.statusText);
            }
        }
    };

    req.open('GET', url, true);
    req.send(null);
}

function colorDidChange(connection_id, color) {
    console.log('color change ' + color);

    if (dragging)
        persistent.style.backgroundColor = '#' + color;

    if (persistent.value == '0') persistent.style.backgroundColor = 'white';

    var b = document.getElementById('connection_' + connection_id);

    if (b == null) {
        console.warn('Unkwown connection id ' + connection_id);
        return;
    }

    var current_timeout = b._timeout;
    if (typeof current_timeout !== 'undefined' && current_timeout !== null) {
        window.clearTimeout(b._timeout);
    } else {
        b.classList.toggle('live', true);
    }

    b._timeout = window.setTimeout(function() {
        b.classList.toggle('live', false);
        window.clearTimeout(b._timeout);
        b._timeout = null;
    }, 500);
}

function layoutConnections(connections) {
    var connections_ids = connections.map(function(conn, idx) {
        return conn.num;
    });
    var to_add = Array.prototype.slice.call(connections);
    var buttons = document.getElementsByClassName('connection');

    console.log(connections);
    console.log('buttons values=' + Array.prototype.slice.call(buttons).map(function(b, idx) {
        return b.value;
    }));
    var count = buttons.length;
    while (count--) {
        var b = buttons[count];
        var idx = connections_ids.indexOf(parseInt(b.value));
        if (idx == -1) {
            document.body.removeChild(b);
            console.log('Remove button ' + b.value);
        } else {
            b.innerHTML = connections[idx].label;
            to_add.splice(idx, 1);
            console.log('Remove from to_add ' + b.value);
        }
    }

    console.log('Buttons to add ' + to_add);

    for (var i = 0; i < to_add.length; i++) {
        var b = createButton(to_add[i]);
        document.body.appendChild(b);
        console.log('Add connection ' + b.value);
    }

    buttons = document.getElementsByClassName('connection');

    for (var i = 0; i < buttons.length; i++) {
        var b = buttons[i];
        b.style.right = ((i * 50) + 10 + 60) + 'px';
        //b.style.display = (buttons.length > 1) ? 'block' : 'none';
    }
}

function createButton(connection) {
    console.log('create button ' + connection.num);
    var button = document.createElement('button');
    button.className = 'connection';
    button.value = connection.num;
    button.id = 'connection_' + connection.num;
    button.innerHTML = connection.label;

    return button;
}

// function setDisabled(flag) {
//     document.getElementById('content').classList.toggle('enabled', !flag);
// }

var sendColor = function(modifier, rgbList) {
    var color = rgbToHex.apply(null, rgbList);
    sendMessage(modifier + color);
}

var sendLabel = function(num, letter) {
    sendMessage('L' + num + letter.charCodeAt(0));
}

var componentToHex = function(c) {
    var hex = c.toString(16);
    return hex.length == 1 ? '0' + hex : hex;
}

var rgbToHex = function(r, g, b) {
    return componentToHex(r) + componentToHex(g) + componentToHex(b);
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

function isLocalIP(client, server) {
    var c = client.split('.'),
        s = server.split('.');
    return (c[0] == s[0] && c[1] == s[1] && c[2] == s[2]);
}

//TEST
//Get color wheel canvas
function loadPage() {
    var colorWheel = generateColorWheel(Math.min(document.body.clientWidth, 800));
    //Add color wheel canvas to document
    document.body.appendChild(colorWheel);
    //Add ouput field
    //var p = document.body.appendChild(document.createElement('p'));
    persistent = document.getElementById('persistent');

    /**
     * colorWheelMouse
     *
     * @param {MouseEvent} evt
     */
    var touchDevice = ('ontouchstart' in document.documentElement);

    var colorWheelEvent = function(evt, modifier) {
        var data, x, y;
        var ctx = colorWheel.getContext('2d');

        if (touchDevice) {
            x = evt.touches[0].clientX;
            y = evt.touches[0].clientY;
        } else {
            x = evt.offsetX;
            y = evt.offsetY;
        }

        data = ctx.getImageData(x, y, 1, 1);
        //p.innerHTML = 'RGB: ' + data.data.slice(0, 3).join(',');
        sendColor(modifier, data.data.slice(0, 3));
    }

    //Bind mouse events
    colorWheel.addEventListener(touchDevice ? 'touchmove' : 'mousemove', function(e) {
        if (!connected || !dragging) return;

        e.preventDefault();
        colorWheelEvent(e, 'C');
    }, {
        passive: false
    });

    colorWheel.addEventListener(touchDevice ? 'touchstart' : 'mousedown', function(e) {
        if (!connected) return;

        e.preventDefault();
        dragging = true;
        colorWheelEvent(e, 'C');
    }, {
        passive: false
    });

    colorWheel.addEventListener(touchDevice ? 'touchend' : 'mouseup', function(e) {
        if (!connected) return;

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
