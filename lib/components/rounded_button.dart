import 'package:flutter/material.dart';
import 'package:johor_wheels/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, color2, textColor;
  const RoundedButton({
    Key key,
    this.text,
    this.press,
    this.color = kPrimaryColor,
    this.color2 = kSecondColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
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
                child: Text(
                  text,
                  style: TextStyle(
                      color: textColor, fontSize: 20, fontFamily: 'Campton'),
                ),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    textStyle: TextStyle(
                        color: textColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500)),
                onPressed: press,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
