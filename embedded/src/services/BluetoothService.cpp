#include "BluetoothService.h"

void BluetoothService::begin(const char* deviceName) {
    SerialBT.begin(deviceName);
}

bool BluetoothService::available() {
    return SerialBT.available();
}

uint8_t BluetoothService::readByte() {
    return SerialBT.read();
}
