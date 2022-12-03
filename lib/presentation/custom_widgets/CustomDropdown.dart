import 'package:dooking/res/constants.dart';
import 'package:dooking/res/theme/colors.dart';
import 'package:dooking/res/theme/typography.dart';
import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatelessWidget {
  CustomDropdown(
      {required this.items,
      required this.onChanged,
      required this.value,
      super.key});

  void Function(T?)? onChanged;
  List<DropdownMenuItemData<T>> items;
  T value;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      return Stack(
        children: [
          Positioned(
              top: 0,
              bottom: 0,
              right: 16,
              child: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
              )),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white24,
                border: Border.all(color: Colors.white24, width: 2)),
            height: HEIGHT,
            child: DropdownButtonFormField<T>(
              style: defaultTextStyle(),
              dropdownColor: primary.withAlpha(51),
              isExpanded: true,
              elevation: 8,
              itemHeight: HEIGHT,
              alignment: Alignment.center,
              iconSize: 0,
              decoration: InputDecoration(
                floatingLabelAlignment: FloatingLabelAlignment.center,
                contentPadding: EdgeInsets.zero,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        const BorderSide(width: 0, color: Colors.transparent)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        const BorderSide(width: 0, color: Colors.transparent)),
              ),
              icon: const SizedBox(),
              hint: const SizedBox(),
              disabledHint: const SizedBox(),
              borderRadius: BorderRadius.circular(4),
              value: value,
              items: items
                  .map(
                    (value) => DropdownMenuItem(
                      value: value.value,
                      child: SizedBox(
                        width: constraints.maxWidth,
                        height: HEIGHT,
                        child: Center(
                          child: Text(
                            value.name,
                            textAlign: TextAlign.center,
                            style: defaultTextStyle(),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: onChanged,
            ),
          ),
        ],
      );
    });
  }
}

class DropdownMenuItemData<T> {
  T value;
  String name;

  DropdownMenuItemData({required this.value, required this.name});
}
