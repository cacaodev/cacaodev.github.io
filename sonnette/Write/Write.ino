/*
    Based on Neil Kolban example for IDF: https://github.com/nkolban/esp32-snippets/blob/master/cpp_utils/tests/BLE%20Tests/SampleWrite.cpp
    Ported to Arduino ESP32 by Evandro Copercini
*/
#ifndef SOC_BLE_50_SUPPORTED
#warning "This SoC does not support BLE5. Try using ESP32-C3, or ESP32-S3"
#else
//#include <chrono>
#include <BLEDevice.h>
#include <BLEUtils.h>
#include <BLEServer.h>
#include <BLEAdvertising.h>
#include <BLE2902.h>
#include <Preferences.h>
#include "driver/gpio.h"

#ifdef ENABLE_WIFI_UPDATES
#include <esp32FOTA.hpp>
esp32FOTA esp32FOTA("sonnette", "1.0.0");
#endif

// See the following for generating UUIDs:
// https://www.uuidgenerator.net/
#define FIRMWARE_VERSION_NUMBER 1

#define SERVICE_UUID "4fafc201-1fb5-459e-8fcc-c5c9c331914a"
#define SERVICE_ALERT_UUID "4fafc201-1fb5-459e-8fcc-c5c9c331914b"

#define RGB_LED "beb5483e-36e1-4688-b7f5-ea07361b26a1"
#define ENABLE_PIR "beb5483e-36e1-4688-b7f5-ea07361b26a2"
#define MANUAL_ALARM "beb5483e-36e1-4688-b7f5-ea07361b26a3"
#define SSID "beb5483e-36e1-4688-b7f5-ea07361b26a4"
#define PASSWORD "beb5483e-36e1-4688-b7f5-ea07361b26a5"
#define ENABLE_NOTIFICATIONS "beb5483e-36e1-4688-b7f5-ea07361b26a6"
#define ENABLE_DRING "beb5483e-36e1-4688-b7f5-ea07361b26a7"
#define NOTIFICATION "beb5483e-36e1-4688-b7f5-ea07361b26a8"
#define SLEEP_AFTER_MINUTES "beb5483e-36e1-4688-b7f5-ea07361b26a9"
#define FIRMWARE_VERSION "beb5483e-36e1-4688-b7f5-ea07361b26b1"
#define MANUAL_ALARM_CONTINUOUS "beb5483e-36e1-4688-b7f5-ea07361b26b2"
#define MANUAL_ALARM_DISCRETE_COUNT "beb5483e-36e1-4688-b7f5-ea07361b26b3"
#define MANUAL_ALARM_DISCRETE_INTERVAL "beb5483e-36e1-4688-b7f5-ea07361b26b4"
#ifdef ENABLE_WIFI_UPDATES
#define FIRMWARE_UPDATE "beb5483e-36e1-4688-b7f5-ea07361b26b5"
#endif
#define BATT_LEVEL "beb5483e-36e1-4688-b7f5-ea07361b26b6"

#ifdef ARDUINO_XIAO_ESP32C3
// 64 E8 33 85 D1 BE
#define DEVICE_NAME "SONNETTE XIAO"
#define ADC_IN_PIN D1
#define ENABLE_PIR_PIN D3
#define PIR_INPUT_PIN D5
#define PIR_TX_PIN D6
#define PIR_RX_PIN D7
#define DEFAULT_WAKEUP_PIN D0
#define MANUAL_ALARM_PIN D8
#define ENABLE_DRING_PIN D10
#endif

#ifdef ARDUINO_LOLIN_C3_PICO
#define DEVICE_NAME "SONNETTE LOLIN"
#define ADC_IN_PIN 1
#define DEFAULT_WAKEUP_PIN 4
#define PIR_INPUT_PIN 5
#define MANUAL_ALARM_PIN 6
#define RGB_BUILTIN 7
#define ENABLE_PIR_PIN 8
#define ENABLE_DRING_PIN 10
#endif

#define DEFAULT_WAKEUP_LEVEL ESP_GPIO_WAKEUP_GPIO_HIGH
#define DICRETE_ON_DURATION 500
#define MANIFEST_URL "http://cacaodev.github.com/sonnette/manifest.json"
#define ADVERTISING_MIN_INTERVAL 0x0020
#define ADVERTISING_MAX_INTERVAL 0x0640
#define ADVERTISING_MANUFACTURER_DATA "TONTON MARTIN"
#define BATTERY_NOTIFICATION_PERIODIC_DELAY 300000

//#define DEBUG_ESP_PORT

#ifdef DEBUG_ESP_PORT
#define DEBUG_PRINTLN(x) Serial.println(x)
#define DEBUG_PRINT(x) Serial.print(x)
#define DEBUG_PRINTF(x...) Serial.printf(x)
#else
#define DEBUG_PRINTLN(x)
#define DEBUG_PRINT(x)
#define DEBUG_PRINTF(x...)
#endif

bool enable_notifications;
bool enable_pir;
bool enable_dring;
uint8_t sleep_after_minutes;
bool manual_alarm_continuous;
uint8_t manual_alarm_discrete_count;
uint8_t manual_alarm_discrete_interval;
uint16_t battery_level_old = 0;

BLECharacteristic *notif = NULL;
BLECharacteristic *battery = NULL;
BLEServer *pServer = NULL;
bool deviceConnected = false;
bool oldDeviceConnected = false;
bool INT_STATE = false;
unsigned long last_activity;
bool handle_update = false;

Preferences preferences;
BLEAdvertisementData advert;

void setAdvertisementData();
void dring(uint8_t value);
void abortDring();

struct {
  uint8_t state = 0;
  uint8_t counter = 1;
  mutable uint8_t iteration = 0;
  unsigned long timer = 0;
  uint16_t delay = 200;
} BlinkMode;

class MyCallbacks : public BLECharacteristicCallbacks {
  void onWrite(BLECharacteristic *pCharacteristic) {
    uint8_t *data = pCharacteristic->getData();
    size_t len = pCharacteristic->getLength();
    uint8_t value = data[0];

    if (len > 0) {

      String uuid = pCharacteristic->getUUID().toString();

      DEBUG_PRINTF("Wrote charasterisctic UUID:%s value:%u\n", uuid.c_str(), value);

      if (uuid == RGB_LED) {
#ifdef ARDUINO_LOLIN_C3_PICO
        neopixelWrite(RGB_BUILTIN, value ? RGB_BRIGHTNESS : 0, 0, 0);
#endif
      } else if (uuid == MANUAL_ALARM) {
        if (manual_alarm_continuous) {
          dring(value);
        } else if (value == 1) {
          BlinkMode.state = 1;
        }
      } else if (uuid == ENABLE_PIR) {
        enable_pir = value;
        digitalWrite(ENABLE_PIR_PIN, !enable_pir);
      } else if (uuid == ENABLE_DRING) {
        enable_dring = value;
        digitalWrite(ENABLE_DRING_PIN, enable_dring);
        if (enable_dring == 0) abortDring();
      } else if (uuid == ENABLE_NOTIFICATIONS) {
        enable_notifications = value;
      } else if (uuid == SLEEP_AFTER_MINUTES) {
        sleep_after_minutes = value;
        preferences.putUChar("sleep_after", sleep_after_minutes);
      } else if (uuid == SSID) {
        preferences.putString("ssid", (const char *)data);
      } else if (uuid == PASSWORD) {
        preferences.putString("password", (const char *)data);
      } else if (uuid == MANUAL_ALARM_CONTINUOUS) {
        manual_alarm_continuous = value;
        if (manual_alarm_continuous == 1) abortDring();
      } else if (uuid == MANUAL_ALARM_DISCRETE_COUNT) {
        manual_alarm_discrete_count = value;
        BlinkMode.counter = value;
      } else if (uuid == MANUAL_ALARM_DISCRETE_INTERVAL) {
        BlinkMode.delay = value * 100;
        manual_alarm_discrete_interval = value;
#ifdef ENABLE_WIFI_UPDATES
      } else if (uuid == FIRMWARE_UPDATE) {
        startUpdate();
#endif
      }

      setAdvertisementData();
      last_activity = millis();
    }
  }
};

class MyServerCallbacks : public BLEServerCallbacks {
  void onConnect(BLEServer *pServer) {
    deviceConnected = true;
  };

  void onDisconnect(BLEServer *pServer) {
    deviceConnected = false;
  }
};

// static constexpr auto DEEP_SLEEP_TIME = std::chrono::hours{ 2 };
// esp_err_t esp_sleep_enable_timer_wakeup_using_chrono(
//   std::chrono::milliseconds duration) {
//   return esp_sleep_enable_timer_wakeup(
//     duration.count());
// }
BLECharacteristic *createCharacteristic(BLEService *pService, const char *uuid, uint8_t *default_value, MyCallbacks *callbacks) {
  BLECharacteristic *pCharacteristic = pService->createCharacteristic(
    uuid,
    BLECharacteristic::PROPERTY_READ | BLECharacteristic::PROPERTY_WRITE);

  pCharacteristic->setValue(default_value, sizeof(default_value));
  pCharacteristic->setCallbacks(callbacks);

  return pCharacteristic;
}

// BLECharacteristic *createCharacteristic(BLEService *pService, const char *uuid, uint16_t default_value, MyCallbacks *callbacks) {
//   uint8_t *value;
//   uint8_t lo = default_value & 0xFF;
//   uint8_t hi = default_value >> 8;

//   value[0] = lo;
//   value[1] = hi;

//   return createCharacteristic(pService, uuid, value, callbacks);
// }

BLECharacteristic *createCharacteristic(BLEService *pService, const char *uuid, uint8_t default_value, MyCallbacks *callbacks) {
  return createCharacteristic(pService, uuid, (uint8_t *)&default_value, callbacks);
}

void IRAM_ATTR pir_int() {
  static int start = 0;
  if (enable_pir && (millis() - start) > 500UL) {
    INT_STATE = true;
    start = millis();
  }
}

void setup() {
  last_activity = millis();

  pinMode(ENABLE_PIR_PIN, OUTPUT);
  pinMode(ENABLE_DRING_PIN, OUTPUT);
  pinMode(MANUAL_ALARM_PIN, OUTPUT);
  pinMode(PIR_INPUT_PIN, INPUT_PULLDOWN);
  attachInterrupt(digitalPinToInterrupt(PIR_INPUT_PIN), pir_int, RISING);

  gpio_hold_dis((gpio_num_t)ENABLE_PIR_PIN);
  gpio_hold_dis((gpio_num_t)ENABLE_DRING_PIN);
  gpio_deep_sleep_hold_dis();

#ifdef DEBUG_ESP_PORT
  //int8_t retry = 5;
  /*while(retry--)*/ Serial.begin(115200);
  delay(500);
#endif

  DEBUG_PRINTLN("===");

  //Print the wakeup reason for ESP32
  //print_wakeup_reason();

  preferences.begin("my-app", false);
  enable_pir = preferences.getBool("enable_pir", false);
  enable_dring = preferences.getBool("enable_dring", false);
  enable_notifications = preferences.getBool("enable_notifs", false);
  sleep_after_minutes = preferences.getUChar("sleep_after", 5);
  manual_alarm_continuous = preferences.getBool("continuous", true);
  manual_alarm_discrete_count = preferences.getUChar("discrete_count", 1);
  manual_alarm_discrete_interval = preferences.getUShort("discrete_delay", 10);
  String ssid = preferences.getString("ssid", "");
  String password = preferences.getString("password", "");
  BlinkMode.counter = manual_alarm_discrete_count;
  BlinkMode.delay = manual_alarm_discrete_interval * 100;

  digitalWrite(ENABLE_PIR_PIN, !enable_pir);
  digitalWrite(ENABLE_DRING_PIN, enable_dring);
  digitalWrite(MANUAL_ALARM_PIN, HIGH);
  delay(DICRETE_ON_DURATION);
  digitalWrite(MANUAL_ALARM_PIN, LOW);

  DEBUG_PRINTF("enable_pir=%u enable_dring=%u enable_notifications=%u manual_alarm_continuous=%u sleep_after_minutes=%u manual_alarm_discrete_count=%u manual_alarm_discrete_interval=%u\n", enable_pir, enable_dring, enable_notifications, manual_alarm_continuous, sleep_after_minutes, manual_alarm_discrete_count, manual_alarm_discrete_interval);
  BLEDevice::init(DEVICE_NAME);
  pServer = BLEDevice::createServer();
  pServer->setCallbacks(new MyServerCallbacks());

  BLEService *alertService = pServer->createService(SERVICE_ALERT_UUID);
  BLEService *pService = pServer->createService(BLEUUID(SERVICE_UUID), 32);
  MyCallbacks *clbk = new MyCallbacks();

  createCharacteristic(pService, RGB_LED, (uint8_t)0, clbk);
  createCharacteristic(pService, MANUAL_ALARM, (uint8_t)0, clbk);
  createCharacteristic(pService, ENABLE_PIR, (uint8_t)enable_pir, clbk);
  createCharacteristic(pService, ENABLE_DRING, (uint8_t)enable_dring, clbk);
  createCharacteristic(pService, ENABLE_NOTIFICATIONS, (uint8_t)enable_notifications, clbk);
  createCharacteristic(pService, SLEEP_AFTER_MINUTES, sleep_after_minutes, clbk);
  createCharacteristic(pService, FIRMWARE_VERSION, FIRMWARE_VERSION_NUMBER, clbk);
  createCharacteristic(pService, MANUAL_ALARM_CONTINUOUS, (uint8_t)manual_alarm_continuous, clbk);
  createCharacteristic(pService, MANUAL_ALARM_DISCRETE_COUNT, manual_alarm_discrete_count, clbk);
  createCharacteristic(pService, MANUAL_ALARM_DISCRETE_INTERVAL, (uint8_t)manual_alarm_discrete_interval, clbk);

  createCharacteristic(pService, SSID, (uint8_t *)ssid.c_str(), clbk);
  createCharacteristic(pService, PASSWORD, (uint8_t *)ssid.c_str(), clbk);

  notif = alertService->createCharacteristic(NOTIFICATION,
                                             BLECharacteristic::PROPERTY_READ | BLECharacteristic::PROPERTY_NOTIFY);
  BLE2902 *desc = new BLE2902();
  notif->addDescriptor(desc);

  battery = alertService->createCharacteristic(NOTIFICATION,
                                             BLECharacteristic::PROPERTY_READ | BLECharacteristic::PROPERTY_NOTIFY);
  BLE2902 *desc2 = new BLE2902();
  battery->addDescriptor(desc2);

  pService->start();
  alertService->start();

  BLEAdvertising *pAdvertising = BLEDevice::getAdvertising();
  //pAdvertising->addServiceUUID(SERVICE_UUID);
  //pAdvertising->addServiceUUID(SERVICE_ALERT_UUID);
  pAdvertising->setScanResponse(true);

  pAdvertising->setMinPreferred(0x06);  // functions that help with iPhone connections issue
  pAdvertising->setMinPreferred(0x12);
  // Minimum advertising interval for undirected and low duty cycle directed advertising.
  // Range: 0x0020 to 0x4000 Default: N = 0x0800 (1.28 second) Time = N * 0.625 msec Time Range: 20 ms to 10.24 sec
  pAdvertising->setMinInterval(ADVERTISING_MIN_INTERVAL);
  pAdvertising->setMaxInterval(ADVERTISING_MAX_INTERVAL);
  //pAdvertising->setScanResponse(false);
  //pAdvertising->setMinPreferred(0x0);  // set value to 0x00 to not advertise this parameter

  //advert.setManufacturerData(ADVERTISING_MANUFACTURER_DATA);
  setAdvertisementData();

  BLEDevice::startAdvertising();

#ifdef ARDUINO_LOLIN_C3_PICO
  neopixelWrite(RGB_BUILTIN, RGB_BRIGHTNESS, RGB_BRIGHTNESS, RGB_BRIGHTNESS);
  delay(1000);
  neopixelWrite(RGB_BUILTIN, 0, 0, 0);
#endif
  // delay(200);
  // neopixelWrite(RGB_BUILTIN, RGB_BRIGHTNESS, RGB_BRIGHTNESS, RGB_BRIGHTNESS);
  // delay(200);
  // neopixelWrite(RGB_BUILTIN, 0, 0, 0);
  // delay(400);
  // neopixelWrite(RGB_BUILTIN, 0, RGB_BRIGHTNESS, 0);
  // delay(200);
  // neopixelWrite(RGB_BUILTIN, 0, 0, 0);

  //attachInterrupt(digitalPinToInterrupt(PIR_INPUT), pir_int, FALLING);
}

void setAdvertisementData() {
  char data[11];
  uint16_t batt_level = analogRead(ADC_IN_PIN); // 0-4095
  DEBUG_PRINTF("batt_level=%u\n", batt_level);
  uint8_t flags = enable_pir | (enable_dring << 1) | (enable_notifications << 2) | (manual_alarm_continuous << 3);
  snprintf(data, 11, "%01X%01X%02X%01X%02X%03X", flags, FIRMWARE_VERSION_NUMBER, sleep_after_minutes, max(manual_alarm_discrete_count, (uint8_t)15), manual_alarm_discrete_interval, batt_level);

  BLEAdvertising *pAdvertising = BLEDevice::getAdvertising();
  advert.setServiceData(BLEUUID(SERVICE_UUID), data);
  advert.setName("SONNETTE");
  //advert.setCompleteServices(BLEUUID(SERVICE_UUID));
  //advert.setManufacturerData(ADVERTISING_MANUFACTURER_DATA);
  pAdvertising->setAdvertisementData(advert);
}

void notifyDetection(uint8_t value) {
  notif->setValue((uint8_t *)&value, 1);
  notif->notify();
}

void notifyBatteryLevel(uint16_t batt_level) {
  DEBUG_PRINTLN("Notify battery level change");
  battery->setValue((uint8_t *)&batt_level, 2);
  battery->notify();
}

void loop() {
  // put your main code here, to run repeatedly:
  static unsigned long timer = 0;
  if (millis() - timer > BATTERY_NOTIFICATION_PERIODIC_DELAY) {
    uint16_t batt_level = round(analogRead(ADC_IN_PIN) / 10) * 10;
    if (batt_level != battery_level_old) {
      notifyBatteryLevel(batt_level);
      battery_level_old = batt_level;
    }

    timer = millis();
  }

  if (deviceConnected && enable_notifications && INT_STATE == true) {
    DEBUG_PRINTLN("interrupt !!");
    notifyDetection(2);

    INT_STATE = false;
  }
  // disconnecting
  if (!deviceConnected && oldDeviceConnected) {
    delay(500);                   // give the bluetooth stack the chance to get things ready
    pServer->startAdvertising();  // restart advertising
    DEBUG_PRINTLN("start advertising");
    oldDeviceConnected = deviceConnected;
  }
  // connecting
  if (deviceConnected && !oldDeviceConnected) {
    // do stuff here on connecting
    oldDeviceConnected = deviceConnected;
  }

  unsigned long use_duration = abs((signed long)(millis() - last_activity));
  unsigned long max_duration = (unsigned long)(sleep_after_minutes * 60UL * 1000UL);
  if (use_duration > max_duration) {
    DEBUG_PRINTF("Go to sleep after %u minutes of inactivity. use_duration:%u max:%u\n", sleep_after_minutes, use_duration, max_duration);
    go_to_sleep();
  }

  if (BlinkMode.state == 1) {
    dring(HIGH);

    BlinkMode.timer = millis();
    BlinkMode.state = 2;
  } else if (BlinkMode.state == 2) {
    if (millis() - BlinkMode.timer > DICRETE_ON_DURATION) {
      dring(LOW);

      BlinkMode.iteration = BlinkMode.iteration + 1;
      BlinkMode.timer = millis();
      BlinkMode.state = 3;
    }
  } else if (BlinkMode.state == 3) {
    if (millis() - BlinkMode.timer > BlinkMode.delay) {

      if (BlinkMode.iteration == BlinkMode.counter) {
        BlinkMode.state = 0;
        BlinkMode.iteration = 0;
        BlinkMode.timer = 0;
      } else {
        BlinkMode.state = 1;
      }
    }
  }

#ifdef ENABLE_WIFI_UPDATES
  if (handle_update) {
    esp32FOTA.handle();
  }
#endif
}

void abortDring() {
  if (BlinkMode.state != 0) {
    BlinkMode.state = 0;
    BlinkMode.iteration = 0;
    dring(LOW);
  }
}

void go_to_sleep() {

  notifyDetection(0);
  detachInterrupt(digitalPinToInterrupt(PIR_INPUT_PIN));

#ifdef ARDUINO_LOLIN_C3_PICO
  neopixelWrite(RGB_BUILTIN, 0, RGB_BRIGHTNESS, 0);
  delay(500);
  neopixelWrite(RGB_BUILTIN, 0, 0, 0);
#endif

  preferences.putBool("enable_pir", enable_pir);
  preferences.putBool("enable_dring", enable_dring);
  preferences.putBool("enable_notifs", enable_notifications);
  preferences.putUChar("sleep_after", sleep_after_minutes);
  preferences.putBool("continuous", manual_alarm_continuous);
  preferences.putUChar("discrete_count", manual_alarm_discrete_count);
  preferences.putUChar("discrete_delay", manual_alarm_discrete_interval);
  preferences.end();

  gpio_deep_sleep_hold_en();
  gpio_hold_en((gpio_num_t)ENABLE_PIR_PIN);
  gpio_hold_en((gpio_num_t)ENABLE_DRING_PIN);

  const gpio_config_t config = {
    .pin_bit_mask = BIT(DEFAULT_WAKEUP_PIN),
    .mode = GPIO_MODE_INPUT,
  };

  ESP_ERROR_CHECK(gpio_config(&config));
  ESP_ERROR_CHECK(esp_deep_sleep_enable_gpio_wakeup(BIT(DEFAULT_WAKEUP_PIN), DEFAULT_WAKEUP_LEVEL));
  DEBUG_PRINTF("Enabling GPIO wakeup on pin GPIO%u\n", DEFAULT_WAKEUP_PIN);

  //esp_sleep_enable_timer_wakeup(1000000ULL * 60ULL * 60ULL * 12ULL);
  esp_deep_sleep_start();
}

void dring(uint8_t value) {
  digitalWrite(MANUAL_ALARM_PIN, value);
#ifdef ARDUINO_LOLIN_C3_PICO
    neopixelWrite(RGB_BUILTIN, value * RGB_BRIGHTNESS, 0, value * RGB_BRIGHTNESS);
#endif
}
void print_wakeup_reason() {
  esp_sleep_wakeup_cause_t wakeup_reason;

  wakeup_reason = esp_sleep_get_wakeup_cause();

  switch (wakeup_reason) {
    case ESP_SLEEP_WAKEUP_EXT0: DEBUG_PRINTLN("Wakeup caused by external signal using RTC_IO"); break;
    case ESP_SLEEP_WAKEUP_EXT1: DEBUG_PRINTLN("Wakeup caused by external signal using RTC_CNTL"); break;
    case ESP_SLEEP_WAKEUP_TIMER: DEBUG_PRINTLN("Wakeup caused by timer"); break;
    case ESP_SLEEP_WAKEUP_TOUCHPAD: DEBUG_PRINTLN("Wakeup caused by touchpad"); break;
    case ESP_SLEEP_WAKEUP_ULP: DEBUG_PRINTLN("Wakeup caused by ULP program"); break;
    default: DEBUG_PRINTF("Wakeup was not caused by deep sleep: %u\n", wakeup_reason); break;
  }
}

#ifdef ENABLE_WIFI_UPDATES
void startUpdate() {
  setup_wifi();
  esp32FOTA.setManifestURL(MANIFEST_URL);
  // esp32FOTA.useDeviceId( true ); // optionally append the device ID to the HTTP query
  handle_update = true;
}

void setup_wifi() {
  delay(10);
  String ssid = preferences.getString("ssid", "");
  String password = preferences.getString("password", "");
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    DEBUG_PRINTF(".");
  }
}
#endif
#endif
