import 'package:dooking/presentation/admin/AdminPanelScreen.dart';
import 'package:dooking/presentation/citizen_rf_screen/CitizenRfScreen.dart';
import 'package:dooking/presentation/login_screen/LoginScreen.dart';
import 'package:dooking/presentation/organization_profile_screen/OrganizationProfileScreen.dart';
import 'package:dooking/presentation/registration_screen/RegistrationScreen.dart';
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Счастливый Билет',
      theme: ThemeData(
        fontFamily: "Montserrat",
      ),
      home: LoginScreen(signIn: getIt.get(),),
    );
  }
}
