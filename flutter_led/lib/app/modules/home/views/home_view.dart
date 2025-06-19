import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody());
  }

  Column _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildConnectStatus(),
        Spacer(),
        Obx(
          () =>
              !controller.bluetoothController.isConnected.value
                  ? _buildChooseDevice()
                  : _buildControlLedButton(),
        ),
        Spacer(),
        Text(
          'Created by Anthony Halim (2025)',
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }

  Obx _buildControlLedButton() {
    return Obx(() {
      return Center(
        child:
            controller.isLightOn.value
                ? IconButton(
                  onPressed: () => controller.turnOnLed(),
                  icon: Icon(Icons.lightbulb, size: 200),
                )
                : IconButton(
                  onPressed: () => controller.turnOffLed(),
                  icon: Icon(CupertinoIcons.lightbulb_slash, size: 200),
                ),
      );
    });
  }

  Expanded _buildChooseDevice() {
    return Expanded(
      child: Obx(
        () => ListView.builder(
          itemCount: controller.devices.length,
          itemBuilder: (context, index) {
            final device = controller.devices[index];
            return ListTile(
              title: Text(device.name ?? device.address),
              subtitle: Text(device.address),
              onTap: () async {
                await controller.connect(device);
              },
            );
          },
        ),
      ),
    );
  }

  Obx _buildConnectStatus() {
    return Obx(() {
      final isConnected = controller.bluetoothController.isConnected.value;
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(() {
          return Text(
            controller.bluetoothController.isConnected.value
                ? 'Terhubung ke ESP32 ✅'
                : 'Belum terhubung ❌',
            style: TextStyle(
              fontSize: 16,
              color: isConnected ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
            ),
          );
        }),
      );
    });
  }

  AppBar _buildAppBar() {
    return AppBar(
      title:
          controller.bluetoothController.isConnected.value
              ? Text('')
              : Text('LED Command Center'),
    );
  }
}
