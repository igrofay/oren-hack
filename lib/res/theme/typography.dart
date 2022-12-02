import 'package:flutter/material.dart';

TextStyle defaultTextStyle(
    {double? size = 16, FontWeight? fontWeight, Color? color}) {
  return TextStyle(
      color: color ?? Colors.white,
      fontSize: size,
      fontWeight: fontWeight,
      fontFamily: "Montserrat");
}
