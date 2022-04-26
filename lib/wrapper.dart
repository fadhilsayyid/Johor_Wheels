import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:johor_wheels/screens/Home/components/body.dart';
import 'package:johor_wheels/screens/Home/home_screen.dart';
// import 'package:johor_wheels/screens/Login/login_screen.dart';
import 'package:johor_wheels/screens/Welcome/welcome_screen.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User firebaseUser = Provider.of<User>(context);
    return (firebaseUser == null) ? WelcomeScreen() : MainPage(firebaseUser);
  }
}
