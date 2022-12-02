import 'package:dooking/presentation/welcome_screen/WelcomeScreen.dart';
import 'package:flutter/material.dart';

import 'di/location.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Счастливый Билет',
      theme: ThemeData(
        fontFamily: "Montserrat",
      ),
      home: WelcomeScreen(),
    );
  }
}
