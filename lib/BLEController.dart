import 'dart:convert';

import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:flutter/material.dart';

class BleController {
  final frb = FlutterReactiveBle();
  late StreamSubscription<ConnectionStateUpdate> connection;
  late QualifiedCharacteristic rx;
  RxString status = 'not connected'.obs;
  RxString temperature = ' '.obs;

  void connect() async {
    status.value = 'connecting...';
    print("tes");
    connection = frb.connectToDevice(id: '8C:AA:B5:85:B0:3A').listen((state) {
      print(state.connectionState);
      if (state.connectionState == DeviceConnectionState.connected) {
        status.value = 'Connected!';

        rx = QualifiedCharacteristic(
            serviceId: Uuid.parse("4fafc201-1fb5-459e-8fcc-c5c9c331914b"),
            characteristicId:
                Uuid.parse("beb5483e-36e1-4688-b7f5-ea07361b26a8"),
            deviceId: '8C:AA:B5:85:B0:3A');

        print("tes");
        print(rx);

        frb.writeCharacteristicWithResponse(rx, value: utf8.encode("test"));

        frb.subscribeToCharacteristic(rx).listen((data) {
          print("tes subscribe");
          temperature.value = String.fromCharCodes(data);

          print(temperature.value);
        });
      }
    });
    // frb.connectToDevice(id: '8C:AA:B5:85:B0:3A').listen((state) {
    //   print("tes lagi");
    //   print(state.connectionState);
    //   if (state.connectionState == DeviceConnectionState.connected) {
    //     status.value = 'connected!';

    //     print(state.connectionState);
    //     // get rx

    // print(rx);
    // // subscribe to rx

    // final response = await frb.readCharacteristic(rx);
    // print(response);

    // print("tes euy");

    // await frb.writeCharacteristicWithResponse(rx, value: [19029181020]);

    //   }
    // });
  }
}
