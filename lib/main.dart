import 'package:dooking/domain/store/app/core_app.dart';
import 'package:dooking/presentation/admin/AdminPanelScreen.dart';
import 'package:dooking/presentation/admin/ApproveCampScreen.dart';
import 'package:dooking/presentation/camp_card_screen/CampCardScreen.dart';
import 'package:dooking/presentation/camps_screen/CampsScreen.dart';
import 'package:dooking/presentation/camps_screen/DetailedCampScreen.dart';
import 'package:dooking/presentation/child_profile_screen/ParentProfileScreen.dart';
import 'package:dooking/presentation/childs_list_screen/ChildListScreen.dart';
import 'package:dooking/presentation/citizen_rf_screen/CitizenRfScreen.dart';
import 'package:dooking/presentation/login_screen/LoginScreen.dart';
import 'package:dooking/presentation/organization_profile_screen/OrganizationProfileScreen.dart';
import 'package:dooking/presentation/parent_profile_screen/ParentProfileScreen.dart';
import 'package:dooking/presentation/payment_screen/PaymentScreen.dart';
import 'package:dooking/presentation/registration_screen/RegistrationScreen.dart';
import 'package:dooking/presentation/welcome_screen/WelcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'di/location.dart';
import 'domain/model/user_state_app.dart';
import 'domain/use_case/restore_session.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await _initApp();
  runApp(MyApp(coreApp: getIt.get(),));
}

Future<void> _initApp() async {
  final restoreSessionUseCase= getIt.get<RestoreSessionUseCase>();
  await restoreSessionUseCase.execute();
}

class MyApp extends StatelessWidget {
  final CoreApp coreApp;
  MyApp({super.key, required this.coreApp});

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
  String get initialLocation {
    switch(coreApp.userStateApp){
      case UserStateApp.noAuthorized:
        return '/';
      case UserStateApp.parent:
        return '/parentProfileScreen';
      case UserStateApp.organization:
        return '/';
      case UserStateApp.minsots:
        return '/';
      case UserStateApp.administrator:
        return '/';
    }
  }

  late final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/detailedCampScreen',
        builder: (BuildContext context, GoRouterState state) {
          return DetailedCampScreen();
        },
      ),
      GoRoute(
        path: '/paymentScreen',
        builder: (BuildContext context, GoRouterState state) {
          return PaymentScreen();
        },
      ),
      GoRoute(
        path: '/childListScreen',
        builder: (BuildContext context, GoRouterState state) {
          return ChildListScreen();
        },
      ),
      GoRoute(
        path: '/childProfileScreen',
        builder: (BuildContext context, GoRouterState state) {
          return ChildProfileScreen();
        },
      ),
      GoRoute(
        path: '/camps',
        builder: (BuildContext context, GoRouterState state) {
          return CampsScreen();
        },
      ),
      GoRoute(
        path: '/campCardScreen',
        builder: (BuildContext context, GoRouterState state) {
          return CampCardScreen();
        },
      ),
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return WelcomeScreen(
            coreApp: getIt.get(),
          );
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
        path: '/adminScreen/approve',
        builder: (BuildContext context, GoRouterState state) {
          return ApproveCampScreen();
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
          return ParentProfileScreen(parentForm: getIt.get(),);
        },
      ),
    ],
  );

}




