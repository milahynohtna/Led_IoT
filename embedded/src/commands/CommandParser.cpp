#include "CommandParser.h"

CommandType CommandParser::parse(uint8_t byteCode) {
    switch (byteCode) {
        case 0x01:
            return CommandType::LED_ON;
        case 0x02:
            return CommandType::LED_OFF;
        default:
            return CommandType::UNKNOWN;
    }
}
