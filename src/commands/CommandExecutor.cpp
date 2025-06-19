#include "CommandExecutor.h"
#include <Arduino.h>

CommandExecutor::CommandExecutor(Led& led1, Led& led2)
    : led(led1), anotherLed(led2) {}

void CommandExecutor::execute(CommandType cmd) {
    switch (cmd) {
        case CommandType::LED_ON:
            led.on();
            Serial.println("LED ON command executed");
            break;
        case CommandType::LED_OFF:
            led.off();
            Serial.println("LED OFF command executed");
            break;
        case CommandType::ANOTHER_LED_ON:
            anotherLed.on();
            Serial.println("LED 2 ON command executed");
            break;
        case CommandType::ANOTHER_LED_OFF:
            anotherLed.off();
            Serial.println("LED 2 OFF command executed");
            break;
        default:
            Serial.println("Unknown command");
            break;
    }
}
