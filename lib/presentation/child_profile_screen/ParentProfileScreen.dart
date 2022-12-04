import 'package:dooking/presentation/custom_widgets/CustomButton.dart';
import 'package:dooking/presentation/custom_widgets/CustomDropdown.dart';
import 'package:dooking/presentation/custom_widgets/CustomTextField.dart';
import 'package:dooking/presentation/custom_widgets/Title.dart';
import 'package:dooking/presentation/utils/Background.dart';
import 'package:dooking/res/constants.dart';
import 'package:dooking/res/images.dart';
import 'package:dooking/res/theme/colors.dart';
import 'package:dooking/res/theme/typography.dart';
import 'package:dooking/res/utils/formatters/FromSampleFormatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

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
            DropdownMenuItemData(name: "Вид документа", value: "Вид документа"),
            DropdownMenuItemData(name: "ok1", value: "ok1"),
            DropdownMenuItemData(name: "ok2", value: "ok2")
          ], onChanged: (_) {}, value: "Вид документа"),
          kDefaultVerticalPadding,
          CustomTextField(
            hintText: "Серия паспорта",
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
          kDefaultVerticalPadding,
          CustomTextField(
            hintText: "Номер паспорта",
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
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
          calendar(true, (_) {}),
          kDefaultVerticalPadding,
          CustomTextField(hintText: "Номер телефона")
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
        selectionMode: DateRangePickerSelectionMode.single,
        initialSelectedDate: DateTime.now(),
        // initialSelectedRange: PickerDateRange(
        //     DateTime.now().subtract(const Duration(days: 4)),
        //     DateTime.now().add(const Duration(days: 3))),
      ),
    );
  }
}