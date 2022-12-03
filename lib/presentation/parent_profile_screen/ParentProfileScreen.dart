import 'package:dooking/presentation/custom_widgets/CustomButton.dart';
import 'package:dooking/presentation/custom_widgets/CustomDropdown.dart';
import 'package:dooking/presentation/custom_widgets/CustomTextField.dart';
import 'package:dooking/presentation/custom_widgets/Title.dart';
import 'package:dooking/presentation/utils/Background.dart';
import 'package:dooking/res/constants.dart';
import 'package:dooking/res/images.dart';
import 'package:dooking/res/theme/colors.dart';
import 'package:dooking/res/theme/typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ParentProfileScreen extends StatelessWidget {
  const ParentProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Header(),
          Text(
            "Профиль родителя",
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
          CustomTextField(
            hintText: "Серия паспорта",
          ),
          kDefaultVerticalPadding,
          CustomTextField(
            hintText: "Номер паспорта",
          ),
          kDefaultVerticalPadding,
          Stack(
            children: [
              CustomTextField(
                hintText: "Дата выдачи",
                readObly: true,
              ),
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
          calendar(true),
          kDefaultVerticalPadding,
          CustomTextField(
            hintText: "Кем выдан",
          ),
          kDefaultVerticalPadding,
          CustomTextField(
            hintText: "Снилс",
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
          CustomDropdown(items: [
            DropdownMenuItemData(name: "ok", value: "ok"),
            DropdownMenuItemData(name: "ok1", value: "ok1"),
            DropdownMenuItemData(name: "ok2", value: "ok2")
          ], onChanged: (_) {}, value: "ok"),
          kDefaultVerticalPadding,
          CustomTextField(
            hintText: "Гражданство",
          ),
          kDefaultVerticalPadding,
          Stack(
            children: [
              CustomTextField(
                hintText: "Дата рождения",
                readObly: true,
              ),
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
          calendar(true),
          kDefaultVerticalPadding,
          CustomTextField(hintText: "Номер телефона")
        ],
      ),
    ));
  }

  AnimatedContainer calendar(bool visible) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: visible ? null : 0,
      child: SfDateRangePicker(
        selectionColor: Colors.amber,
        todayHighlightColor: Colors.transparent,
        monthCellStyle: const DateRangePickerMonthCellStyle(
            todayTextStyle: TextStyle(color: Colors.white70),
            textStyle: TextStyle(color: Colors.white70)),
        yearCellStyle: const DateRangePickerYearCellStyle(
            textStyle: TextStyle(color: Colors.white)),
        headerStyle: const DateRangePickerHeaderStyle(
            textStyle:
                TextStyle(color: Colors.white, decorationColor: Colors.white)),
        monthViewSettings: const DateRangePickerMonthViewSettings(
            viewHeaderStyle: DateRangePickerViewHeaderStyle(
                textStyle: TextStyle(color: Colors.white)),
            weekNumberStyle: DateRangePickerWeekNumberStyle(
                textStyle: TextStyle(color: Colors.white))),
        rangeTextStyle: const TextStyle(color: Colors.white),
        selectionTextStyle: const TextStyle(color: Colors.white),
        onSelectionChanged: (_) {},
        selectionMode: DateRangePickerSelectionMode.single,
        initialSelectedDate: DateTime.now(),
        // initialSelectedRange: PickerDateRange(
        //     DateTime.now().subtract(const Duration(days: 4)),
        //     DateTime.now().add(const Duration(days: 3))),
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
            padding: EdgeInsets.zero,
            onPressed: () {},
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
              minSize: 0,
              padding: EdgeInsets.zero,
              child: Text("Лагеря", style: defaultTextStyle())),
          kDefaultHorizontalPadding,
          CupertinoButton(
              onPressed: () {},
              minSize: 0,
              padding: EdgeInsets.zero,
              child: Text("Дети", style: defaultTextStyle())),
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
