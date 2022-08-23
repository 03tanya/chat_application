import 'package:chat_app/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await Firebase.initializeApp(
  //     options: const FirebaseOptions(
  //   apiKey: "AIzaSyARFMhAHJsZPMMYe8tJvUUP9wlX5LxgF08",
  //   appId: "1:585865978292:web:4866a375d16d6b401112e1",
  //   messagingSenderId: "585865978292",
  //   projectId: "chatapp-ae3ed",
  // ));
  runApp(const MyApp()); 
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'chatApp',
      theme: ThemeData(
        primaryColor: Colors.orange[900],
      ),
      home: const RegisterScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
