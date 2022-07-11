// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';
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
// import 'package:johor_wheels/components/rounded_password_field.dart';
// import 'package:provider/provider.dart';
// import 'package:johor_wheels/services/auth_services.dart';
// import '../../Password/forgotPassword_screen.dart';

// ignore: must_be_immutable
class Body extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<Body> {
  final TextEditingController emailController = TextEditingController(text: "");

  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

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
            Text(
              "Receive an email to reset your password",
              style: poppinsTextStyle.copyWith(
                fontSize: 13.5,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: size.height * 0.01),
            RoundedInputField(
              hintText: "Your Email",
              emailController: emailController,
              textInputAction: TextInputAction.done,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (email) =>
                  email != null && !EmailValidator.validate(email)
                      ? 'Enter a valid email'
                      : null,
            ),
            RoundedButton(
                text: "Reset password",
                press: () {
                  resetPassword();
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

  Future resetPassword() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator()));

    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());

      Navigator.of(context).popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      print(e);

      Navigator.of(context).pop();
    }
  }
}
