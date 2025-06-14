import 'package:flutter_led/services/bluetooth_service.dart';
import 'package:get/get.dart';

import '../../../controllers/bluetooth_controller.dart';
import '../../../controllers/permission_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PermissionController>(() => PermissionController());
    Get.lazyPut<BluetoothService>(() => BluetoothService());
    Get.lazyPut<BluetoothController>(
      () => BluetoothController(Get.find<BluetoothService>()),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(Get.find<BluetoothController>()),
    );
  }
}
