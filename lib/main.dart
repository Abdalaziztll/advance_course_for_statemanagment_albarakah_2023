import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Supabase.initialize(
    url: 'https://iyidecmdyhivdqjjdczx.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml5aWRlY21keWhpdmRxampkY3p4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAxNjIyMDIsImV4cCI6MjAxNTczODIwMn0.-SSo8FqwiGpWdaQ0TdCikiQY374vE0BT1EzYk90pYRg',
  );
  runApp(const MyApp());

 
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyPage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
  }

  List<IconData> list = [
    Icons.home,
    Icons.youtube_searched_for,
    Icons.reddit,
    Icons.facebook
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Flow(
        delegate: HorizantalDelegate(controller: controller),
        children: List.generate(
          list.length,
          (index) => Padding(
            padding: const EdgeInsets.all(20),
            child: FloatingActionButton(
              onPressed: () {
                controller.status == AnimationStatus.completed
                    ? controller.reverse()
                    : controller.forward();
              },
              child: Icon(list[index]),
            ),
          ),
        ),
      ),
    );
  }
}

class HorizantalDelegate extends FlowDelegate {
  HorizantalDelegate({required this.controller}) : super(repaint: controller);

  final AnimationController controller;

  @override
  void paintChildren(FlowPaintingContext context) {
    var size = context.getChildSize(0);

    for (var i = 0; i < context.childCount; ++i) {
      context.paintChild(i,
          transform: Matrix4.translationValues(
              i * size!.width * controller.value,
              i * size!.width * controller.value,
              0));
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    return false;
  }
}

class MyPage extends StatelessWidget {
  MyPage({super.key});

  final stream = supabase.from('room').stream(primaryKey: ['id']);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<Map>>(
        stream: stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Text(snapshot.data.toString()),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
