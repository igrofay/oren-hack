import 'package:dooking/res/constants.dart';
import 'package:dooking/res/images.dart';
import 'package:flutter/material.dart';

class BackgroundScaffold extends StatelessWidget {
  BackgroundScaffold({Key? key, required this.child, this.back, this.appBar})
      : super(key: key);
  AppBar? appBar;
  Widget child;
  String? back;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(back ?? MainBackgroundImage),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                constraints: BoxConstraints(
                    minWidth: 0,
                    maxWidth: MAX_WIDTH,
                    minHeight: MediaQuery.of(context).size.height,
                    maxHeight: MediaQuery.of(context).size.height),
                child: child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
