import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_as_statemanagement/controller/counter.dart';
import 'package:get_as_statemanagement/view/remot_view.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

  late WebSocketChannel channel;
void main()async {
  final wsUrl = Uri.parse('wss://socketsbay.com/wss/v2/1/demo/');

  
  channel = WebSocketChannel.connect(wsUrl);
 await channel.ready;
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});
  var contoller = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {
                  contoller.add();
                },
                icon: Icon(Icons.add)),
            Obx(() => Text(contoller.count.toString())),
            IconButton(
                onPressed: () {
                  contoller.minus();
                  Get.to(RemoteDataView());
                },
                icon: Icon(Icons.minimize))
          ],
        ),
      ),
    );
  }
}
