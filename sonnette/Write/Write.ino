/*
    Based on Neil Kolban example for IDF: https://github.com/nkolban/esp32-snippets/blob/master/cpp_utils/tests/BLE%20Tests/SampleWrite.cpp
    Ported to Arduino ESP32 by Evandro Copercini
*/
#ifndef SOC_BLE_50_SUPPORTED
#warning "This SoC does not support BLE5. Try using ESP32-C3, or ESP32-S3"
#else

#include <BLEDevice.h>
#include <BLEUtils.h>
#include <BLEServer.h>
#include <BLEAdvertising.h>
#include <BLE2902.h>
#include <Preferences.h>
#include "driver/gpio.h"

#define ENABLE_WIFI

#ifdef ENABLE_WIFI
#include "WiFi.h"
#define WIFI_TIMEOUT 30000
#define START_WIFI_SCAN "beb5483e-36e1-4688-b7f5-ea07361b26b7"
#endif

// See the following for generating UUIDs:
// https://www.uuidgenerator.net/
#define FIRMWARE_VERSION_NUMBER 1U

#define SERVICE_UUID "4fafc201-1fb5-459e-8fcc-c5c9c331914a"
#define SERVICE_ALERT_UUID "4fafc201-1fb5-459e-8fcc-c5c9c331914b"

#define RGB_LED "beb5483e-36e1-4688-b7f5-ea07361b26a1"
#define ENABLE_HRS "beb5483e-36e1-4688-b7f5-ea07361b26a2"
#define MANUAL_ALARM "beb5483e-36e1-4688-b7f5-ea07361b26a3"
#define WIFI_PARAMS "beb5483e-36e1-4688-b7f5-ea07361b26a4"

#define ENABLE_NOTIFICATIONS "beb5483e-36e1-4688-b7f5-ea07361b26a6"
#define ENABLE_DRING "beb5483e-36e1-4688-b7f5-ea07361b26a7"
#define SLEEP_AFTER_MINUTES "beb5483e-36e1-4688-b7f5-ea07361b26a9"
#define FIRMWARE_VERSION "beb5483e-36e1-4688-b7f5-ea07361b26b1"
#define MANUAL_ALARM_CONTINUOUS "beb5483e-36e1-4688-b7f5-ea07361b26b2"
#define MANUAL_ALARM_DISCRETE_COUNT "beb5483e-36e1-4688-b7f5-ea07361b26b3"
#define MANUAL_ALARM_DISCRETE_ON_DELAY "beb5483e-36e1-4688-b7f5-ea07361b26b8"
#define MANUAL_ALARM_DISCRETE_OFF_DELAY "beb5483e-36e1-4688-b7f5-ea07361b26b4"
#define NOTIFICATION "beb5483e-36e1-4688-b7f5-ea07361b26a8"
#define PERSISTENT "beb5483e-36e1-4688-b7f5-ea07361b26b9"

#define DEFAULT_WAKEUP_LEVEL ESP_GPIO_WAKEUP_GPIO_HIGH
#define DISCRETE_ON_DURATION 50
#define ADVERTISING_MIN_INTERVAL 0x0020
#define ADVERTISING_MAX_INTERVAL 0x0320
#define ADVERTISING_MANUFACTURER_DATA "TONTON MARTIN"
#define BATTERY_NOTIFICATION_PERIODIC_DELAY 300000

#ifdef ARDUINO_XIAO_ESP32C3
// 64 E8 33 85 D1 BE
#define DEVICE_NAME "SONNETTE XIAO"
#define ADC_IN_PIN D1
#define WAKEUP_PIN D2
#define ENABLE_HRS_PIN D3
#define HRS_TX_PIN D4
#define HRS_RX_PIN D5
#define MANUAL_ALARM_PIN D8
#define HRS_INPUT_PIN D9
#define ENABLE_DRING_PIN D10
#endif

#ifdef ARDUINO_LOLIN_C3_PICO
#define DEBUG_ESP_PORT
#define DEVICE_NAME "SONNETTE LOLIN"
#define ADC_IN_PIN 1
#define WAKEUP_PIN 4
#define HRS_INPUT_PIN 5
#define MANUAL_ALARM_PIN 6
#define RGB_BUILTIN 7
#define ENABLE_HRS_PIN 8
#define ENABLE_DRING_PIN 10
#endif

#ifdef DEBUG_ESP_PORT
#define DEBUG_PRINTLN(x) Serial.println(x)
#define DEBUG_PRINT(x) Serial.print(x)
#define DEBUG_PRINTF(x...) Serial.printf(x)
#else
#define DEBUG_PRINTLN(x)
#define DEBUG_PRINT(x)
#define DEBUG_PRINTF(x...)
#endif

struct {
  uint8_t state = 0;
  uint8_t counter = 1;
  mutable uint8_t iteration = 0;
  unsigned long timer = 0;
  uint16_t delay_off = 200;
  uint16_t delay_on = 50;
} BlinkMode;

bool enable_notifications;
bool enable_hrs;
bool enable_dring;
uint8_t sleep_after_minutes;
bool manual_alarm_continuous;
uint8_t manual_alarm_discrete_count;
uint16_t battery_level_old = 0;

BLECharacteristic *notif = NULL;
BLECharacteristic *persistent = NULL;
BLEServer *pServer = NULL;

bool deviceConnected = false;
bool oldDeviceConnected = false;
bool INT_STATE = false;
unsigned long last_activity;
bool handle_update = false;

Preferences preferences;
BLEAdvertisementData advert;

void updatePersistentValues();
void dring(uint8_t value);
void abortDring();
void startWifiScan();
void connect_to_wifi();

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
          BlinkMode.iteration = 0;
          BlinkMode.state = 1;
        }
      } else if (uuid == ENABLE_HRS) {
        enable_hrs = value;
        digitalWrite(ENABLE_HRS_PIN, !enable_hrs);
        preferences.putBool("enable_hrs", enable_hrs);
      } else if (uuid == ENABLE_DRING) {
        enable_dring = value;
        digitalWrite(ENABLE_DRING_PIN, enable_dring);
        if (enable_dring == 0) abortDring();
        preferences.putBool("enable_dring", enable_dring);
      } else if (uuid == ENABLE_NOTIFICATIONS) {
        enable_notifications = value;
        preferences.putBool("enable_notifs", enable_notifications);
      } else if (uuid == SLEEP_AFTER_MINUTES) {
        sleep_after_minutes = value;
        preferences.putUChar("sleep_after", sleep_after_minutes);
#ifdef ENABLE_WIFI
      } else if (uuid == WIFI_PARAMS) {

        uint8_t net = value >> 5;
        uint8_t len = value & ~(224);
        char password[len];
        memcpy(password, data + 1, len);
        const char *ssid = WiFi.SSID(net).c_str();

        DEBUG_PRINTF("ssid:'%s' password:'%s'\n", ssid, password);

        preferences.putString("ssid", ssid);
        preferences.putString("password", password);

        connect_to_wifi();

      } else if (uuid == START_WIFI_SCAN) {
        WiFi.scanNetworks(true);
#endif
      } else if (uuid == MANUAL_ALARM_CONTINUOUS) {
        manual_alarm_continuous = value;
        if (manual_alarm_continuous == 1) abortDring();
        preferences.putBool("continuous", manual_alarm_continuous);
      } else if (uuid == MANUAL_ALARM_DISCRETE_COUNT) {
        preferences.putUChar("discrete_count", value);
        BlinkMode.counter = value;
      } else if (uuid == MANUAL_ALARM_DISCRETE_OFF_DELAY) {
        uint16_t delay;
        memcpy(&delay, data, 2);
        DEBUG_PRINTF("delay off=%u\n", delay);
        BlinkMode.delay_off = delay;
        preferences.putUShort("discrete_off", delay);
      } else if (uuid == MANUAL_ALARM_DISCRETE_ON_DELAY) {
        uint16_t delay;
        memcpy(&delay, data, 2);
        DEBUG_PRINTF("delay on=%u\n", delay);
        BlinkMode.delay_on = delay;
        preferences.putUShort("discrete_on", delay);
      }

      updatePersistentValues();
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

void IRAM_ATTR hrs_int() {
  static int start = 0;
  if (enable_hrs && (millis() - start) > 500UL) {
    INT_STATE = true;
    start = millis();
  }
}

void setup() {
  last_activity = millis();

  pinMode(ENABLE_HRS_PIN, OUTPUT);
  pinMode(ENABLE_DRING_PIN, OUTPUT);
  pinMode(MANUAL_ALARM_PIN, OUTPUT);
  pinMode(HRS_INPUT_PIN, INPUT_PULLDOWN);
  attachInterrupt(digitalPinToInterrupt(HRS_INPUT_PIN), hrs_int, RISING);

  gpio_hold_dis((gpio_num_t)ENABLE_HRS_PIN);
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
  enable_hrs = preferences.getBool("enable_hrs", false);
  enable_dring = preferences.getBool("enable_dring", false);
  enable_notifications = preferences.getBool("enable_notifs", false);
  sleep_after_minutes = preferences.getUChar("sleep_after", 5);
  manual_alarm_continuous = preferences.getBool("continuous", true);

  BlinkMode.counter = preferences.getUChar("discrete_count", 10);
  BlinkMode.delay_on = preferences.getUShort("discrete_on", DISCRETE_ON_DURATION);
  BlinkMode.delay_off = preferences.getUShort("discrete_off", 10);

  digitalWrite(ENABLE_HRS_PIN, !enable_hrs);
  digitalWrite(ENABLE_DRING_PIN, enable_dring);
  digitalWrite(MANUAL_ALARM_PIN, HIGH);
  delay(BlinkMode.delay_on);
  digitalWrite(MANUAL_ALARM_PIN, LOW);

  DEBUG_PRINTF("enable_hrs=%u enable_dring=%u enable_notifications=%u manual_alarm_continuous=%u sleep_after_minutes=%u manual_alarm_discrete_count=%u manual_alarm_discrete_interval_on=%u manual_alarm_discrete_interval_off=%u \n", enable_hrs, enable_dring, enable_notifications, manual_alarm_continuous, sleep_after_minutes, BlinkMode.counter, BlinkMode.delay_on, BlinkMode.delay_off);
  BLEDevice::init(DEVICE_NAME);
  pServer = BLEDevice::createServer();
  pServer->setCallbacks(new MyServerCallbacks());

  BLEService *alertService = pServer->createService(SERVICE_ALERT_UUID);
  BLEService *pService = pServer->createService(BLEUUID(SERVICE_UUID), 32);
  MyCallbacks *clbk = new MyCallbacks();

  createCharacteristic(pService, RGB_LED, (uint8_t)0, clbk);
  createCharacteristic(pService, MANUAL_ALARM, (uint8_t)0, clbk);
  createCharacteristic(pService, ENABLE_HRS, (uint8_t)enable_hrs, clbk);
  createCharacteristic(pService, ENABLE_DRING, (uint8_t)enable_dring, clbk);
  createCharacteristic(pService, ENABLE_NOTIFICATIONS, (uint8_t)enable_notifications, clbk);
  createCharacteristic(pService, SLEEP_AFTER_MINUTES, (uint8_t)sleep_after_minutes, clbk);
  createCharacteristic(pService, FIRMWARE_VERSION, FIRMWARE_VERSION_NUMBER, clbk);
  createCharacteristic(pService, MANUAL_ALARM_CONTINUOUS, (uint8_t)manual_alarm_continuous, clbk);
  createCharacteristic(pService, MANUAL_ALARM_DISCRETE_COUNT, (uint8_t)0, clbk);
  createCharacteristic(pService, MANUAL_ALARM_DISCRETE_OFF_DELAY, (uint8_t)0, clbk);
  createCharacteristic(pService, MANUAL_ALARM_DISCRETE_ON_DELAY, (uint8_t)0, clbk);

#ifdef ENABLE_WIFI
  createCharacteristic(pService, START_WIFI_SCAN, (uint8_t)0, clbk);
  createCharacteristic(pService, WIFI_PARAMS, (uint8_t)0, clbk);

  WiFi.onEvent(WiFiStationConnected, WiFiEvent_t::ARDUINO_EVENT_WIFI_STA_CONNECTED);
  WiFi.onEvent(WiFiGotIP, WiFiEvent_t::ARDUINO_EVENT_WIFI_STA_GOT_IP);
  WiFi.onEvent(WiFiStationDisconnected, WiFiEvent_t::ARDUINO_EVENT_WIFI_STA_DISCONNECTED);
  WiFi.onEvent(WiFiScanDone, WiFiEvent_t::ARDUINO_EVENT_WIFI_SCAN_DONE);
#endif

  persistent = createCharacteristic(pService, PERSISTENT, (uint8_t)0, clbk);

  notif = alertService->createCharacteristic(NOTIFICATION,
                                             BLECharacteristic::PROPERTY_READ | BLECharacteristic::PROPERTY_NOTIFY);
  BLE2902 *desc = new BLE2902();
  notif->addDescriptor(desc);

  pService->start();
  alertService->start();

  BLEAdvertising *pAdvertising = BLEDevice::getAdvertising();
  //pAdvertising->addServiceUUID(SERVICE_UUID);
  //pAdvertising->addServiceUUID(SERVICE_ALERT_UUID);
  pAdvertising->setScanResponse(true);

  pAdvertising->setMinPreferred(0x12);  // functions that help with iPhone connections issue
  // Minimum advertising interval for undirected and low duty cycle directed advertising.
  // Range: 0x0020 to 0x4000 Default: N = 0x0800 (1.28 second) Time = N * 0.625 msec Time Range: 20 ms to 10.24 sec
  pAdvertising->setMinInterval(ADVERTISING_MIN_INTERVAL);
  pAdvertising->setMaxInterval(ADVERTISING_MAX_INTERVAL);
  //advert.setManufacturerData(ADVERTISING_MANUFACTURER_DATA);

  updatePersistentValues();
  setAdvertisementData();

#ifdef ARDUINO_LOLIN_C3_PICO
  neopixelWrite(RGB_BUILTIN, RGB_BRIGHTNESS, RGB_BRIGHTNESS, RGB_BRIGHTNESS);
  delay(1000);
  neopixelWrite(RGB_BUILTIN, 0, 0, 0);
#endif
}

void setAdvertisementData() {
  BLEAdvertising *pAdvertising = BLEDevice::getAdvertising();
  //advert.setServiceData(BLEUUID(SERVICE_UUID), "SONNETTE");
  advert.setName("SONNETTE");
  //advert.setCompleteServices(BLEUUID(SERVICE_UUID));
  //advert.setManufacturerData(ADVERTISING_MANUFACTURER_DATA);
  pAdvertising->setAdvertisementData(advert);
  BLEDevice::startAdvertising();
}

void updatePersistentValues() {
  uint16_t batt_level = analogRead(ADC_IN_PIN);  // 0-4095
  DEBUG_PRINTF("batt_level=%u\n", batt_level);
  uint8_t flags = enable_hrs | (enable_dring << 1) | (enable_notifications << 2) | (manual_alarm_continuous << 3);
  uint8_t result[10];
  uint8_t version = FIRMWARE_VERSION_NUMBER;
  memcpy(result, (uint8_t*)&flags, 1);
  memcpy(result + 1, (uint8_t *)&version, 1);
  memcpy(result + 2, (uint8_t*)&sleep_after_minutes, 1);
  memcpy(result + 3, (uint8_t*)&(BlinkMode.counter), 1);
  memcpy(result + 4, (uint8_t*)&(BlinkMode.delay_on), 2);
  memcpy(result + 6, (uint8_t*)&(BlinkMode.delay_off), 2);
  memcpy(result + 8, (uint8_t*)&batt_level, 2);
  persistent->setValue(result, 10);
}

void notifyDetection() {
  uint8_t result[1] = { 0 };
  notif->setValue(result, 1);
  notif->notify();
}

void notifyDeepSleep() {
  uint8_t result[1] = { 1 };
  notif->setValue(result, 1);
  notif->notify();
}

void notifyBatteryLevel(uint16_t batt_level) {
  DEBUG_PRINTF("Notify battery level change %u\n", batt_level);
  uint8_t mode = 2;
  uint8_t result[3];
  memcpy(result, (uint8_t *)&mode, 1);
  memcpy(result + 1, (uint8_t *)&batt_level, 2);
  notif->setValue(result, 3);
  notif->notify();
}

#ifdef ENABLE_WIFI
void connect_to_wifi() {
  //static unsigned int wifi_timer = millis();

  String ssid = preferences.getString("ssid", "");
  String password = preferences.getString("password", "");

  WiFi.setAutoReconnect(false);
  WiFi.disconnect(true);
  WiFi.begin(ssid, password);

  // while (WiFi.status() != WL_CONNECTED) {
  //   DEBUG_PRINTF(".");
  //   delay(500);

  //   if ((millis() - wifi_timer) > WIFI_TIMEOUT) {
  //     //notifyWifiConnectionStatus(3);
  //   }
  // }
}

void WiFiStationConnected(WiFiEvent_t event, WiFiEventInfo_t info) {
  DEBUG_PRINTLN("WiFiStationConnected to AP!");
  notifyWifiConnectionStatus(0);
}

void WiFiGotIP(WiFiEvent_t event, WiFiEventInfo_t info) {
  DEBUG_PRINTLN("WiFiGotIP from AP!");
  notifyWifiConnectionStatus(1);
}

void WiFiStationDisconnected(WiFiEvent_t event, WiFiEventInfo_t info) {
  DEBUG_PRINTLN("WiFiStationDisconnected from AP!");
  //notifyWifiConnectionStatus(2);
}

void notifyNetworksScanResult(int16_t networksFound) {
  char result[512];
  int16_t position = 0;
  uint8_t n = 0;
  uint8_t mode = 3;
  uint8_t *modePtr = &mode;

  DEBUG_PRINTF("Found %u networks\n", networksFound);

  memcpy(result, modePtr, 1);
  position++;

  uint8_t sortedAccessPoints[networksFound];
  sortWifiAccessPoints(networksFound, sortedAccessPoints);

  while (position < 512 && n < networksFound && n < 8) {
    const char *ssid = WiFi.SSID(sortedAccessPoints[n]).c_str();
    uint16_t len = min(strlen(ssid), 31U);

    if (len > 0U) {
      DEBUG_PRINTF("Found network %u ssid size:%u '%s'\n", n, len, ssid);

      uint8_t mask = (n << 5) | len;
      uint8_t *maskPtr = &mask;

      memcpy(result + position, maskPtr, 1);
      memcpy(result + position + 1, ssid, len);

      position += len + 1;
    }

    n++;
  }

  notif->setValue((uint8_t *)result, position);
  notif->notify();
}

void notifyWifiConnectionStatus(uint8_t status) {
  uint8_t result[2] = { 4, status };
  notif->setValue(result, 2);
  notif->notify();
}

void sortWifiAccessPoints(uint8_t n, uint8_t a[]) {
  for (uint8_t i = 0; i < n; ++i) {
    int8_t k;
    for (k = i - 1; (k >= 0) && (WiFi.RSSI(i) > WiFi.RSSI(a[k])); k--) {
      a[k + 1] = a[k];
    }
    a[k + 1] = i;
  }
}
#endif

void loop() {
  // put your main code here, to run repeatedly:
  static unsigned long battery_timer = 0;

  if (millis() - battery_timer > BATTERY_NOTIFICATION_PERIODIC_DELAY) {
    uint16_t batt_level = round(analogRead(ADC_IN_PIN) / 10) * 10;
    if (batt_level != battery_level_old) {
      notifyBatteryLevel(batt_level);
      battery_level_old = batt_level;
    }

    battery_timer = millis();
  }

  if (deviceConnected && enable_notifications && INT_STATE == true) {
    DEBUG_PRINTLN("interrupt !!");
    notifyDetection();

    INT_STATE = false;
  }
  // disconnecting
  if (!deviceConnected && oldDeviceConnected) {
    delay(500);                   // give the bluetooth stack the chance to get things ready
    pServer->startAdvertising();  // restart advertising
    DEBUG_PRINTLN("restart advertising");
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
    DEBUG_PRINTF("Go to sleep after %u minutes of inactivity.", sleep_after_minutes);
    go_to_sleep();
  }

  handleDring();
}

void handleDring() {
  if (BlinkMode.state == 1) {
    dring(HIGH);

    BlinkMode.timer = millis();
    BlinkMode.state = 2;
  } else if (BlinkMode.state == 2) {
    if (millis() - BlinkMode.timer > BlinkMode.delay_on) {
      dring(LOW);

      BlinkMode.iteration = BlinkMode.iteration + 1;
      BlinkMode.timer = millis();
      BlinkMode.state = 3;
    }
  } else if (BlinkMode.state == 3) {
    if (millis() - BlinkMode.timer > BlinkMode.delay_off) {

      if (BlinkMode.iteration < BlinkMode.counter) {
        BlinkMode.state = 1;
      } else {
        BlinkMode.state = 0;
        BlinkMode.iteration = 0;
        BlinkMode.timer = 0;
      }
    }
  }
}

void WiFiScanDone(WiFiEvent_t event, WiFiEventInfo_t info) {
  DEBUG_PRINTLN("WiFiScanDone");

  int16_t WiFiScanStatus = WiFi.scanComplete();
  if (WiFiScanStatus < 0) {  // it is busy scanning or got an error
    if (WiFiScanStatus == WIFI_SCAN_FAILED) {
      DEBUG_PRINTLN("WiFi Scan has failed. Starting again.");
      notifyWifiConnectionStatus(4);
    }
    // other option is status WIFI_SCAN_RUNNING - just wait.
  } else {  // Found Zero or more Wireless Networks
    notifyNetworksScanResult(WiFiScanStatus);
  }
}

void abortDring() {
  if (BlinkMode.state != 0) {
    BlinkMode.state = 0;
    BlinkMode.iteration = 0;
    dring(LOW);
  }
}

void go_to_sleep() {
  notifyDeepSleep();
  detachInterrupt(digitalPinToInterrupt(HRS_INPUT_PIN));

#ifdef ARDUINO_LOLIN_C3_PICO
  neopixelWrite(RGB_BUILTIN, 0, RGB_BRIGHTNESS, 0);
  delay(500);
  neopixelWrite(RGB_BUILTIN, 0, 0, 0);
#endif

  preferences.end();

  gpio_deep_sleep_hold_en();
  gpio_hold_en((gpio_num_t)ENABLE_HRS_PIN);
  gpio_hold_en((gpio_num_t)ENABLE_DRING_PIN);

  const gpio_config_t config = {
    .pin_bit_mask = BIT(WAKEUP_PIN),
    .mode = GPIO_MODE_INPUT,
  };

  ESP_ERROR_CHECK(gpio_config(&config));
  ESP_ERROR_CHECK(esp_deep_sleep_enable_gpio_wakeup(BIT(WAKEUP_PIN), DEFAULT_WAKEUP_LEVEL));
  DEBUG_PRINTF("Enabling GPIO wakeup on pin GPIO%u\n", WAKEUP_PIN);

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

#endif
