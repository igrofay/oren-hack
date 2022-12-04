import 'package:dooking/res/constants.dart';
import 'package:dooking/res/theme/typography.dart';
import 'package:flutter/material.dart';

class CampItem extends StatelessWidget {
  CampItem({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, con) {
      return SizedBox(
        child: Center(
          child: Container(
            margin: const EdgeInsets.only(bottom: kDefaultVerticalPaddingValue),
            height: HEIGHT,
            width: con.maxWidth / 2,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Colors.white))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  Text(
                    "Лагерь №1",
                    style: defaultTextStyle(),
                  ),
                  // тут без row. просто чтобы знал какие есть
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.error_outline,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.cancel_outlined,
                        color: Colors.white,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
