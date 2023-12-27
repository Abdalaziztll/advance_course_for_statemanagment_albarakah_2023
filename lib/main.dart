import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:value_notifier_example/counter_manager/counter_manager.dart';
import 'package:value_notifier_example/notifier_value/named_value.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Counter(),
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  NamedValue name = NamedValue('hello');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondPage(named: name),
                  ),
                );
              },
              icon: Icon(Icons.arrow_back))
        ],
        title: TextField(
          onChanged: (value) {
            name.value = value;
          },
          decoration: InputDecoration(border: OutlineInputBorder()),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: name,
        builder: (context, val, _) {
          return Center(
            child: Column(
              children: [
                Text(val),
                Divider(),
                Text(context.watch<Counter>().value.toString())
              ],
            ),
          );
        },
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  SecondPage({super.key, required this.named});

  final NamedValue named;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                context.read<Counter>().decreament();
              },
              icon: Icon(Icons.minimize))
        ],
        title: TextField(
          onChanged: (value) {
            named.value = value;
          },
          decoration: InputDecoration(border: OutlineInputBorder()),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: named,
        builder: (context, val, _) {
          return Center(
            child: Column(
              children: [
                Text(val),
                Divider(),
                Text(context.watch<Counter>().value.toString())
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        context.read<Counter>().increament();
      }),
    );
  }
}
