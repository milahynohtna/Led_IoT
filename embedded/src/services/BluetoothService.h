#ifndef BLUETOOTHSERVICE_H
#define BLUETOOTHSERVICE_H

#include <BluetoothSerial.h>

class BluetoothService {
public:
    void begin(const char* deviceName);
    bool available();
    uint8_t readByte();
private:
    BluetoothSerial SerialBT;
};

#endif
