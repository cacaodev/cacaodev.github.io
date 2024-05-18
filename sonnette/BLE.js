const DEVICE_NAME = "SONNETTE";
const SERVICE_UUID = "4fafc201-1fb5-459e-8fcc-c5c9c331914a";
const ALERT_SERVICE_UUID = "4fafc201-1fb5-459e-8fcc-c5c9c331914b";
const UUID_MAP = [{
        type: "pressed",
        id: "BACK",
        attr: {
            value: 0,
            name: "back",
            after_class_remove: "wifi",
            class:"wifi"
        }
    }, {
        type: "label",
        id: "BATT_LEVEL",
        uuid: "beb5483e-36e1-4688-b7f5-ea07361b26b6",
        attr: {
            value: 0,
            name: "batt_level"
        }
    }, {
        type: "switch",
        id: "RGB_LED",
        uuid: "beb5483e-36e1-4688-b7f5-ea07361b26a1",
        attr: {
            value: 0,
            name: "rgb_led"
        }
    },
    {
        type: "switch",
        id: "PIR_ENABLE",
        uuid: "beb5483e-36e1-4688-b7f5-ea07361b26a2",
        attr: {
            value: 0,
            name: "pir_enable"
        }
    },
    {
        type: "switch",
        id: "ENABLE_NOTIFICATIONS",
        uuid: "beb5483e-36e1-4688-b7f5-ea07361b26a6",
        attr: {
            value: 0,
            name: "enable_notifications"
        }
    },
    {
        type: "switch",
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
    }, {
        type: "switch",
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
            class:"discrete",
            name: "discrete_count",
            min: "1",
            max: Math.pow(2, 4) - 1,
            step: "1",
            value: "1"
        }
    }, {
        type: "range",
        id: "DISCRETE_INTERVAL",
        uuid: "beb5483e-36e1-4688-b7f5-ea07361b26b4",
        attr: {
            type: "range",
            class:"discrete",
            name: "discrete_interval",
            min: "1",
            max: Math.pow(2, 8) - 1,
            step: "1",
            value: "4"
        }
    }, {
        type: "range",
        id: "SLEEP_AFTER_MINUTES",
        uuid: "beb5483e-36e1-4688-b7f5-ea07361b26a9",
        attr: {
            type: "range",
            name: "Mise en Veille",
            min: "1",
            max: Math.pow(2, 8) - 1,
            step: "1",
            value: "1"
        }
    }, {
        type: "label",
        id: "VERSION",
        uuid: "beb5483e-36e1-4688-b7f5-ea07361b26b1",
        attr: {
            name: "version"
        }
    }, {
        type: "pressed",
        id: "START_WIFI_SCAN",
        uuid: "beb5483e-36e1-4688-b7f5-ea07361b26b7",
        attr: {
            value: 0,
            name: "wifi_scan",
            after_class_add: "wifi"
        }
    }, {
        type: "select",
        id: "SELECT_SSID",
        attr: {
            value: 0,
            name: "ssid",
            class: "wifi"
        }
    }, {
        type: "text",
        id: "PASSWORD",
        attr: {
            value: "",
            name: "password",
            class: "wifi"
        }
    }, , {
        type: "pressed",
        id: "SEND_WIFI_CREDENTIALS",
        uuid: "beb5483e-36e1-4688-b7f5-ea07361b26a4",
        attr: {
            value: 0,
            name: "OK",
            class: "wifi",
            after_class_remove:"wifi"
        }
    }
];

const FLAGS_IDENTIFIERS = ["PIR_ENABLE", "DRING_ENABLE", "ENABLE_NOTIFICATIONS", "CONTINUOUS"];
const NOTIFICATION_UUID = "beb5483e-36e1-4688-b7f5-ea07361b26a8";
const BATTERY_LEVEL_UUID = "4fafc201-1fb5-459e-8fcc-c5c9c33191b6";
const NETWORKS_UUID = "beb5483e-36e1-4688-b7f5-ea07361b26b8";
const GATT_CONNECT_TIMEOUT = 10000;
const FILTER_OPTIONS = {
    optionalServices: [ALERT_SERVICE_UUID],
    filters: [{
        namePrefix: "SONNETTE",
        services: [SERVICE_UUID],
        serviceData: [{
            service: SERVICE_UUID
        }]
    }]
};
const REQUEST_ALL_OPTIONS = {
    acceptAllDevices: true,
    optionalServices: [SERVICE_UUID, ALERT_SERVICE_UUID]
};
// <label class="switch">
//   <input type="checkbox">
//   <span class="slider round"></span>
// </label>
let createSwitchToggle = (id, uuid, attr) => {
    let el = document.createElement("label");
    el.classList.add("switch");
    if (attr.class) el.classList.add(attr.class);

    let input = document.createElement("input");
    input.type = "checkbox";
    input.id = id;
    if (uuid) input.dataset.uuid = uuid;

    let span = document.createElement("span");
    span.classList.add("slider", "round");

    el.appendChild(input);
    el.appendChild(span);

    input.addEventListener("change", async (event) => await switchValueChange(event.target, attr));

    return el;
};

let createPushPressedButton = (id, uuid, attr) => {
    let el = document.createElement("button");
    el.classList.add("pressed");
    if (attr.class) el.classList.add(attr.class);
    el.id = id;
    el.innerHTML = attr.name;
    if (uuid) el.dataset.uuid = uuid;

    if (attr) Object.assign(el, attr);

    el.addEventListener("pointerdown", async (event) => await buttonDidPressDown(event.target, attr));
    el.addEventListener("pointerup", async (event) => await buttonDidPressUp(event.target));
    //el.addEventListener("pointerleave", async (event) => await buttonDidPressUp(event.target));

    return el;
};

let buttonDidPressDown = async (el, attr) => {
    //let isContinuous = Number(el.dataset.continuous);
    el.value = 1;

    if (el.id == "SEND_WIFI_CREDENTIALS") {
      let ssid = document.querySelector("#SELECT_SSID").value;
      let password = document.querySelector("#PASSWORD").value;

      let n = (Number(ssid) << 5) | password.length;
      let passwordBuffer = new TextEncoder().encode(password).buffer;
      let buffer = new Int8Array([n, ...(new Int8Array(passwordBuffer))]).buffer;

      el.value = 2;

      let ok = await writeBuffer(el.dataset.uuid, buffer);
      if (ok) el.value = 1;
    } else {
      let ok = !el.dataset.uuid || await writeValue(el.dataset.uuid, 1);
      if (!ok) {
          el.value = 0;
      }
    }

    if (attr.after_class_add) document.querySelector("#container").classList.add(attr.after_class_add);
    if (attr.after_class_remove) document.querySelector("#container").classList.remove(attr.after_class_remove);
};

let buttonDidPressUp = async (el) => {
    let isContinuous = Number(el.dataset.continuous);

    if (isContinuous) {
        let ok = !el.dataset.uuid  || await writeValue(el.dataset.uuid, 0);
        if (ok) {
            el.value = 0;
        }
    } else {
        el.value = 0;
    }
};

let switchValueChange = async (input, attr) => {
    let new_value = input.checked;
    let ok = !input.dataset.uuid  || await writeValue(input.dataset.uuid, Number(new_value));
    if (ok) {
        if (input.id == "CONTINUOUS") {
            document.querySelector("button#MANUAL_ALARM").dataset.continuous = Number(new_value);
        }

        if (attr.after_class_add) document.querySelector("#container").classList.add(attr.after_class_add);
        if (attr.after_class_remove) document.querySelector("#container").classList.remove(attr.after_class_remove);
    } else {
      input.checked = !new_value;
    }
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
    if (uuid) el.dataset.uuid = uuid;

    el.addEventListener("change", async () => {
        let new_value = el.value;
        let ok = await writeValue(uuid, new_value);
        if (ok) el.dataset.value = new_value;
        else el.value = el.dataset.value;
    });

    let div = document.createElement("div");
    div.classList.add("range");
    if (attr.class) div.classList.add(attr.class);
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

let createSelect = (id, uuid, attr) => {
    let el = document.createElement("select");
    el.id = id;
    if (attr) Object.assign(el, attr);
    el.dataset.value = "";
    if (uuid) el.dataset.uuid = uuid;
    if (attr.class) el.classList.add(attr.class);

    return el;
};

let createInputText = (id, uuid, attr) => {
    let el = document.createElement("input");
    el.id = id;
    el.type = "text";
    if (uuid) el.dataset.uuid = uuid;

    if (attr) Object.assign(el, attr);
    if (attr.class) el.classList.add(attr.class);

    return el;
};

// let createWifiCredentialsValidator = (id, uuid, attr) => {
//     let el = document.createElement("button");
//     el.id = id;
//     el.classList.add("push");
//     el.innerText = attr.name;
//     if (attr.class) el.classList.add(attr.class);
//
//     el.addEventListener('click', async (event) => {
//         let ssid_el = document.querySelector("#SELECT_SSID");
//         let pwd_el = document.querySelector("#PASSWORD");
//         let ssid = UUID_MAP.find(m => m.id == "SELECT_SSID").uuid;
//         let pwd = UUID_MAP.find(m => m.id == "PASSWORD").uuid;
//
//         await writeValue(ssid, Number(ssid_el.value));
//         await writeBuffer(pwd, new TextEncoder().encode(pwd_el.value));
//         if (attr.after_class_remove) document.querySelector("#container").classList.remove(attr.after_class_remove);
//     });
//
//     return el;
// };

const INPUTS = {
    "switch": createSwitchToggle,
    "pressed": createPushPressedButton,
    "timer": createTimerInput,
    "range": createRangeInput,
    "label": createLabel,
    "select": createSelect,
    "text": createInputText
};

let updateUIFromDevice = (buffer) => {
    let hex_string = new TextDecoder().decode(buffer);
    let regexp = new RegExp("^(?<flags>[0-9A-Z]{1})(?<VERSION>[0-9A-Z]{1})(?<SLEEP_AFTER_MINUTES>[0-9A-Z]{2})(?<DISCRETE_COUNT>[0-9A-Z]{1})(?<DISCRETE_INTERVAL>[0-9A-Z]{2})(?<BATT_LEVEL>[0-9A-Z]{3})$");
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

        if (type == 'label') el.innerText = value;
        else if (type == 'switch') el.checked = Number(value);
        else el.value = value;

        if (id == "CONTINUOUS") document.querySelector("#MANUAL_ALARM").dataset.continuous = value;
    });
};

document.addEventListener('DOMContentLoaded', async () => {
    console.log("DOMContentLoaded");
    let container = document.querySelector("#container");

    if (!navigator.bluetooth) {
        container.classList.add("bluetooth_not_supported");
        return;
    } else {
        let available = await navigator.bluetooth.getAvailability();
        if (!available) {
            container.classList.add("bluetooth_not_available");
            return;
        }

        if (!navigator.bluetooth.getDevices) {
            if (navigator.userAgent.indexOf("Chrome"))
                container.classList.add("chrome_getdevices_not_supported");
        }
    }

    let connect_btn = document.getElementById("connect");

    let device = await pairedDevice(DEVICE_NAME);
    if (device) container.classList.add("paired");

    connect_btn.addEventListener('click', async () => {
        if (!device) {
            try {
                console.log("Requested device");
                device = await requestDevice(DEVICE_NAME);
            } catch (e) {
                device = null;
                console.warn(e);
            }
        } else {
            console.log("device paired");
        }

        if (device) {
            try {
                let connected = await connectToBluetoothDevice(device);
                if (!connected) {
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

    if ('serviceWorker' in navigator) {
        navigator.serviceWorker.register(new URL('sw.js', import.meta.url), {
            scope: '/'
        }).then(
            (registration) => {
                console.warn('Service worker registration succeeded:', registration);
            },
            /*catch*/
            (error) => {
                console.warn('Service worker registration failed:', error);
            }
        )
    } else {
        console.warn('Service workers are not supported.')
    }
});

let Timeout = (timeout, result) => new Promise((resolve, reject) => window.setTimeout(resolve, timeout, result));

async function pairedDevice(name) {
    if (!navigator.bluetooth.getDevices) {
        console.warn("Enable experimental flags about://flags#");
        return null;
    }

    let devices = await navigator.bluetooth.getDevices();
    return devices.find(dd => dd.name.startsWith(name));
}

async function requestDevice(name) {

    let acceptAllDevices = !!document.querySelector("#acceptAllDevices:checked");
    let options = acceptAllDevices ? REQUEST_ALL_OPTIONS : FILTER_OPTIONS;

    console.log('Requesting Bluetooth Device...');
    let device = await navigator.bluetooth.requestDevice(options);

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
        //const abortController = new AbortController();

        device.addEventListener('advertisementreceived', (event) => {
            console.log('> Received advertisement from "' + device.name + '"...', event);
            let buffer = event.serviceData.get(SERVICE_UUID);
            try {
                updateUIFromDevice(buffer);
            } catch (e) {
                console.warn(e);
            }
            // Stop watching advertisements to conserve battery life.

            console.log('Connecting to GATT Server from "' + device.name + '"...');
            device.gatt.connect()
                .then(() => {
                    return onConnected(device);
                })
                .then(() => {
                    //abortController.abort();
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
                //signal: abortController.signal
            })
            .catch(error => {
                reject(error);
            });
    });

    return Promise.race([connect, Timeout(GATT_CONNECT_TIMEOUT, false)]);
}

async function onConnected(device) {
    console.log('> Bluetooth device "' + device.name + '" connected.');

    device.addEventListener('gattserverdisconnected', onDisconnected);
    let container = document.querySelector("#container");
    container.classList.add("connected");
    container.classList.remove("sleeping");
    await startNotifications(device);
}

async function onDisconnected() {
    console.log('> Bluetooth Device disconnected');
    let container = document.querySelector("#container");
    container.classList.remove("connected");

    let device = await pairedDevice(DEVICE_NAME);
    if (device) {
        let connected = await connectToBluetoothDevice(device);
        if (!connected) {
            console.warn("Could not reconnect to the bluetooth device");
        }
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
    const dataView = event.target.value;
    const mode = dataView.getUint8(0);
    const raw_buffer = dataView.buffer;
    let buffer = raw_buffer.slice(1, raw_buffer.byteLength);

    console.warn('Got notification mode ', mode, new TextDecoder().decode(dataView));
    switch (mode) {
        case 0:
            handleDetectionNotification();
            break;
        case 1:
            HandleDeepSleepNotification();
            break;
        case 2:
            HandleBatteryNotification(buffer);
            break;
        case 3:
            HandleNetworksScanNotification(buffer);
            break;
        case 4:
            HandleNetworkConnectionStatusNotification(buffer);
            break;
        default:
    }
}

function HandleBatteryNotification(buffer) {
    const value = new Uint16Array(buffer).at(0);
    document.querySelector("#BATT_LEVEL").innerText = value;
}

function HandleNetworksScanNotification(buffer) {
    let select = document.querySelector("#SELECT_SSID");
    let position = 0;
    let intArray = new Uint8Array(buffer);
    let lenRemoveMask = (1 << 7 | 1 << 6 | 1 << 5);

    while (position < buffer.byteLength) {
        let mask = intArray.at(position);
        let wifiNetworkNumber = mask >> 5;
        let len = mask & ~(lenRemoveMask);
        let str_buffer = buffer.slice(position + 1, position + 1 + len);
        let ssid = new TextDecoder().decode(str_buffer);
        position += len + 1;
        console.log(mask.toString(2).padStart(8, "0"), ssid, wifiNetworkNumber, len);
        let opt = document.createElement("option");
        opt.value = wifiNetworkNumber;
        opt.innerText = ssid;
        select.appendChild(opt);
    }
}

let HandleNetworkConnectionStatusNotification = (buffer) => {
    const value = new Uint8Array(buffer).at(0);
    console.log("Wifi connection is " + value);
    // 0: wifi connected
    // 1: wifi connected to internet
    // 2: wifi onDisconnected
    // 3: wifi timeout
    // 4: wifi scan failed
};

let HandleDeepSleepNotification = () => {
    console.log('device is into deep sleep ...');
    document.querySelector("#container").classList.add("sleeping");
}

let handleDetectionNotification = () => {
    Notification.requestPermission((result) => {
        if (result === "granted") {
            navigator.serviceWorker.ready.then((registration) => {
                console.warn('serviceWorker', registration);
                try {
                    registration.showNotification("Détection de mouvement !!", {
                        body: `distance: ?M`,
                        tag: "ld2410",
                        //icon:"./detection.png",
                        vibrate: [500, 1000, 500, 1000, 500]
                    });
                } catch (e) {
                    alert(e);
                }
            });
        }
    });
}

async function startNotifications(device) {
    const alert_service = await device.gatt.getPrimaryService(ALERT_SERVICE_UUID);

    let notif = await alert_service.getCharacteristic(NOTIFICATION_UUID);
    if (notif.startNotifications) {
        await notif.startNotifications();
        notif.addEventListener('characteristicvaluechanged', HandleAlertNotification);
        console.log('Added event listener characteristicvaluechanged for ', NOTIFICATION_UUID);
    }
    //
    // let batt = await alert_service.getCharacteristic(BATTERY_LEVEL_UUID);
    // if (batt.startNotifications) {
    //     await batt.startNotifications();
    //     batt.addEventListener('characteristicvaluechanged', HandleBatteryNotification);
    //     console.log('Added event listener characteristicvaluechanged for ', BATTERY_LEVEL_UUID);
    // }
    //
    // let networks = await alert_service.getCharacteristic(NETWORKS_UUID);
    // if (networks.startNotifications) {
    //     await networks.startNotifications();
    //     networks.addEventListener('characteristicvaluechanged', HandleNetworksScanNotification);
    //     console.log('Added event listener characteristicvaluechanged for ', NETWORKS_UUID);
    // }
}

async function writeValue(uuid, value) {
    let buffer = new Uint8Array([value]).buffer;
    return await writeBuffer(uuid, buffer);
}

async function writeBuffer(uuid, buffer) {
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
            await characteristic.writeValue(buffer);

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
