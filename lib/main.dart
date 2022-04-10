import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:johor_wheels/login.dart';
import 'package:johor_wheels/registration.dart';

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
      home: myHomePage(),
    );
  }
}

// ignore: camel_case_types
class myHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        child: Stack(
          children: <Widget>[
            Container(
              constraints: BoxConstraints.expand(),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/background.jpg"),
                    fit: BoxFit.cover),
              ),
              padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 50.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 50.0,
                  ),
                  Text(
                    'JOHOR WHEELS',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 65.0),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    'Johor Local Bus Route Finder',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18.0),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            MyStatelessWidget()
          ],
        ),
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 35.0, right: 35.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(18.0),
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xFF2B8DAA),
                          Color(0xFF7499AC),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 350,
                  child: TextButton(
                    child: Text("Log in",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.all(15)),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder())),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          SizedBox(
            width: 350,
            child: TextButton(
              child: Text("I'm new, sign me up",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              style: ButtonStyle(
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Color(0xFF7499AC)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(
                            width: 3.0,
                            color: Color(0xFF7499AC),
                          )))),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()));
              },
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              text: 'By logging in or registering, you agree to our ',
              style: TextStyle(color: Colors.black, fontSize: 13.0),
              children: <TextSpan>[
                TextSpan(
                    text: ' Terms of Service',
                    style: TextStyle(color: Color(0xFF2B8DAA), fontSize: 13.0)),
                TextSpan(
                    text: ' and ',
                    style: TextStyle(color: Colors.black, fontSize: 13.0)),
                TextSpan(
                    text: ' Privacy Policy.',
                    style: TextStyle(color: Color(0xFF2B8DAA), fontSize: 13.0)),
              ],
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
        ],
      ),
    );
  }
}
