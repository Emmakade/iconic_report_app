import 'package:flutter/material.dart';

import '../features/app_navigation/screens/app_navigation_screen.dart';
import '../features/login/screens/login_screen.dart';
import '../features/profile/screens/profile_screen.dart';
import '../features/report/screens/report_add_screen.dart';

class AppRoutes {
  static const String emailVerificationScreen = '/email_verification_screen';
  static const String profileScreen = '/profile_screen';
  static const String reportAddScreen = '/report_add_screen';

  static const String appNavigationScreen = '/app_navigation_screen';
  static const String initialRoute = '/';

  static Map<String, WidgetBuilder> get routes => {
        emailVerificationScreen: LoginScreen.builder,
        profileScreen: ProfileScreen.builder,
        reportAddScreen: ReportAddScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: AppNavigationScreen.builder
      };
}
