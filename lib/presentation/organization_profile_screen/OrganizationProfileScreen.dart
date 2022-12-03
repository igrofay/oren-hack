import 'package:dooking/presentation/custom_widgets/CustomButton.dart';
import 'package:dooking/presentation/custom_widgets/CustomDropdown.dart';
import 'package:dooking/presentation/custom_widgets/CustomTextField.dart';
import 'package:dooking/presentation/custom_widgets/Title.dart';
import 'package:dooking/presentation/utils/Background.dart';
import 'package:dooking/res/constants.dart';
import 'package:dooking/res/images.dart';
import 'package:dooking/res/theme/colors.dart';
import 'package:dooking/res/theme/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class OrganizationProfileScreen extends StatelessWidget {
  const OrganizationProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Header(),
          Flex(
            crossAxisAlignment: CrossAxisAlignment.start,
            direction: Axis.horizontal,
            children: [common(), kDefaultHorizontalPadding, documents()],
          ),
          address(),
        ],
      ),
    ));
  }

  LayoutBuilder address() {
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
          CustomTextField(
            hintText: "Дата выдачи",
          ),
          kDefaultVerticalPadding,
          CustomTextField(
            hintText: "Срок действия",
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
          CustomTextField(
            hintText: "Дата рождения",
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: null,
            child: SfDateRangePicker(
              rangeTextStyle: TextStyle(color: Colors.white),
              selectionTextStyle: TextStyle(color: Colors.white),
              onSelectionChanged: (_) {},
              selectionMode: DateRangePickerSelectionMode.single,
              initialDisplayDate: DateTime.now(),
              // initialSelectedRange: PickerDateRange(
              //     DateTime.now().subtract(const Duration(days: 4)),
              //     DateTime.now().add(const Duration(days: 3))),
            ),
          ),
          kDefaultVerticalPadding,
          CustomTextField(
            hintText: "Номер телефона",
          )
        ],
      ),
    ));
  }
}

Widget Header() {
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

  return Container(
    margin:
        const EdgeInsets.symmetric(vertical: kDefaultVerticalPaddingValue * 2),
    height: HEIGHT,
    child: Stack(
      children: [
        sun(),
        Positioned.fill(
            child: Center(
                child: Text(
          "Профиль организации",
          style: defaultTextStyle(fontWeight: FontWeight.bold, size: 24),
        )))
      ],
    ),
  );
}
