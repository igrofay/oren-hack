import 'package:dooking/presentation/utils/Background.dart';
import 'package:dooking/res/constants.dart';
import 'package:dooking/res/images.dart';
import 'package:dooking/res/theme/typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CampsScreen extends StatelessWidget {
  const CampsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Header(),
          kDefaultVerticalPadding,
          kDefaultVerticalPadding,
          Text(
            "Счастливый билет",
            style: defaultTextStyle(size: 36, fontWeight: FontWeight.bold),
          ),
          Text(
            "для вашего ребенка",
            style: defaultTextStyle(size: 18),
          ),
          kDefaultVerticalPadding,
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            mainAxisSpacing: kDefaultVerticalPaddingValue,
            crossAxisSpacing: kDefaultHorizontalPaddingValue,
            childAspectRatio: 2,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              card(),
              card(),
              card(),
              card(),
              card(),
              card(),
            ],
          )
        ],
      ),
    ));
  }

  Widget card() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Flexible(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage("assets/asset.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
            kDefaultHorizontalPadding,
            Flexible(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Название лагеря",
                      style: defaultTextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    Text(
                      "Самый крутой крутой крутой rhenjq rhnjq njnklefjn крутой",
                      style: defaultTextStyle(color: Colors.black),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Посмотреть",
                          style: defaultTextStyle(color: Colors.black),
                        ),
                        Icon(
                          Icons.arrow_right_alt,
                        )
                      ],
                    ),
                  ],
                ))
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30)),
      ),
    );
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
        children: [sun(), nav(), reg()],
      ),
    );
  }

  Widget reg() {
    return Positioned(
      top: 0,
      bottom: 0,
      right: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CupertinoButton(
            onPressed: () {},
            padding: EdgeInsets.zero,
            minSize: 0,
            child: Text(
              "Зарегистрироваться",
              style: defaultTextStyle(size: 16, fontWeight: FontWeight.bold),
            ),
          ),
          CupertinoButton(
            onPressed: () {},
            padding: EdgeInsets.zero,
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
              padding: EdgeInsets.zero,
              minSize: 0,
              child: Text("Лагеря", style: defaultTextStyle())),
          kDefaultHorizontalPadding,
          CupertinoButton(
              onPressed: () {},
              padding: EdgeInsets.zero,
              minSize: 0,
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
