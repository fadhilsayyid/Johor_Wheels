import 'package:flutter/material.dart';
import 'package:johor_wheels/screens/Home/components/map_screen.dart';
// import 'package:johor_wheels/screens/Home/home_screen.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            MapScreen(),
          ],
        ),
      ),
    );
  }
}
