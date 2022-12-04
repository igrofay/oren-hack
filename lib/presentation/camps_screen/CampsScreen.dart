import 'package:dooking/presentation/utils/Background.dart';
import 'package:dooking/res/constants.dart';
import 'package:dooking/res/images.dart';
import 'package:dooking/res/theme/typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class Camp {
  int? id;
  String name;
  String description;
  String season;
  String type;
  String phone;
  String address;
  String space;
  String corupuses;
  String dayOfStart;
  String dayOfEnd;
  int? status;
  String image;
  String price;

  Camp(
      this.address,
      this.corupuses,
      this.dayOfEnd,
      this.dayOfStart,
      this.description,
      this.id,
      this.name,
      this.phone,
      this.season,
      this.space,
      this.status,
      this.type,
      this.image,
      this.price);
}

List<Camp> camps = [
  Camp(
      "адрес",
      "21",
      "13.32.1343",
      "31.34.3132",
      "Лагерь находится в ведении Дирекции социальной сферы Куйбышевской железной дороги - филиала ОАО РЖД. На отдых во время летних школьных каникул принимаются дети и подростки. На территории лагеря имеются столовая на 150 мест, современный медпункт, комнаты кружковой работы, бытовые комнаты, библиотека, беседки отрядных сборов. Также имеются танцевальная и спортивные площадки, карусели.",
      0,
      "Орленок",
      "(846)303-24-45",
      "• Зимний сезон",
      "2324",
      1,
      "тип",
      "assets/sam.jpg",
      "10000 рублей"),
  Camp(
      "адрес",
      "21",
      "13.32.1343",
      "31.34.3132",
      "Лагерь находится в ведении Дирекции социальной сферы Куйбышевской железной дороги - филиала ОАО РЖД. На отдых во время летних школьных каникул принимаются дети и подростки. На территории лагеря имеются столовая на 150 мест, современный медпункт, комнаты кружковой работы, бытовые комнаты, библиотека, беседки отрядных сборов. Также имеются танцевальная и спортивные площадки, карусели.",
      0,
      "Орленок",
      "(846)303-24-45",
      "• Зимний сезон",
      "2324",
      1,
      "тип",
      "assets/orl.jpg",
      "10000 рублей"),
];

int current = 0;

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
              ...List.generate(
                  camps.length,
                  (index) => card(camps[index].name, camps[index].description,
                      index, camps[index].image, context))
            ],
          )
        ],
      ),
    ));
  }

  Widget card(
      String name, String desc, int id, String image, BuildContext context) {
    return GestureDetector(
      onTap: () {
        current = id;
        context.go("/detailedCampScreen");
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30)),
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Flexible(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage(image),
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
                      name,
                      style: defaultTextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Text(
                        desc,
                        style: defaultTextStyle(color: Colors.black),
                        maxLines: 6,
                      ),
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
