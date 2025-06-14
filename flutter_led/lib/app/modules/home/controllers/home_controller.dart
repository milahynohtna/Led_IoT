// lib/controllers/home_controller.dart
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get/get.dart';

import '../../../controllers/bluetooth_controller.dart';
import '../../../controllers/permission_controller.dart';
import '../../../data/enums/command.dart';

class HomeController extends GetxController {
  final BluetoothController bluetoothController;
  var devices = <BluetoothDevice>[].obs;
  var isLightOn = false.obs;

  HomeController(this.bluetoothController);

  @override
  void onInit() {
    super.onInit();

    final permissionController = Get.find<PermissionController>();
    permissionController.requestBluetoothPermissions().then((_) async {
      await loadBondedDevices(); // ini penting agar list device terisi
      final esp32 = devices.firstWhereOrNull((d) => d.name == 'ESP32_LED');
      if (esp32 != null) {
        await connect(esp32);
      }
    });
  }

  Future<void> loadBondedDevices() async {
    final bonded = await bluetoothController.getBondedDevices();
    devices.assignAll(bonded);
  }

  Future<void> connect(BluetoothDevice device) async {
    await bluetoothController.connectTo(device);
  }

  void turnOnLed() {
    _sendCommand(Command.ledOn);
    isLightOn.toggle();
  }

  void turnOffLed() {
    _sendCommand(Command.ledOff);
    isLightOn.toggle();
  }

  void _sendCommand(Command command) {
    bluetoothController.sendByte(command.byteCode);
  }
}
