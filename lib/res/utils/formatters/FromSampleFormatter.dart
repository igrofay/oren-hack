import 'package:dooking/res/utils/parsers.dart';
import 'package:flutter/services.dart';

class FromSampleFormatter extends TextInputFormatter {
  final String sample;
  final String seperator;
  final bool isDigits;

  FromSampleFormatter(
      {required this.sample, required this.seperator, this.isDigits = false});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isNotEmpty) {
      if (isDigits) {
        if (newValue.text.substring(newValue.text.length - 1) != seperator) {
          if ((!isDigit(newValue.text.substring(newValue.text.length - 1)))) {
            return oldValue;
          }
        }
      }
      if (newValue.text.length > oldValue.text.length) {
        if (newValue.text.length > sample.length) {
          return oldValue;
        }
        if (newValue.text.length < sample.length &&
            sample[newValue.text.length - 1] == seperator) {
          return TextEditingValue(
              text:
                  '${oldValue.text}$seperator${newValue.text.substring(newValue.text.length - 1)}',
              selection:
                  TextSelection.collapsed(offset: newValue.selection.end + 1));
        }
      }
    }
    return newValue;
  }
}
