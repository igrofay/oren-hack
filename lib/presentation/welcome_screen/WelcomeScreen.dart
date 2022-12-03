import 'package:dooking/domain/model/user_state_app.dart';
import 'package:dooking/domain/store/app/core_app.dart';
import 'package:dooking/presentation/utils/Background.dart';
import 'package:dooking/res/constants.dart';
import 'package:dooking/res/images.dart';
import 'package:dooking/res/theme/colors.dart';
import 'package:dooking/res/theme/typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';

class WelcomeScreen extends StatelessWidget {
  final CoreApp coreApp;
  const WelcomeScreen({Key? key, required this.coreApp}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ReactionBuilder(
        builder: (_)=> autorun((_) {
          Future.delayed(const Duration(microseconds: 500),(){
            switch(coreApp.userStateApp){
              case UserStateApp.parent:
                context.push('/parentProfileScreen');
                break;
              case UserStateApp.organization:
                context.push('/organizationProfileScreen');
                break;
            // case UserStateApp.minsots:
            //   context.push('/parentProfileScreen');
            //   break;
              case UserStateApp.administrator:
                context.push('/adminScreen');
                break;
              default:
                break;
            }
          });
        }),
        child: BackgroundScaffold(child: Stack(
          children: [
            Header(coreApp: coreApp,),
            Row(
              children: [
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Счастливый билет",
                      style:
                      defaultTextStyle(size: 40, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Это портал бронирования места в лагере\nдля детей в любой лагерь страны",
                      style: defaultTextStyle(size: 14),
                    ),
                    kDefaultVerticalPadding,
                    kDefaultVerticalPadding,
                    Container(
                      width: HEIGHT * 5,
                      height: HEIGHT,
                      child: ElevatedButton(
                          onPressed: () => context.go("/registrationScreen"),
                          style: ElevatedButton.styleFrom(
                              elevation: 8,
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  side: BorderSide(color: Colors.white))),
                          child: Text(
                            "Зарегистрироваться",
                            style: defaultTextStyle(size: 14, color: primary),
                          )),
                    ),
                    kDefaultVerticalPadding,
                    Container(
                      width: HEIGHT * 5,
                      height: HEIGHT,
                      child: ElevatedButton(
                          onPressed: () => context.go("/camps"),
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  side: const BorderSide(color: Colors.white))),
                          child: Text(
                            "Посмотреть лагеря",
                            style: defaultTextStyle(size: 14, color: Colors.white),
                          )),
                    )
                  ],
                ),
                const Spacer(
                  flex: 2,
                ),
                Image.asset(
                  RoundedSunPng,
                  width: MAX_WIDTH / 4,
                ),
                const Spacer(),
              ],
            )
          ],
        ))
    );
  }
}

class Header extends StatelessWidget {
  final CoreApp coreApp;
  const Header({
    Key? key, required this.coreApp
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          const EdgeInsets.symmetric(vertical: kDefaultVerticalPaddingValue),
      height: HEIGHT,
      child: Stack(
        children: [
          sun(),
          nav(context),
          reg(context)
        ],
      ),
    );
  }

  Widget reg(BuildContext context) {
    return Positioned(
      top: 0,
      bottom: 0,
      right: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CupertinoButton(
            onPressed: () => context.go("/registrationScreen"),
            padding: EdgeInsets.zero,
            minSize: 0,
            child: Text(
              "Зарегистрироваться",
              style: defaultTextStyle(size: 16, fontWeight: FontWeight.bold),
            ),
          ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () => context.go("/loginScreen"),
            minSize: 0,
            child: Text(
              "Или войдите в аккаунт",
              style: defaultTextStyle(size: 13, fontWeight: FontWeight.bold)
                  .copyWith(decoration: TextDecoration.underline),
            ),
          ),
        ],
      ),
    );
  }

  Widget nav(BuildContext context) {
    return Positioned(
      top: 0,
      bottom: 0,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CupertinoButton(
              onPressed: () => context.go("/camps"),
              minSize: 0,
              padding: EdgeInsets.zero,
              child: Text("Лагеря", style: defaultTextStyle())),
          kDefaultHorizontalPadding,
          CupertinoButton(
              onPressed:  (){
                switch(coreApp.userStateApp){
                  case UserStateApp.parent:
                    context.push('/parentProfileScreen');
                    break;
                  case UserStateApp.organization:
                    context.push('/organizationProfileScreen');
                    break;
                // case UserStateApp.minsots:
                //   context.push('/parentProfileScreen');
                //   break;
                  case UserStateApp.administrator:
                    context.push('/adminScreen');
                    break;
                  case UserStateApp.noAuthorized:
                    context.go('/loginScreen');
                    break;
                  default:
                    break;
                }
              },
              minSize: 0,
              padding: EdgeInsets.zero,
              child: Text("Профиль", style: defaultTextStyle())),
        ],
      ),
    );
  }

  Widget sun() {
    return Positioned(
      top: 0,
      bottom: 0,
      left: 0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(
            SunSvg,
            height: HEIGHT / 1.5,
          ),
          const SizedBox(
            width: kDefaultHorizontalPaddingValue,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Счастливый билет",
                  style:
                      defaultTextStyle(size: 16, fontWeight: FontWeight.bold)),
              Text("Бронирование Лагеря для детей", style: defaultTextStyle()),
            ],
          )
        ],
      ),
    );
  }
}
