import 'package:dooking/presentation/custom_widgets/CustomButton.dart';
import 'package:dooking/presentation/utils/Background.dart';
import 'package:dooking/res/constants.dart';
import 'package:dooking/res/theme/colors.dart';
import 'package:dooking/res/theme/typography.dart';
import 'package:flutter/material.dart';

class CitizenRfScreen extends StatelessWidget {
  const CitizenRfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
        child: SizedBox(
      width: 500,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Вы гражданин РФ?",
            style: defaultTextStyle(fontWeight: FontWeight.bold, size: 24),
          ),
          kDefaultVerticalPadding,
          CustomButton(
            buttonColor: Colors.white,
            textColor: primary,
            text: "Да",
            onPressed: () {},
          ),
          kDefaultVerticalPadding,
          CustomButton(
            buttonColor: Colors.transparent,
            textColor: Colors.white,
            text: "Нет",
            onPressed: () {},
          ),
        ],
      ),
    ));
  }
}
