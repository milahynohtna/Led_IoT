import 'dart:typed_data';

import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get/get.dart';

import '../../services/bluetooth_service.dart';

class BluetoothController extends GetxController {
  final BluetoothService bluetoothService;
  BluetoothConnection? connection;
  var isConnected = false.obs;

  BluetoothController(this.bluetoothService);

  Future<void> initBluetooth() async {
    await bluetoothService.enableBluetooth();
  }

  Future<List<BluetoothDevice>> getBondedDevices() async {
    return await bluetoothService.getBondedDevices();
  }

  Future<void> connectTo(BluetoothDevice device) async {
    connection = await bluetoothService.connect(device);
    isConnected.value = true;
  }

  void sendByte(int byte) {
    if (connection != null && connection!.isConnected) {
      connection!.output.add(Uint8List.fromList([byte]));
    }
  }

  void disconnect() {
    if (connection != null && connection!.isConnected) {
      bluetoothService.disconnect(connection!);
      isConnected.value = false;
    }
  }
}
