import 'package:flutter/material.dart';
import 'package:johor_wheels/components/text_field_container.dart';
import 'package:johor_wheels/constants.dart';

// ignore: must_be_immutable
class RoundedInputField extends StatelessWidget {
  TextEditingController emailController = TextEditingController(text: "");

  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  RoundedInputField(
      {Key key,
      this.hintText,
      this.icon = Icons.person,
      this.onChanged,
      this.emailController,
      TextInputAction textInputAction,
      AutovalidateMode autovalidateMode,
      String Function(dynamic email) validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: emailController,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
