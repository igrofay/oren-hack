import 'package:dooking/presentation/custom_widgets/CustomButton.dart';
import 'package:dooking/presentation/custom_widgets/CustomDropdown.dart';
import 'package:dooking/presentation/custom_widgets/CustomTextField.dart';
import 'package:dooking/presentation/custom_widgets/Title.dart';
import 'package:dooking/presentation/custom_widgets/dateField.dart';
import 'package:dooking/presentation/utils/Background.dart';
import 'package:dooking/res/constants.dart';
import 'package:dooking/res/images.dart';
import 'package:dooking/res/theme/colors.dart';
import 'package:dooking/res/theme/typography.dart';
import 'package:dooking/res/utils/formatters/NumberTextInputFormatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:injectable/injectable.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CampCardScreen extends StatelessWidget {
  const CampCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Header(),
          LayoutBuilder(builder: (_, con) {
            return SizedBox(
                width: con.maxWidth / 1.5,
                child: Column(
                  children: [
                    Text("Карточка лагеря",
                        style: defaultTextStyle(
                            size: 32, fontWeight: FontWeight.bold)),
                    HeaderTitle("Общее"),
                    CustomTextField(
                      hintText: "Название лагеря",
                    ),
                    kDefaultVerticalPadding,
                    CustomTextField(
                      hintText: "Описание",
                      height: 150,
                    ),
                    kDefaultVerticalPadding,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        checkBox("Летний сезон", (_) {}, false),
                        checkBox("Зимний сезон", (_) {}, false),
                        checkBox("Весений сезон", (_) {}, true),
                        checkBox("Осений сезон", (_) {}, true),
                      ],
                    ),
                    kDefaultVerticalPadding,
                    HeaderTitle("Подробная информация"),
                    kDefaultVerticalPadding,
                    CustomDropdown(items: [
                      DropdownMenuItemData(value: "value", name: "value")
                    ], onChanged: (_) {}, value: "value"),
                    kDefaultVerticalPadding,
                    CustomTextField(
                      hintText: "Телефон для справок",
                      inputFormatters: [NumberTextInputFormatter()],
                    ),
                    kDefaultVerticalPadding,
                    CustomTextField(hintText: "Адрес"),
                    kDefaultVerticalPadding,
                    CustomTextField(
                      hintText: "Площадь(м²)",
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                    kDefaultVerticalPadding,
                    CustomTextField(
                      hintText: "Кол-во корпусов",
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                    kDefaultVerticalPadding,
                    kDefaultVerticalPadding,
                    HeaderTitle("Сроки посещения"),
                    LayoutBuilder(
                        builder: (_, con) => SizedBox(
                              width: con.maxWidth / 2,
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      dateField("Начало - Конец", ""),
                                      Positioned(
                                          top: 0,
                                          bottom: 0,
                                          right: 16,
                                          child: AnimatedRotation(
                                            duration: const Duration(
                                                milliseconds: 300),
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
                                  CustomButton(
                                    text: "Отправить",
                                    onPressed: () {},
                                    buttonColor: Colors.white,
                                    textColor: primary,
                                  ),
                                ],
                              ),
                            )),
                    kDefaultVerticalPadding,
                    kDefaultVerticalPadding,
                    kDefaultVerticalPadding,
                  ],
                ));
          }),
        ],
      ),
    ));
  }

  AnimatedContainer calendar(bool visible,
      Function(DateRangePickerSelectionChangedArgs)? onSelectionChanged) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: visible ? null : 0,
      child: SfDateRangePicker(
        selectionColor: Colors.amber,
        rangeSelectionColor: Colors.amber.withAlpha(100),
        startRangeSelectionColor: Colors.amber,
        endRangeSelectionColor: Colors.amber,
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
        onSelectionChanged: onSelectionChanged,
        selectionMode: DateRangePickerSelectionMode.range,
        initialSelectedDate: DateTime.now(),
        // initialSelectedRange: PickerDateRange(
        //     DateTime.now().subtract(const Duration(days: 4)),
        //     DateTime.now().add(const Duration(days: 3))),
      ),
    );
  }

  Widget checkBox(String text, Function(bool?)? onChanged, bool value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(color: Colors.white70)),
          child: Observer(builder: (context) {
            return Checkbox(
                fillColor: MaterialStateProperty.all(Colors.transparent),
                value: value,
                onChanged: onChanged);
          }),
        ),
        SizedBox(
          width: kDefaultHorizontalPaddingValue / 2,
        ),
        Text(text, style: defaultTextStyle())
      ],
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
