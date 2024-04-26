const SERVICE_UUID = "beb5483e-36e1-4688-b7f5-ea07361b26aa";
const UUID_MAP = {
    RGB_LED: "beb5483e-36e1-4688-b7f5-ea07361b26a1",
    PIR_ENABLE: "beb5483e-36e1-4688-b7f5-ea07361b26a2",
    MANUAL_ALARM: "beb5483e-36e1-4688-b7f5-ea07361b26a3",
    ENABLE_NOTIFICATIONS: "beb5483e-36e1-4688-b7f5-ea07361b26a6"
};
const DEVICE_NAME = "LOLIN_S3_MINI";

document.addEventListener('DOMContentLoaded', () => {
    console.log("DOMContentLoaded");
    let connect_btn = document.getElementById("connect");
    connect_btn.addEventListener('click', async () => {
        try {
            await requestDevice(DEVICE_NAME); /*await updateConnectButtonVisibility(connect_btn);*/
            console.log("Requested device");
        } catch (e) {
            console.warn(e);
        }
    });
    //await updateConnectButtonVisibility(connect_btn);

    Object.entries(UUID_MAP).forEach(([name, uuid], i) => {
        let btn = document.createElement("button");
        btn.id = uuid;
        btn.value = "0";
        btn.innerHTML = name;
        btn.addEventListener("click", async () => {
            btn.value = 1 - Number(btn.value);
            await writeValue(uuid, btn.value);
        });
        document.getElementById("container").appendChild(btn);
    });
});


async function connectToBluetoothDevice(device) {
    if (device.gatt.connected) {
      console.log('device server allready connected');
      return true;
    }

    const abortController = new AbortController();

    let timeout = new Promise(function(resolve, reject) {
      window.setTimeout(resolve, 10000, false);
    });

    let connect = new Promise(function(resolve, reject) {
        const abortController = new AbortController();

        device.addEventListener('advertisementreceived', (event) => {
            console.log('> Received advertisement from "' + device.name + '"...');
            // Stop watching advertisements to conserve battery life.
            abortController.abort();
            console.log('Connecting to GATT Server from "' + device.name + '"...');
            device.gatt.connect()
                .then(() => {
                    console.log('> Bluetooth device "' + device.name + ' connected.');
                    device.addEventListener('gattserverdisconnected', onDisconnected);
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
                console.log('Argh! ' + error);
            });
    });

    return Promise.race([connect, timeout]);
}

async function updateConnectButtonVisibility(btn) {
    let device = await pairedDevice(DEVICE_NAME);
    btn.classList.toggle("connected", !!device);
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
async function onDisconnected() {
    let device = await pairedDevice(DEVICE_NAME);
    console.log('> Bluetooth Device disconnected');
    await connectToBluetoothDevice(device);
}

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
    //   var rssi = event.rssi;
    //   var appleData = event.manufacturerData.get(0x004C);
    //
    //   if (appleData.byteLength != 23 ||
    //     appleData.getUint16(0, false) !== 0x0215) {
    //   console.log({isBeacon: false});
    //     }
    //     var uuidArray = new Uint8Array(appleData.buffer, 2, 16);
    //     var major = appleData.getUint16(18, false);
    //     var minor = appleData.getUint16(20, false);
    //     var txPowerAt1m = -appleData.getInt8(22);
    //     console.log({
    //       isBeacon: true,
    //       uuidArray,
    //       major,
    //       minor,
    //       pathLossVs1m: txPowerAt1m - rssi});
}

async function pairedDevice(name) {
    let devices = await navigator.bluetooth.getDevices();
    return devices.find(dd => dd.name == name);
}

async function requestDevice(name) {

    console.log('Requesting Bluetooth Device...');
    let device = await navigator.bluetooth.requestDevice({
        filters: [{
            name: name,
            services: [SERVICE_UUID]
        }]
    });

    //device.watchAdvertisements();
    //device.addEventListener('advertisementreceived', interpretIBeacon);

    return device;
}

async function writeValue(uuid, value) {
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

        if (connected) await writeCharacteristicValue(device, uuid, value);
        else console.log('Could not connect to gatt server');

    } catch (error) {
        alert('Argh! ' + error);
    }
}

async function writeCharacteristicValue(device, uuid, value) {
    console.log('Getting Service...');
    const service = await device.gatt.getPrimaryService(SERVICE_UUID);

    console.log('Getting Characteristic...');
    const characteristic = await service.getCharacteristic(uuid);

    console.log('Setting Characteristic value...');
    await characteristic.writeValue(new TextEncoder().encode(value).buffer);
}
