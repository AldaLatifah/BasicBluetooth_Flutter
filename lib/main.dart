import 'package:flutter/material.dart';
import 'package:flutter_getx_reactive_ble/BLEController.dart';
import 'package:flutter_getx_reactive_ble/detail_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final BleController c = Get.put(BleController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BLE TEST')),
      body: Column(children: [
        SizedBox(height: 50),
        Obx((() => Text('${c.status}'))),
        SizedBox(height: 50),
        Obx((() => Text('${c.temperature}'))),
        SizedBox(height: 50),
        Obx(((() => Container(
            child: c.status != 'connected'
                ? ElevatedButton(onPressed: c.connect, child: Text("CONNECt"))
                : null)))),
        ElevatedButton(
            onPressed: () {
              Get.to(DetailPage(angka: c.temperature.toString()));
            },
            child: Text("Terima")),
      ]),
    );
  }
}
