const DEVICE_NAME = "SONNETTE";
const SERVICE_UUID = "4fafc201-1fb5-459e-8fcc-c5c9c331914a";
const ALERT_SERVICE_UUID = "4fafc201-1fb5-459e-8fcc-c5c9c331914b";
const UUID_MAP = [{
        type: "push",
        id: "RGB_LED",
        uuid: "beb5483e-36e1-4688-b7f5-ea07361b26a1",
        attr: {
            value: 0,
            name: "rgb_led"
        }
    },
    {
        type: "push",
        id: "PIR_ENABLE",
        uuid: "beb5483e-36e1-4688-b7f5-ea07361b26a2",
        attr: {
            value: 0,
            name: "pir_enable"
        }

    },
    {
        type: "push",
        id: "DRING_ENABLE",
        uuid: "beb5483e-36e1-4688-b7f5-ea07361b26a7",
        attr: {
            value: 0,
            name: "dring_enable"
        }

    },
    {
        type: "pressed",
        id: "MANUAL_ALARM",
        uuid: "beb5483e-36e1-4688-b7f5-ea07361b26a3",
        attr: {
            value: 0,
            name: "manual_alarm"
        }
    },
    {
        type: "push",
        id: "ENABLE_NOTIFICATIONS",
        uuid: "beb5483e-36e1-4688-b7f5-ea07361b26a6",
        attr: {
            value: 0,
            name: "enable_notifications"
        }

    }, {
        type: "range",
        id: "SLEEP_AFTER_MINUTES",
        uuid: "beb5483e-36e1-4688-b7f5-ea07361b26a9",
        attr: {
            type: "range",
            name: "Mise en Veille",
            min: "1",
            max: "255",
            step: "1",
            value: "1"
        }
    }, {
        type: "push",
        id: "CONTINUOUS",
        uuid: "beb5483e-36e1-4688-b7f5-ea07361b26b2",
        attr: {
            value: 0,
            name: "continuous",
        }

    }, {
        type: "range",
        id: "DISCRETE_COUNT",
        uuid: "beb5483e-36e1-4688-b7f5-ea07361b26b3",
        attr: {
            type: "range",
            name: "discrete_count",
            min: "1",
            max: "10",
            step: "1",
            value: "1"
        }
    }, {
        type: "range",
        id: "DISCRETE_INTERVAL",
        uuid: "beb5483e-36e1-4688-b7f5-ea07361b26b4",
        attr: {
            type: "range",
            name: "discrete_interval",
            min: "50",
            max: "10000",
            step: "200",
            value: "1000"
        }
    }, {
        type: "text",
        id: "VERSION",
        uuid: "beb5483e-36e1-4688-b7f5-ea07361b26b1",
        attr: {
            name: "version"
        }
    }
];

const FLAGS_IDENTIFIERS = ["PIR_ENABLE", "DRING_ENABLE", "ENABLE_NOTIFICATIONS", "CONTINUOUS"];
const NOTIFICATION_UUID = "beb5483e-36e1-4688-b7f5-ea07361b26a8";
const GATT_CONNECT_TIMEOUT = 10000;

let createPushOnPushOffButton = (id, uuid, attr) => {
    let el = document.createElement("button");
    el.classList.add("push");
    el.id = id;
    el.innerHTML = attr.name;

    if (attr) Object.assign(el, attr);

    el.addEventListener("click", async () => {
        let new_value = 1 - Number(el.value);
        let ok = await writeValue(uuid, new_value);
        if (ok) {
            el.value = new_value;
            if (id == "CONTINUOUS") {
                document.querySelector("button#MANUAL_ALARM").dataset.continuous = new_value;
            }
        }
    });

    return el;
};

let createPushPressedButton = (id, uuid, attr) => {
    let el = document.createElement("button");
    el.classList.add("pressed");
    el.id = id;
    el.innerHTML = attr.name;

    if (attr) Object.assign(el, attr);

    el.addEventListener("pointerdown", async () => {
        //let isContinuous = Number(el.dataset.continuous);
        el.value = 1;

        let ok = await writeValue(uuid, 1);
        if (!ok) {
            el.value = 0;
        }
    });

    el.addEventListener("pointerup", async () => {
        let isContinuous = Number(el.dataset.continuous);

        if (isContinuous) {
            let ok = await writeValue(uuid, 0);
            if (ok) {
                el.value = 0;
            }
        } else {
            el.value = 0;
        }
    });

    return el;
};

let createTimerInput = (id, uuid, attr) => {
    let el = document.createElement("input");
    el.id = id;
    el.type = "time";
    if (attr) Object.assign(el, attr);

    el.addEventListener("input", async () => {
        let new_value = el.value;
        //let ok = await writeValue(uuid, new_value);
        console.log(el.value);
    });

    return el;
};

let createRangeInput = (id, uuid, attr) => {
    let el = document.createElement("input");
    el.id = id;
    el.type = "range";
    if (attr) Object.assign(el, attr);
    el.dataset.value = "1";

    el.addEventListener("change", async () => {
        let new_value = el.value;
        let ok = await writeValue(uuid, new_value);
        if (ok) el.dataset.value = new_value;
        else el.value = el.dataset.value;
    });

    let div = document.createElement("div");
    div.classList.add("range");
    let labelEl = document.createElement("label");
    labelEl.innerText = attr.name;
    labelEl.setAttribute("for", uuid);

    div.appendChild(labelEl);
    div.appendChild(el);

    return div;
};

let createLabel = (id, uuid, attr) => {
    let el = document.createElement("label");
    el.id = id;
    el.classList.add("readonly");
    if (attr) Object.assign(el, attr);
    el.innerText = attr.name;

    return el;
};

const INPUTS = {
    "push": createPushOnPushOffButton,
    "pressed": createPushPressedButton,
    "timer": createTimerInput,
    "range": createRangeInput,
    "text": createLabel
};

let updateUIFromDevice = (buffer) => {
    let hex_string = new TextDecoder().decode(buffer);
    let regexp = new RegExp("^(?<flags>[0-9A-Z]{2})(?<VERSION>[0-9A-Z]{2})(?<SLEEP_AFTER_MINUTES>[0-9A-Z]{2})(?<DISCRETE_COUNT>[0-9A-Z]{2})(?<DISCRETE_INTERVAL>[0-9A-Z]{4})$");
    console.log(`Received service data adv: '${hex_string}'`);
    let matches = hex_string.match(regexp);
    if (matches == null || matches.groups == null) throw `No matches for hex string '${hex_string}' with regular expression '${regexp}'`;
    let groups = matches.groups;
    let flags_value = parseInt(groups.flags, 16);
    let flags = FLAGS_IDENTIFIERS.forEach((flag, i) => {
      groups[flag] = Number(Boolean(flags_value & (1 << i)));
    });

    delete groups.flags;
console.log(groups);
    Object.entries(groups).forEach(([id, hex_value]) => {
        let value = parseInt(hex_value, 16);
        let el = document.querySelector(`#${id}`);
        let {
            type
        } = UUID_MAP.find(m => m.id == id);

        if (type == 'text') el.innerText = value;
        else el.value = value;

        if (id == "CONTINUOUS") document.querySelector("#MANUAL_ALARM").dataset.continuous = value;
    });
};

document.addEventListener('DOMContentLoaded', async () => {
    console.log("DOMContentLoaded");

    let connect_btn = document.getElementById("connect");
    connect_btn.addEventListener('click', async () => {
        let device = await pairedDevice(DEVICE_NAME);
        if (!device) {
            try {
                console.log("Requested device");
                device = await requestDevice(DEVICE_NAME);
            } catch (e) {
                console.warn(e);
            }
        } else {
          console.log("device paired");
        }

        if (device) {
          try {
            let connected = await connectToBluetoothDevice(device);
            if (connected) {
               document.querySelector("#container").classList.add("connected");
            }
            else {
               console.log('Could not connect to gatt server');
           }
          } catch (e) {
             console.warn(e);
          }
        }
    });

    UUID_MAP.forEach(({
        type,
        id,
        uuid,
        attr
    }) => {
        let elmt = INPUTS[type](id, uuid, attr);
        document.getElementById("container").appendChild(elmt);
    });
});

let Timeout = (timeout, result) => new Promise((resolve, reject) => window.setTimeout(resolve, timeout, result));

async function pairedDevice(name) {
    let devices = await navigator.bluetooth.getDevices();
    return devices.find(dd => dd.name.startsWith(name));
}

async function requestDevice(name) {

    console.log('Requesting Bluetooth Device...');
    let device = await navigator.bluetooth.requestDevice({
        allowAllDevices: false,
        optionalServices: [ALERT_SERVICE_UUID],
        filters: [{
            namePrefix: "SONNETTE",
            services: [SERVICE_UUID],
            serviceData:[{service:SERVICE_UUID}]
        }]
    });

    //device.addEventListener('advertisementreceived', interpretIBeacon);
    //device.watchAdvertisements();

    return device;
}

async function connectToBluetoothDevice(device) {
    if (device.gatt.connected) {
        console.log('device server allready connected');
        return true;
    }

    const abortController = new AbortController();

    let connect = new Promise(function(resolve, reject) {
        const abortController = new AbortController();

        device.addEventListener('advertisementreceived', (event) => {
            console.log('> Received advertisement from "' + device.name + '"...', event);
            let buffer = event.serviceData.get(SERVICE_UUID);
            try {
                updateUIFromDevice(buffer);
                abortController.abort();
            } catch (e) {
                console.warn(e);
            }
            // Stop watching advertisements to conserve battery life.

            console.log('Connecting to GATT Server from "' + device.name + '"...');
            device.gatt.connect()
                .then(() => {
                    console.log('> Bluetooth device "' + device.name + '" connected.');
                    return onConnected(device);
                })
                .then(() => {
                    resolve(true);
                })
                .catch(error => {
                    console.log('Argh! ' + error);
                    reject(error);
                });
        }, {
            once: true
        });

        console.log('Watching advertisements from "' + device.name + '"...');
        device.watchAdvertisements({
                signal: abortController.signal
            })
            .catch(error => {
                reject(error);
            });
    });

    return Promise.race([connect, Timeout(GATT_CONNECT_TIMEOUT, false)]);
}

async function onConnected(device) {
    device.addEventListener('gattserverdisconnected', onDisconnected);
    await startAlertNotifications(device);
}

async function updateConnectButtonVisibility(btn) {
    let device = await pairedDevice(DEVICE_NAME);
    btn.classList.toggle("connected", !!device);
}

async function onDisconnected() {
    console.log('> Bluetooth Device disconnected');
    let device = await pairedDevice(DEVICE_NAME);
    if (device) {
        let connected = await connectToBluetoothDevice(device);
    }
}
/*
function connect(bluetoothDevice, clbk) {
    exponentialBackoff(3, 2,
        function toTry() {
            time('Connecting to Bluetooth Device... ');
            return bluetoothDevice.gatt.connect();
        },
        function success() {
            console.log('> Bluetooth Device connected.');
            clbk();
        },
        function fail() {
            time('Failed to reconnect.');
        });
}
*/
/* Utils */

// This function keeps calling "toTry" until promise resolves or has
// retried "max" number of times. First retry has a delay of "delay" seconds.
// "success" is called upon success.
/*
function exponentialBackoff(max, delay, toTry, success, fail) {
    toTry().then(result => success(result))
        .catch(_ => {
            if (max === 0) {
                return fail();
            }
            time('Retrying in ' + delay + 's... (' + max + ' tries left)');
            setTimeout(function() {
                exponentialBackoff(--max, delay * 2, toTry, success, fail);
            }, delay * 1000);
        });
}
*/
function time(text) {
    console.log('[' + new Date().toJSON().substr(11, 8) + '] ' + text);
}

function interpretIBeacon(event) {
    console.log(event);
    var rssi = event.rssi;
    var appleData = event.manufacturerData.get(0x004C);

    if (appleData.byteLength != 23 ||
        appleData.getUint16(0, false) !== 0x0215) {
        console.log({
            isBeacon: false
        });
    }
    var uuidArray = new Uint8Array(appleData.buffer, 2, 16);
    var major = appleData.getUint16(18, false);
    var minor = appleData.getUint16(20, false);
    var txPowerAt1m = -appleData.getInt8(22);
    console.log({
        isBeacon: true,
        uuidArray,
        major,
        minor,
        pathLossVs1m: txPowerAt1m - rssi
    });
}

function HandleAlertNotification(event) {
    const value = event.target.value.getUint8(0);
    console.warn('Got status value ' + value);
    switch (value) {
        case 0:
            deviceDeepSleep();
            break;
        case 1:
            break;
        case 2:
            handleDetectionNotification();
            break;
        default:
    }
}

let deviceDeepSleep = () => {
    console.log('device is into deep sleep ...');
    alert('En veille 😴');
}

let handleDetectionNotification = () => {
    alert('detection !!!');
}

async function startAlertNotifications(device) {
    const alert_service = await device.gatt.getPrimaryService(ALERT_SERVICE_UUID);
    let notif = await alert_service.getCharacteristic(NOTIFICATION_UUID);

    await notif.startNotifications();
    notif.addEventListener('characteristicvaluechanged', HandleAlertNotification);
    console.log('Added event listener characteristicvaluechanged for ' + NOTIFICATION_UUID);
}

async function writeValue(uuid, value) {
    let success = false;

    try {
        console.log('Getting Bluetooth Device...');
        let device = await pairedDevice(DEVICE_NAME);

        if (!device) {
            console.log('No paired device');
            device = await requestDevice(DEVICE_NAME);
        } else {
            console.log('Device is already paired');
        }

        let connected = await connectToBluetoothDevice(device);

        if (connected) {
            console.log('Getting Service...');
            const service = await device.gatt.getPrimaryService(SERVICE_UUID);

            console.log('Getting Characteristic...');
            const characteristic = await service.getCharacteristic(uuid);

            console.log('Setting Characteristic value...');
            await characteristic.writeValue(new Int16Array([value]).buffer);

            // if (uuid == UUID_MAP.ENABLE_NOTIFICATIONS) {
            //     console.log(typeof value, `'${value}'`);
            //     const alert_service = await device.gatt.getPrimaryService(ALERT_SERVICE_UUID);
            //     const notif = await alert_service.getCharacteristic(NOTIFICATION_UUID);
            //     console.log(notif.properties);
            //     if (value == 1) {
            //         console.log("addEventListener characteristicvaluechanged");
            //         await notif.startNotifications();
            //         notif.addEventListener('characteristicvaluechanged', handleNotification);
            //     } else {
            //         console.log('removing listener characteristicvaluechanged');
            //         notif.removeEventListener('characteristicvaluechanged', handleNotification);
            //         await notif.stopNotifications();
            //     }
            // }
            success = true;
        } else {
            console.log('Could not connect to gatt server');
        }
    } catch (error) {
        alert('Argh! ' + error);
        success = false;
    }

    return success;
}
