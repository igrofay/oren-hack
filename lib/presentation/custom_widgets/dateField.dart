import 'package:dooking/res/constants.dart';
import 'package:dooking/res/theme/typography.dart';
import 'package:flutter/material.dart';

Container dateField(String hint, String text) {
  return Container(
    height: HEIGHT,
    decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white24, width: 2)),
    child: Center(
      child: Text(
        text == "" ? hint : text,
        style: defaultTextStyle(color: text == "" ? Colors.white30 : null),
      ),
    ),
  );
}
