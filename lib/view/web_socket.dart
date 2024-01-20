import 'package:flutter/material.dart';
import 'package:get_as_statemanagement/main.dart';

class WebSocketView extends StatelessWidget {
  const WebSocketView({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: StreamBuilder(
        stream: channel.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data.toString());
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
