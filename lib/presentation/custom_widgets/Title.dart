import 'package:auto_size_text/auto_size_text.dart';
import 'package:dooking/presentation/utils/Responsive.dart';
import 'package:dooking/res/constants.dart';
import 'package:dooking/res/theme/typography.dart';
import 'package:flutter/material.dart';

class HeaderTitle extends StatelessWidget {
  HeaderTitle(
    this.title, {
    this.textSize,
    Key? key,
  }) : super(key: key);

  String title;
  double? textSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: HEIGHT * 1.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              height: 2,
              color: Colors.white24,
            ),
          ),
          kDefaultHorizontalPadding,
          AutoSizeText(
            title,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: defaultTextStyle(
                size:
                    (textSize ?? 20) / (Responsive.isMobile(context) ? 1.3 : 1),
                fontWeight: FontWeight.w500),
          ),
          kDefaultHorizontalPadding,
          Expanded(
            child: Container(
              height: 2,
              color: Colors.white24,
            ),
          ),
        ],
      ),
    );
  }
}
