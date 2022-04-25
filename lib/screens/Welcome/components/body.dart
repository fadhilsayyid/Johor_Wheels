import 'package:flutter/material.dart';
import 'package:johor_wheels/screens/Welcome/components/background.dart';
import 'package:johor_wheels/screens/Login/login_screen.dart';
import 'package:johor_wheels/screens/Signup/signup_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        children: <Widget>[
          SizedBox(height: 145),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
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
                        style: TextStyle(fontSize: 20, fontFamily: 'Campton')),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.symmetric(horizontal: 40, vertical: 20)),
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
          SizedBox(height: size.height * 0.03),
          SizedBox(
            width: 350,
            child: TextButton(
              child: Text("I am new, sign me up",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Campton',
                      fontWeight: FontWeight.bold)),
              style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 40, vertical: 20)),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Color(0xFF7499AC)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(
                            width: 3.0,
                            color: Color(0xFF7499AC),
                          )))),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()));
              },
            ),
          ),
          SizedBox(height: size.height * 0.03),
          RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              text: 'By logging in or registering, you agree to our ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 13.0,
              ),
              children: <TextSpan>[
                TextSpan(
                    text: ' Terms of Service',
                    style: TextStyle(
                        color: Color(0xFF2B8DAA),
                        fontSize: 13.0,
                        fontWeight: FontWeight.bold)),
                TextSpan(
                    text: ' and ',
                    style: TextStyle(color: Colors.black, fontSize: 13.0)),
                TextSpan(
                    text: ' Privacy Policy.',
                    style: TextStyle(
                        color: Color(0xFF2B8DAA),
                        fontSize: 13.0,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
