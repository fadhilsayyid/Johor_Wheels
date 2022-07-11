// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:johor_wheels/constants.dart';
// import 'package:johor_wheels/auth_services.dart';
// import 'package:johor_wheels/screens/Home/home_screen.dart';
import 'package:johor_wheels/screens/Login/components/background.dart';
import 'package:johor_wheels/screens/Login/components/or_divider.dart';
import 'package:johor_wheels/screens/Login/components/social_icon.dart';
import 'package:johor_wheels/screens/Signup/signup_screen.dart';
import 'package:johor_wheels/components/already_have_an_account_acheck.dart';
import 'package:johor_wheels/components/rounded_button.dart';
import 'package:johor_wheels/components/rounded_input_field.dart';
import 'package:johor_wheels/components/rounded_password_field.dart';
import 'package:provider/provider.dart';
import 'package:johor_wheels/services/auth_services.dart';

import '../../Password/forgotPassword_screen.dart';

// ignore: must_be_immutable
class Body extends StatelessWidget {
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");

  Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // User firebaseUser = Provider.of<User>(context);
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.05),
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
                  final String email = emailController.text.trim();
                  final String password = passwordController.text.trim();

                  if (email.isEmpty) {
                    print("Email is Empty");
                  } else {
                    if (password.isEmpty) {
                      print("Password is Empty");
                    } else {
                      context.read<AuthService>().signIn(
                            email,
                            password,
                          );
                    }
                  }
                  // AuthServices.signIn(
                  //     emailController.text, passwordController.text);
                  // Navigator.of(context).pushReplacement(MaterialPageRoute(
                  //     builder: (context) => HomeScreen(firebaseUser)));
                }),
            SizedBox(height: size.height * 0.02),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PasswordScreen()));
              },
              child: Text(
                'Forgot password?',
                style: TextStyle(
                    color: kPrimaryColor, fontWeight: FontWeight.bold),
              ),
            ),
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
