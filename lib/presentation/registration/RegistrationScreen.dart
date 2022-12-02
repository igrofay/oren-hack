import 'package:dooking/presentation/utils/Background.dart';
import 'package:dooking/res/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
        child: Stack(
      children: [
        Positioned.fill(child: SvgPicture.asset(NeMainBackgroundImage))
      ],
    ));
  }
}
