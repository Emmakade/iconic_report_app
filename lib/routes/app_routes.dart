// lib/routes/app_routes.dart

import 'package:flutter/material.dart';
import '../features/splash/screens/spalsh_screen.dart';
import '../features/onboarding/screens/onboarding_screen.dart';
import '../features/auth/screens/login_screen.dart';
import '../features/dashboard/screens/dashboard_screen.dart';
import 'route_names.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RouteNames.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case RouteNames.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RouteNames.dashboard:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      // case RouteNames.reportForm:
      //   return MaterialPageRoute(builder: (_) => const ReportFormScreen());
      // case RouteNames.reportList:
      //   return MaterialPageRoute(builder: (_) => const ReportListScreen());
      // case RouteNames.profile:
      //   return MaterialPageRoute(builder: (_) => const ProfileScreen());
      // case RouteNames.support:
      //   return MaterialPageRoute(builder: (_) => const SupportScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('No route defined for this screen')),
          ),
        );
    }
  }
}

// git init
// git add README.md
// git commit -m "first commit"
// git branch -M main
// git remote add origin https://github.com/Emmakade/iconic_report_app.git
// git push -u origin main
