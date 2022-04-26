import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:johor_wheels/screens/Home/components/body.dart';
import 'package:johor_wheels/screens/Home/components/map_screen.dart';

class HomeScreen extends StatelessWidget {
  final User user;

  HomeScreen(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: MapScreen()); // Scaffold
  }
}
