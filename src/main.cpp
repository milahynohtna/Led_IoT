#include <Arduino.h>
#include "components/Led.h"
#include "services/BluetoothService.h"
#include "commands/CommandParser.h"
#include "commands/CommandExecutor.h"

constexpr int ledPin = 2;
constexpr int anotherLedPin = 4;


Led led(ledPin);
Led anotherLed(anotherLedPin);
BluetoothService bluetooth;
CommandExecutor executor(led, anotherLed);

void setup() {
    Serial.begin(115200);
    bluetooth.begin("ESP32_LED");
    Serial.println("Bluetooth ready");
}

void loop() {
    if (bluetooth.available()) {
        uint8_t byteCommand = bluetooth.readByte();
        CommandType cmd = CommandParser::parse(byteCommand);

        executor.execute(cmd);
    }
}
