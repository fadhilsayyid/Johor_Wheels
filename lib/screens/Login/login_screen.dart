import 'package:flutter/material.dart';
import 'package:johor_wheels/screens/Login/components/body.dart';
import 'package:johor_wheels/screens/Welcome/welcome_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: true,
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back_ios),
      //     onPressed: () => exit(0),
      //     color: Colors.black87,
      //   ),
      // ),
      body: Body(),
    );
  }
}
