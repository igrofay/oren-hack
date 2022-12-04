import 'package:dooking/presentation/custom_widgets/CustomButton.dart';
import 'package:dooking/presentation/utils/Background.dart';
import 'package:dooking/res/constants.dart';
import 'package:dooking/res/images.dart';
import 'package:dooking/res/theme/colors.dart';
import 'package:dooking/res/theme/typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ApproveCampScreen extends StatelessWidget {
  const ApproveCampScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Header(),
        Expanded(
            child: Flex(
          direction: Axis.horizontal,
          children: [
            Flexible(
                child: Container(
              padding: EdgeInsets.all(kDefaultHorizontalPaddingValue * 3),
              child: Padding(
                padding: const EdgeInsets.only(top: 60, left: 40, bottom: 60),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                        color: Colors.white38,
                        strokeAlign: StrokeAlign.outside,
                        width: kDefaultHorizontalPaddingValue),
                    image: DecorationImage(
                      image: AssetImage("assets/asset.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            )),
            Flexible(
                child: Container(
                    padding: EdgeInsets.all(kDefaultHorizontalPaddingValue * 3),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Название лагеря",
                          style: defaultTextStyle(
                              fontWeight: FontWeight.bold, size: 28),
                        ),
                        Text(
                            "Самый самыйСамый самыйСамый самыйСамый самыйСамый самый Самый самыйСамый самый",
                            style: defaultTextStyle(size: 18)),
                        kDefaultVerticalPadding,
                        Text(
                          "• Летний сезон",
                          style: defaultTextStyle(
                              fontWeight: FontWeight.bold, size: 18),
                        ),
                        kDefaultVerticalPadding,
                        Text(
                          "2000 рублей",
                          style: defaultTextStyle(
                              fontWeight: FontWeight.bold, size: 24),
                        ),
                        kDefaultVerticalPadding,
                        LayoutBuilder(builder: (_, con) {
                          return SizedBox(
                            width: con.maxWidth / 2,
                            child: CustomButton(
                              text: "Одобрить",
                              textColor: primary,
                              buttonColor: Colors.white,
                              onPressed: () {},
                            ),
                          );
                        }),
                        kDefaultVerticalPadding,
                        LayoutBuilder(builder: (_, con) {
                          return SizedBox(
                            width: con.maxWidth / 2,
                            child: CustomButton(
                              text: "Отказать",
                              textColor: Colors.white,
                              buttonColor: Colors.transparent,
                              onPressed: () {},
                            ),
                          );
                        })
                      ],
                    )))
          ],
        ))
      ],
    ));
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          const EdgeInsets.symmetric(vertical: kDefaultVerticalPaddingValue),
      height: HEIGHT,
      child: Stack(
        children: [sun(), nav(), mail()],
      ),
    );
  }

  Widget mail() {
    return Positioned(
      top: 0,
      bottom: 0,
      right: 0,
      child: Text("mail",
          style: defaultTextStyle(size: 16, fontWeight: FontWeight.bold)),
    );
  }

  Widget nav() {
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
              onPressed: () {},
              minSize: 0,
              padding: EdgeInsets.zero,
              child: Text("Лагеря", style: defaultTextStyle())),
          kDefaultHorizontalPadding,
          CupertinoButton(
              onPressed: () {},
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
