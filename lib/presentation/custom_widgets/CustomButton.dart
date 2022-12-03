import 'package:dooking/res/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.buttonColor,
      this.textColor})
      : super(key: key);

  String text;
  Color? buttonColor;
  Color? textColor;

  Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: HEIGHT,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: buttonColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Colors.white))),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(color: textColor),
            textAlign: TextAlign.center,
          )),
    );
  }
}
