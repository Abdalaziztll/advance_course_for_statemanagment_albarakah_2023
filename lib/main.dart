import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_demo/firebase_options.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();

    return Scaffold(
      body: Center(
          child: Column(
        children: [
          TextField(
            controller: email,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
          TextField(
            controller: password,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
          ElevatedButton(
              onPressed: () async {
                try {
                // await FirebaseAuth.instance
                //     .signInWithPopup(GoogleAuthProvider());

                  final credential =
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: email.text,
                    password: password.text,
                  );
                  print("Sing in Done");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const ProductPage();
                      },
                    ),
                  );
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    print('No user found for that email.');
                  } else if (e.code == 'wrong-password') {
                    print('Wrong password provided for that user.');
                  }
                }
              },
              child: Text("Google Auth")),
        ],
      )),
    );
  }
}

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles();
              File file;
              if (result != null) {
                file = File.fromRawPath(result.files.first.bytes!);
                final storage = FirebaseStorage.instanceFor(
                    bucket: "gs://hello-2ac00.appspot.com");
                await storage.ref("new_file").putFile(file);
              }
            },
            child: Text("Uplode File")),
      ),
    );
  }
}
