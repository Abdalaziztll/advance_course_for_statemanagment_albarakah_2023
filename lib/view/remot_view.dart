import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_as_statemanagement/controller/remote_conroller.dart';
import 'package:get_as_statemanagement/view/web_socket.dart';

class RemoteDataView extends StatefulWidget {
  RemoteDataView({super.key});

  @override
  State<RemoteDataView> createState() => _RemoteDataViewState();
}

class _RemoteDataViewState extends State<RemoteDataView> {
  var contoller = Get.put(RemoteData());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => contoller.state.value == States.INIT
              ? Text('Please Click ')
              : contoller.state.value == States.LOADING
                  ? CircularProgressIndicator()
                  : contoller.state.value == States.SUCCESS
                      ? Text(contoller.result.toString())
                      : contoller.state.value == States.ERROR
                          ? Text('There is an Error')
                          : FlutterLogo(),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          contoller.fetchData();
        });
        Get.to(WebSocketView());
      }),
    );
  }
}
