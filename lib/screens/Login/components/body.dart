import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:johor_wheels/auth_services.dart';
import 'package:johor_wheels/screens/Home/home_screen.dart';
import 'package:johor_wheels/screens/Login/components/background.dart';
import 'package:johor_wheels/screens/Signup/signup_screen.dart';
import 'package:johor_wheels/components/already_have_an_account_acheck.dart';
import 'package:johor_wheels/components/rounded_button.dart';
import 'package:johor_wheels/components/rounded_input_field.dart';
import 'package:johor_wheels/components/rounded_password_field.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Body extends StatelessWidget {
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");

  Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User firebaseUser = Provider.of<User>(context);
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.09),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
              emailController: emailController,
            ),
            RoundedPasswordField(
              onChanged: (value) {},
              passwordController: passwordController,
            ),
            RoundedButton(
                text: "Log in",
                press: () {
                  AuthServices.signIn(
                      emailController.text, passwordController.text);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => HomeScreen(firebaseUser)));
                }),
            SizedBox(height: size.height * 0.02),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
