import 'package:dooking/presentation/custom_widgets/CustomButton.dart';
import 'package:dooking/presentation/custom_widgets/CustomTextField.dart';
import 'package:dooking/presentation/utils/Background.dart';
import 'package:dooking/res/constants.dart';
import 'package:dooking/res/images.dart';
import 'package:dooking/res/theme/colors.dart';
import 'package:dooking/res/theme/typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(NeMainBackgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Flexible(
                flex: 1,
                child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(RoundedSunPrimary),
                        kDefaultVerticalPadding,
                        Text(
                          "Счастливый билет",
                          style: defaultTextStyle(
                              size: 26,
                              fontWeight: FontWeight.w500,
                              color: primary),
                        )
                      ],
                    ))),
            Flexible(
                child: SizedBox(
                    width: double.infinity,
                    child: LayoutBuilder(builder: (_, constraints) {
                      return Center(
                        child: SizedBox(
                          width: constraints.maxWidth / 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Войти в аккаунт",
                                style: defaultTextStyle(
                                    size: 32, fontWeight: FontWeight.bold),
                              ),
                              CupertinoButton(
                                onPressed: () {},
                                padding: EdgeInsets.zero,
                                minSize: 0,
                                child: Text(
                                  "Или зарегистрируйте аккаунт!",
                                  style: defaultTextStyle(
                                      size: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white70),
                                ),
                              ),
                              kDefaultVerticalPadding,
                              CustomTextField(hintText: "E-mail"),
                              kDefaultVerticalPadding,
                              CustomTextField(hintText: "Пароль"),
                              kDefaultVerticalPadding,
                              CustomButton(
                                buttonColor: Colors.white,
                                textColor: primary,
                                text: "Зарегистрироваться",
                                onPressed: () {},
                              ),
                              kDefaultVerticalPadding,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "тут ошибка",
                                    style: defaultTextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.redAccent)
                                        .copyWith(
                                            decoration:
                                                TextDecoration.underline),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    })))
          ],
        ),
      ),
    );
  }
}
