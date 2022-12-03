import 'package:dooking/presentation/admin/AdminPanelScreen.dart';
import 'package:dooking/presentation/camp_card_screen/CampCardScreen.dart';
import 'package:dooking/presentation/camps_screen/CampsScreen.dart';
import 'package:dooking/presentation/camps_screen/DetailedCampScreen.dart';
import 'package:dooking/presentation/citizen_rf_screen/CitizenRfScreen.dart';
import 'package:dooking/presentation/login_screen/LoginScreen.dart';
import 'package:dooking/presentation/organization_profile_screen/OrganizationProfileScreen.dart';
import 'package:dooking/presentation/parent_profile_screen/ParentProfileScreen.dart';
import 'package:dooking/presentation/registration_screen/RegistrationScreen.dart';
import 'package:dooking/presentation/welcome_screen/WelcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      title: 'Счастливый Билет',
      theme: ThemeData(
        fontFamily: "Montserrat",
      ),
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return AdminPanelScreen();
      },
    ),
    GoRoute(
      path: '/detailedCampScreen',
      builder: (BuildContext context, GoRouterState state) {
        return DetailedCampScreen();
      },
    ),
    GoRoute(
      path: '/campCardScreen',
      builder: (BuildContext context, GoRouterState state) {
        return CampCardScreen();
      },
    ),
    GoRoute(
      path: '/welcomeScreen',
      builder: (BuildContext context, GoRouterState state) {
        return WelcomeScreen();
      },
    ),
    GoRoute(
      path: '/loginScreen',
      builder: (BuildContext context, GoRouterState state) {
        return LoginScreen(signIn: getIt.get());
      },
    ),
    GoRoute(
      path: '/registrationScreen',
      builder: (BuildContext context, GoRouterState state) {
        return RegistrationScreen(signUp: getIt.get());
      },
    ),
    GoRoute(
      path: '/adminScreen',
      builder: (BuildContext context, GoRouterState state) {
        return AdminPanelScreen();
      },
    ),
    GoRoute(
      path: '/sitizen_RF',
      builder: (BuildContext context, GoRouterState state) {
        return CitizenRfScreen();
      },
    ),
    GoRoute(
      path: '/organizationProfileScreen',
      builder: (BuildContext context, GoRouterState state) {
        return OrganizationProfileScreen();
      },
    ),
    GoRoute(
      path: '/parentProfileScreen',
      builder: (BuildContext context, GoRouterState state) {
        return ParentProfileScreen();
      },
    ),
  ],
);
