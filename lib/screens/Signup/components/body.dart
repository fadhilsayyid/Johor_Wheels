import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:johor_wheels/auth_services.dart';
import 'package:johor_wheels/screens/Login/login_screen.dart';
import 'package:johor_wheels/screens/Signup/components/background.dart';
import 'package:johor_wheels/Screens/Signup/components/or_divider.dart';
import 'package:johor_wheels/Screens/Signup/components/social_icon.dart';
import 'package:johor_wheels/components/already_have_an_account_acheck.dart';
import 'package:johor_wheels/components/rounded_button.dart';
import 'package:johor_wheels/components/rounded_input_field.dart';
import 'package:johor_wheels/components/rounded_password_field.dart';
import 'package:johor_wheels/screens/Welcome/welcome_screen.dart';
import 'package:provider/provider.dart';

import '../../../services/auth_services.dart';

// ignore: must_be_immutable
class Body extends StatelessWidget {
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.03),
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
              text: "Sign up",
              press: () {
                final String email = emailController.text.trim();
                final String password = passwordController.text.trim();

                if (email.isEmpty) {
                  print("Email is Empty");
                } else {
                  if (password.isEmpty) {
                    print("Password is Empty");
                  } else {
                    context
                        .read<AuthService>()
                        .signUp(
                          email,
                          password,
                          "user",
                        )
                        .then((value) async {
                      User user = FirebaseAuth.instance.currentUser;

                      await FirebaseFirestore.instance
                          .collection("users")
                          .doc(user.uid)
                          .set({
                        'uid': user.uid,
                        'email': email,
                        'password': password,
                        'role': 'user',
                      });
                    });
                  }
                }
                // AuthServices.signUp(
                //     emailController.text, passwordController.text);
                // Navigator.of(context).pushReplacement(
                //     MaterialPageRoute(builder: (context) => WelcomeScreen()));
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
