import 'package:dooking/presentation/custom_widgets/CustomButton.dart';
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

import '../../di/location.dart';
import '../../domain/store/app/core_app.dart';
import '../../domain/store/parent/children_parent.dart';

class ChildListScreen extends StatelessWidget {
  final ChildrenParent childrenParent;
  const ChildListScreen({super.key, required this.childrenParent});

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Header(),
        Expanded(child: SingleChildScrollView(
          child: LayoutBuilder(builder: (_, con) {
            return SizedBox(
              width: con.maxWidth / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Профиль ребенка",
                    style:
                        defaultTextStyle(size: 32, fontWeight: FontWeight.bold),
                  ),
                  kDefaultVerticalPadding,
                  kDefaultVerticalPadding,
                  //через 3 точки сюда просо генерь список и все
                  Observer(builder: (_){
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                          childrenParent.childList.length,
                              (index) =>  Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: CustomButton(
                                    text: childrenParent.childList[index].fio,
                                    textColor: Colors.white,
                                    buttonColor: Colors.transparent,
                                    onPressed: () {}
                                ),
                              )
                      ),
                    );
                  }),
                  CustomButton(
                      text: "+ Добавить",
                      textColor: primary,
                      buttonColor: Colors.white,
                      onPressed: () {}),
                  kDefaultVerticalPadding,
                  kDefaultVerticalPadding,
                  kDefaultVerticalPadding,
                ],
              ),
            );
          }),
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
        children: [sun(), nav(context), mail()],
      ),
    );
  }

  Widget mail() {
    return Positioned(
      top: 0,
      bottom: 0,
      right: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(getIt.get<CoreApp>().emailUser,
              style: defaultTextStyle(size: 16, fontWeight: FontWeight.bold)),
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
              onPressed: ()=> context.go('/camps'),
              minSize: 0,
              padding: EdgeInsets.zero,
              child: Text("Лагеря", style: defaultTextStyle())),
          kDefaultHorizontalPadding,
          CupertinoButton(
              onPressed: null,
              minSize: 0,
              padding: EdgeInsets.zero,
              child: Text("Дети", style: defaultTextStyle())),
          kDefaultHorizontalPadding,
          CupertinoButton(
              onPressed: ()=> context.go('/parentProfileScreen'),
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
