import 'package:flutter/material.dart';
import '../features/dashboard/screens/submit_report_screen.dart';
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
      case RouteNames.submitReport:
        return MaterialPageRoute(builder: (_) => const SubmitReportScreen());
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
