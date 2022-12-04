import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

AnimatedContainer calendar(
    bool visible, DateRangePickerSelectionChangedCallback onSelectionChanged) {
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
