#ifndef COMMANDPARSER_H
#define COMMANDPARSER_H

#include <stdint.h> // untuk uint8_t

enum class CommandType {
    LED_ON,
    LED_OFF,
    ANOTHER_LED_ON,
    ANOTHER_LED_OFF,
    UNKNOWN
};

class CommandParser {
public:
    static CommandType parse(uint8_t byteCode);
};

#endif