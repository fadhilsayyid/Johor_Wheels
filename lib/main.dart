import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:johor_wheels/screens/Welcome/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Home",
      home: WelcomeScreen(),
    );
  }
}
