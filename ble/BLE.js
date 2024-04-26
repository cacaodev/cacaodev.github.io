
  const SERVICE_UUID = "4fafc201-1fb5-459e-8fcc-c5c9c331914b";
  const UUID_MAP = {
    RGB_LED: "beb5483e-36e1-4688-b7f5-ea07361b26a1",
    PIR_ENABLE: "beb5483e-36e1-4688-b7f5-ea07361b26a2",
    MANUAL_ALARM: "beb5483e-36e1-4688-b7f5-ea07361b26a3",
    ENABLE_NOTIFICATIONS: "beb5483e-36e1-4688-b7f5-ea07361b26a6"
  };

function connect(bluetoothDevice, clbk) {
  exponentialBackoff(3 /* max retries */, 2 /* seconds delay */,
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

async function onDisconnected() {
  let device = await pairedDevice("MyESP32");
  console.log('> Bluetooth Device disconnected');
  connect(device);
}

/* Utils */

// This function keeps calling "toTry" until promise resolves or has
// retried "max" number of times. First retry has a delay of "delay" seconds.
// "success" is called upon success.
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

async function requestDevice() {

    console.log('Requesting Bluetooth Device...');
    let device = await navigator.bluetooth.requestDevice({ filters: [{name:"LOLIN_S3_MINI"}, {services: [SERVICE_UUID]}]});
    if (!device) throw 'No device selected';
    device.watchAdvertisements();
    device.addEventListener('advertisementreceived', interpretIBeacon);

  return device;
}

async function writeValue(uuid, value) {
  try {
    console.log('Getting Bluetooth Device...');
    let device = await pairedDevice("MyESP32");

    if (!device) {console.log('No paired device'); device = await requestDevice();  }

    if (!device.gatt.connected) {
      console.log('device server not connected');
      device.addEventListener('gattserverdisconnected', onDisconnected);
      connect(device, async () => await writeCharacteristicValue(device, uuid, value));
    } else
      await writeCharacteristicValue(device, uuid, value);

  } catch(error) {
    alert('Argh! ' + error);
  }
}

async function writeCharacteristicValue(device, uuid, value)  {
  console.log('Getting Service...');
  const service = await device.gatt.getPrimaryService(SERVICE_UUID);

  console.log('Getting Characteristic...');
  const characteristic = await service.getCharacteristic(uuid);

  console.log('Setting Characteristic value...');
  await characteristic.writeValue(new TextEncoder().encode(value).buffer);
}
