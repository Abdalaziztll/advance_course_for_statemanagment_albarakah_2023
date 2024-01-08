// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:bloc_consumer_example/bloc/laptop_bloc.dart';
import 'package:bloc_consumer_example/config/di.dart';
import 'package:bloc_consumer_example/model/laptop_model.dart';
import 'package:bloc_consumer_example/model/list_of_laptop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LaptopBloc()..add(GetAllLaptop()),
      child: Builder(builder: (context) {
        return Scaffold(
          body: BlocConsumer<LaptopBloc, LaptopState>(
            listener: (context, state) {
              if (state is SuccessLaptopsFetching) {
                ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                  content: Text('Remote Date Source'),
                  backgroundColor: Colors.green,
                ));
              } else if (state is OfflineDataStorage) {
                ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                  content: Text('Local Date Source'),
                  backgroundColor: Colors.blue,
                ));
              }
            },
            builder: (context, state) {
              if (state is SuccessLaptopsFetching) {
                return ListView.builder(
                  itemCount: state.laptops.laptops.length,
                  itemBuilder: (context, index) => ListTile(
                    leading: CircleAvatar(
                      child: Image.network(
                        state.laptops.laptops[index].image,
                        errorBuilder: (context, error, stackTrace) {
                          return FlutterLogo();
                        },
                      ),
                    ),
                    title: Text(state.laptops.laptops[index].brand),
                  ),
                );
              } else if (state is OfflineDataStorage) {
                return Center(
                    child: ListView.builder(
                  itemCount: state.laptops.length,
                  itemBuilder: (context, index) => ListTile(
                    leading: CircleAvatar(
                      child: Image.network(
                        state.laptops[index].image,
                        errorBuilder: (context, error, stackTrace) {
                          return FlutterLogo();
                        },
                      ),
                    ),
                    title: Text(state.laptops[index].brand),
                  ),
                ));
              
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        );
      }),
    );
  }
}
