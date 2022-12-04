import 'package:dooking/presentation/custom_widgets/CustomButton.dart';
import 'package:dooking/presentation/custom_widgets/CustomTextField.dart';
import 'package:dooking/presentation/custom_widgets/Title.dart';
import 'package:dooking/presentation/utils/Background.dart';
import 'package:dooking/res/constants.dart';
import 'package:dooking/res/images.dart';
import 'package:dooking/res/theme/colors.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      back: PaymentBackground,
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Flexible(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  HeaderTitle("Введите данные карты"),
                  kDefaultVerticalPadding,
                  CustomTextField(hintText: "Номер карты"),
                  kDefaultVerticalPadding,
                  Flex(
                    direction: Axis.horizontal,
                    children: [
                      Flexible(child: CustomTextField(hintText: "01/01")),
                      kDefaultHorizontalPadding,
                      Flexible(
                        child: CustomTextField(hintText: "CVV"),
                      )
                    ],
                  ),
                  kDefaultVerticalPadding,
                  CustomButton(
                    text: "Оплатить",
                    onPressed: () {},
                    textColor: primary,
                    buttonColor: Colors.white,
                  )
                ],
              ),
            ),
          ),
          Flexible(
            flex: 7,
            child: Container(color: Colors.transparent),
          )
        ],
      ),
    );
  }
}
