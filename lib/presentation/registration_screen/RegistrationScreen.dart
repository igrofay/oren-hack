import 'package:dooking/presentation/custom_widgets/CustomButton.dart';
import 'package:dooking/presentation/custom_widgets/CustomTextField.dart';
import 'package:dooking/res/constants.dart';
import 'package:dooking/res/images.dart';
import 'package:dooking/res/theme/colors.dart';
import 'package:dooking/res/theme/typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../domain/store/session/sign_up.dart';

class RegistrationScreen extends StatelessWidget {
  final SignUp signUp;
  const RegistrationScreen({super.key,required this.signUp});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
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
                                "Регистрация",
                                style: defaultTextStyle(
                                    size: 32, fontWeight: FontWeight.bold),
                              ),
                              CupertinoButton(
                                onPressed: () {},
                                padding: EdgeInsets.zero,
                                minSize: 0,
                                child: Text(
                                  "Или войдите в аккаунт!",
                                  style: defaultTextStyle(
                                      size: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white70),
                                ),
                              ),
                              kDefaultVerticalPadding,
                              Observer(
                                builder: (context) {
                                  return CustomTextField(
                                    hintText: "E-mail",
                                    onChanged: signUp.setEmail,
                                    isError: signUp.isErrorEmail,
                                  );
                                }
                              ),
                              kDefaultVerticalPadding,
                              Observer(
                                builder: (context) {
                                  return CustomTextField(
                                    hintText: "Пароль",
                                    isPassword: true,
                                    onChanged: signUp.setPassword,
                                    isError: signUp.isErrorPassword,
                                  );
                                }
                              ),
                              kDefaultVerticalPadding,
                              CustomButton(
                                buttonColor: Colors.white,
                                textColor: primary,
                                text: "Зарегистрироваться",
                                onPressed: signUp.registration,
                              ),
                              kDefaultVerticalPadding,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.transparent,
                                        border:
                                            Border.all(color: Colors.white70)),
                                    child: Observer(
                                      builder: (context) {
                                        return Checkbox(
                                            fillColor: MaterialStateProperty.all(
                                                Colors.transparent),
                                            value: signUp.isOrganization,
                                            onChanged: (_)=> signUp.changeIsOrganization()
                                        );
                                      }
                                    ),
                                  ),
                                  const SizedBox(
                                    width: kDefaultHorizontalPaddingValue / 2,
                                  ),
                                  Text(
                                    "я организация",
                                    style: defaultTextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                  )
                                ],
                              ),
                              kDefaultVerticalPadding,
                              Observer(
                                  builder: (context) {
                                    if(signUp.errorMessage != null){
                                      return Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                              signUp.errorMessage!,
                                              style: defaultTextStyle(fontWeight: FontWeight.bold, color: Colors.white)
                                          )
                                        ],
                                      );
                                    }else{
                                      return const SizedBox();
                                    }
                                  }
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
