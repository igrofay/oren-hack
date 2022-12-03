import 'package:dooking/presentation/custom_widgets/CustomButton.dart';
import 'package:flutter/material.dart';

import '../../data/models/camp.dart';
import '../../res/images.dart';

class CampItem extends StatelessWidget {
  Camp camp;

  CampItem({
    Key? key,
    required this.camp,
});

  @override
  Widget build(BuildContext context) {
    return
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4)
        ),
        height: 560,
        margin: EdgeInsets.only(bottom: 16),
        child: Stack(
          children: [
            Positioned.fill(
              child: Column(
                children: [
                  Flex(
                  direction: Axis.horizontal,
                  children: [
                    Flexible(
                        child: getImageWidget()),
                    Flexible(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(camp.name),
                          Text(camp.campType),
                          Text(camp.description,)
                        ],
                      ),
                    )
                  ]
                  ),
                  Row(
                    children: [
                      TextButton(onPressed: () {}, child: Text("Принять")),
                      TextButton(onPressed: () {}, child: Text("Отклонить")),
                    ],
                  )
                ]
              ),
            ),
          ],
        )
    );
  }

  Widget getImageWidget(){
    return SizedBox(
      width: 320,
      height: 320,
      child: Image(image: AssetImage("assets/asset.png"))
    );
  }
}