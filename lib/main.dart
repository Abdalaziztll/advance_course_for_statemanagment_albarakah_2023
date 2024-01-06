import 'package:clean_service_layer/model/entity_model.dart';
import 'package:clean_service_layer/remote_data/generic_get_method.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:HomePage()
    );
  }
}


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: IconButton(onPressed: ()
      async{
      await  getData<User>(endpoint: 'https://jsonplaceholder.typicode.com/users/1', fromMap:User.fromMap());
      }, icon: Icon(Icons.send)),),
    );
  }
}