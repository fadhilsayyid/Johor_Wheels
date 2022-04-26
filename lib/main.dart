import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:johor_wheels/auth_services.dart';
// import 'package:johor_wheels/screens/Welcome/welcome_screen.dart';
import 'package:johor_wheels/wrapper.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthServices.firebaseUserStream,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Home",
        home: Wrapper(),
      ),
    );
  }
}
