#include <Arduino.h>
#include "components/Led.h"
#include "services/BluetoothService.h"
#include "commands/CommandParser.h"

constexpr int ledPin = 2;

Led led(ledPin);
BluetoothService bluetooth;

void setup() {
    Serial.begin(115200);
    bluetooth.begin("ESP32_LED");
    Serial.println("Bluetooth ready");
}

void loop() {
    if (bluetooth.available()) {
        uint8_t byteCommand = bluetooth.readByte();
        CommandType cmd = CommandParser::parse(byteCommand);

        switch (cmd) {
            case CommandType::LED_ON:
                led.on();
                Serial.println("LED ON command executed");
                break;
            case CommandType::LED_OFF:
                led.off();
                Serial.println("LED OFF command executed");
                break;
            default:
                Serial.println("Unknown command");
                break;
        }
    }
}
