import 'package:dooking/di/location.dart';
import 'package:dooking/domain/store/app/core_app.dart';
import 'package:dooking/presentation/custom_widgets/CustomButton.dart';
import 'package:dooking/presentation/custom_widgets/CustomDropdown.dart';
import 'package:dooking/presentation/custom_widgets/CustomTextField.dart';
import 'package:dooking/presentation/custom_widgets/Title.dart';
import 'package:dooking/presentation/custom_widgets/calendar.dart';
import 'package:dooking/presentation/utils/Background.dart';
import 'package:dooking/presentation/custom_widgets/dateField.dart';
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
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../domain/store/parent/parent_form.dart';


class ParentProfileScreen extends StatelessWidget {
  final ParentForm parentForm;
  const ParentProfileScreen({super.key, required this.parentForm});

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
        child: SingleChildScrollView(child: Observer(builder: (_) {
      return parentForm.state == StateParentForm.load
          ? const SizedBox()
          : Column(
              children: [
                Header(
                  parentForm: parentForm,
                ),
                Text(
                  "Профиль родителя",
                  style:
                      defaultTextStyle(size: 32, fontWeight: FontWeight.bold),
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
            );
    })));
  }

  LayoutBuilder addressAndNexButton() {
    return LayoutBuilder(builder: (_, con) {
      return SizedBox(
          width: con.maxWidth / 2,
          child: Column(
            children: [
              HeaderTitle("Адрес"),
              CustomTextField(
                hintText: "Место жительства",
                onChanged: (value) => parentForm.address = value,
                isError: parentForm.isErrorAddress,
                text: parentForm.address,
              ),
              kDefaultVerticalPadding,
              LayoutBuilder(builder: (_, con) {
                return SizedBox(
                  width: con.maxWidth / 2,
                  child: CustomButton(
                    text: "Сохранить",
                    textColor: primary,
                    buttonColor: Colors.white,
                    onPressed: () => parentForm.save(),
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
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: (value) => parentForm.seriesPassport = value,
            isError: parentForm.isErrorSeriesPassport,
            text: parentForm.seriesPassport,
          ),
          kDefaultVerticalPadding,
          CustomTextField(
            hintText: "Номер паспорта",
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: (value) => parentForm.numberPassport = value,
            isError: parentForm.isErrorNumberPassport,
            text: parentForm.numberPassport,
          ),
          kDefaultVerticalPadding,
          Stack(
            children: [
              Observer(builder: (_) {
                return dateField(
                    "Дата выдачи", parentForm.dateOfGettingPassport);
              }),
              Positioned(
                  top: 0,
                  bottom: 0,
                  right: 16,
                  child: AnimatedRotation(
                    duration: const Duration(milliseconds: 300),
                    turns:
                        parentForm.showCalendarDateOfGettingPassport ? 0.5 : 1,
                    child: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                    ),
                  )),
              Positioned.fill(
                  child: GestureDetector(
                onTap: () => runInAction(() {
                  parentForm.showCalendarDateOfGettingPassport =
                      !parentForm.showCalendarDateOfGettingPassport;
                }),
              )),
            ],
          ),
          Observer(builder: (context) {
            return calendar(parentForm.showCalendarDateOfGettingPassport,
                (value) {
              runInAction(() => parentForm.dateOfGettingPassport =
                  value.value.toString().substring(0, 10));
            });
          }),
          kDefaultVerticalPadding,
          CustomTextField(
            hintText: "Кем выдан",
            onChanged: (value) => parentForm.issueName = value,
            text: parentForm.issueName,
            isError: parentForm.isErrorIssueName,
          ),
          kDefaultVerticalPadding,
          CustomTextField(
            hintText: "Снилс",
            inputFormatters: [
              FromSampleFormatter(
                  sample: "XXX XXX XXX XX", seperator: " ", isDigits: true)
            ],
            onChanged: (value) => parentForm.snils = value,
            text: parentForm.snils,
            isError: parentForm.isErrorSnils,
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
            onChanged: (value) => parentForm.fio = value,
            isError: parentForm.isErrorAddress,
            text: parentForm.fio,
          ),
          kDefaultVerticalPadding,
          CustomDropdown(
              items: [
                DropdownMenuItemData(name: "Родитель", value: "Родитель"),
                DropdownMenuItemData(
                    name: "Законный представитель ребенка",
                    value: "Законный представитель ребенка")
              ],
              onChanged: (value) {
                if (value == null) return;
                runInAction(() => parentForm.parentStatus = value);
              },
              value: parentForm.parentStatus),
          kDefaultVerticalPadding,
          CustomTextField(
            hintText: "Гражданство",
            onChanged: (value) => parentForm.citizenCountry = value,
            isError: parentForm.isErrorCitizenCountry,
            text: parentForm.citizenCountry,
          ),
          kDefaultVerticalPadding,
          Stack(
            children: [
              Observer(builder: (context) {
                return dateField("Дата рождения", parentForm.birthday);
              }),
              Positioned(
                  top: 0,
                  bottom: 0,
                  right: 16,
                  child: AnimatedRotation(
                    duration: const Duration(milliseconds: 300),
                    turns: parentForm.showCalendarBirthday ? 0.5 : 1,
                    child: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                    ),
                  )),
              Positioned.fill(
                  child: GestureDetector(
                onTap: () => runInAction(() => parentForm.showCalendarBirthday =
                    !parentForm.showCalendarBirthday),
              )),
            ],
          ),
          Observer(builder: (_) {
            return calendar(parentForm.showCalendarBirthday, (value) {
              runInAction(() => parentForm.birthday =
                  value.value.toString().substring(0, 10));
            });
          }),
          kDefaultVerticalPadding,
          CustomTextField(
            hintText: "Номер телефона",
            onChanged: (value) => parentForm.phoneNumber = value,
            isError: parentForm.isErrorPhoneNumber,
            text: parentForm.phoneNumber,
            inputFormatters: [NumberTextInputFormatter()],
          )
        ],
      ),
    ));
  }
}

class Header extends StatelessWidget {
  final ParentForm parentForm;
  const Header({
    Key? key,
    required this.parentForm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          const EdgeInsets.symmetric(vertical: kDefaultVerticalPaddingValue),
      height: HEIGHT,
      child: Stack(
        children: [sun(), nav(context), reg()],
      ),
    );
  }

  Widget reg() {
    return Positioned(
        top: 0,
        bottom: 0,
        right: 0,
        child: Center(
          child: Text(
            getIt.get<CoreApp>().emailUser,
            style: defaultTextStyle(size: 16, fontWeight: FontWeight.bold),
          ),
        ));
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
              onPressed: () => context.go('/camps'),
              minSize: 0,
              padding: EdgeInsets.zero,
              child: Text("Лагеря", style: defaultTextStyle())),
          kDefaultHorizontalPadding,
          CupertinoButton(
              onPressed: () => context.go('/childListScreen'),
              minSize: 0,
              padding: EdgeInsets.zero,
              child: Text("Дети", style: defaultTextStyle())),
          kDefaultHorizontalPadding,
          CupertinoButton(
              onPressed: null,
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
