import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothService {
  final FlutterBluetoothSerial _bluetooth = FlutterBluetoothSerial.instance;

  Future<void> enableBluetooth() async {
    if (!(await _bluetooth.isEnabled ?? false)) {
      await _bluetooth.requestEnable();
    }
  }

  Stream<BluetoothDiscoveryResult> startDiscovery() {
    return _bluetooth.startDiscovery();
  }

  Future<List<BluetoothDevice>> getBondedDevices() async {
    return await _bluetooth.getBondedDevices();
  }

  Future<BluetoothConnection> connect(BluetoothDevice device) async {
    return await BluetoothConnection.toAddress(device.address);
  }

  Future<void> disconnect(BluetoothConnection connection) async {
    connection.finish();
  }
}
