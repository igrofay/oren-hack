import 'package:dooking/presentation/custom_widgets/CustomButton.dart';
import 'package:dooking/presentation/custom_widgets/CustomDropdown.dart';
import 'package:dooking/presentation/custom_widgets/CustomTextField.dart';
import 'package:dooking/presentation/custom_widgets/Title.dart';
import 'package:dooking/presentation/custom_widgets/calendar.dart';
import 'package:dooking/presentation/custom_widgets/dateField.dart';
import 'package:dooking/presentation/utils/Background.dart';
import 'package:dooking/res/constants.dart';
import 'package:dooking/res/images.dart';
import 'package:dooking/res/theme/colors.dart';
import 'package:dooking/res/theme/typography.dart';
import 'package:dooking/res/utils/formatters/FromSampleFormatter.dart';
import 'package:dooking/res/utils/formatters/NumberTextInputFormatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChildProfileScreen extends StatelessWidget {
  const ChildProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Text(
            "Профиль ребенка",
            style: defaultTextStyle(size: 32, fontWeight: FontWeight.bold),
          ),
          Flex(
            crossAxisAlignment: CrossAxisAlignment.start,
            direction: Axis.horizontal,
            children: [common(), kDefaultHorizontalPadding, documents()],
          ),
          addressAndNexButton(),
          kDefaultVerticalPadding,
          kDefaultVerticalPadding,
          kDefaultVerticalPadding,
        ],
      ),
    ));
  }

  LayoutBuilder addressAndNexButton() {
    return LayoutBuilder(builder: (_, con) {
      return SizedBox(
          width: con.maxWidth / 2,
          child: Column(
            children: [
              HeaderTitle("Адрес"),
              CustomTextField(hintText: "Место жительства"),
              kDefaultVerticalPadding,
              LayoutBuilder(builder: (_, con) {
                return SizedBox(
                  width: con.maxWidth / 2,
                  child: CustomButton(
                    text: "Продолжить",
                    textColor: primary,
                    buttonColor: Colors.white,
                    onPressed: () {},
                  ),
                );
              })
            ],
          ));
    });
  }

  Flexible documents() {
    return Flexible(
        child: SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          LayoutBuilder(builder: (_, con) {
            return SizedBox(
                width: con.maxWidth / 1.5, child: HeaderTitle("Документы"));
          }),
          CustomDropdown(items: [
            DropdownMenuItemData(name: "Паспорт", value: "Паспорт"),
            DropdownMenuItemData(
                name: "Свидетельсво о рождении",
                value: "Свидетельсво о рождении")
          ], onChanged: (_) {}, value: "Паспорт"),
          if (true) kDefaultVerticalPadding,
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: true ? null : 0,
            child: CustomTextField(
              hintText: "Серия паспорта",
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
          if (true) kDefaultVerticalPadding,
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: true ? null : 0,
            child: CustomTextField(
              hintText: "Номер паспорта",
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
          kDefaultVerticalPadding,
          Stack(
            children: [
              Observer(builder: (context) {
                return dateField("Дата выдачи", "");
              }),
              Positioned(
                  top: 0,
                  bottom: 0,
                  right: 16,
                  child: AnimatedRotation(
                    duration: const Duration(milliseconds: 300),
                    turns: false ? 1 : 0.5,
                    child: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                    ),
                  )),
              Positioned.fill(
                  child: GestureDetector(
                onTap: () => print("lllla"),
              )),
            ],
          ),
          calendar(true, (_) {}),
          kDefaultVerticalPadding,
          CustomTextField(
            hintText: "Кем выдан",
          ),
          kDefaultVerticalPadding,
          CustomTextField(
            hintText: "Снилс",
            inputFormatters: [
              FromSampleFormatter(
                  sample: "XXX XXX XXX XX", seperator: " ", isDigits: true)
            ],
          ),
        ],
      ),
    ));
  }

  Flexible common() {
    return Flexible(
        child: SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          LayoutBuilder(builder: (_, con) {
            return SizedBox(
                width: con.maxWidth / 1.5, child: HeaderTitle("Общее"));
          }),
          CustomTextField(
            hintText: "ФИО",
          ),
          kDefaultVerticalPadding,
          CustomTextField(
            hintText: "Гражданство",
          ),
          kDefaultVerticalPadding,
          Stack(
            children: [
              Observer(builder: (context) {
                return dateField("Дата рождения", "");
              }),
              Positioned(
                  top: 0,
                  bottom: 0,
                  right: 16,
                  child: AnimatedRotation(
                    duration: const Duration(milliseconds: 300),
                    turns: false ? 1 : 0.5,
                    child: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                    ),
                  )),
              Positioned.fill(
                  child: GestureDetector(
                onTap: () => print("lllla"),
              )),
            ],
          ),
          calendar(true, (_) {}),
          kDefaultVerticalPadding,
          CustomTextField(
            hintText: "Номер телефона",
            inputFormatters: [NumberTextInputFormatter()],
          )
        ],
      ),
    ));
  }
}