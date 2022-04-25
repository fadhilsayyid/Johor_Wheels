import 'package:flutter/material.dart';
import 'package:johor_wheels/screens/Welcome/welcome_screen.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover),
      ),
      padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // IconButton(
          //     onPressed: () {
          //       Navigator.push(context,
          //           MaterialPageRoute(builder: (context) => WelcomeScreen()));
          //     },
          //     icon: Icon(Icons.arrow_back_ios)),
          SizedBox(),
          SizedBox(
            child: Column(
              children: <Widget>[
                Text(
                  'JOHOR WHEELS',
                  style: TextStyle(
                      fontFamily: 'BebasNeue',
                      color: Colors.white,
                      fontSize: 100.0),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Johor Local Bus Route Finder',
                  style: TextStyle(
                      fontFamily: 'Campton',
                      color: Colors.white,
                      fontSize: 18.0),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          child,
        ],
      ),
    );
  }
}
