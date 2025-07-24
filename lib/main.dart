import 'package:flutter/material.dart';
import 'core/theme/app_colors.dart';
import 'routes/app_routes.dart';
import 'routes/route_names.dart';

void main() {
  try {
    runApp(const IconicReportApp());
  } catch (e) {
    print('Error caught: $e');
    //showing a user-friendly error screen
    //runApp(const ErrorApp());
  }
}

class IconicReportApp extends StatelessWidget {
  const IconicReportApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Iconic Report App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        colorScheme: ColorScheme.light(
          brightness: Brightness.light,
          primary: AppColors.primary,
          secondary: AppColors.secondary,
          surface: AppColors.cardBackground,
          onPrimary: Colors.white,
          onSecondary: Colors.black,
          onSurface: AppColors.textPrimary,
          error: AppColors.error,
          onError: Colors.white,
        ),
        scaffoldBackgroundColor: AppColors.background,
        cardColor: AppColors.cardBackground,
        shadowColor: AppColors.shadowColor,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        colorScheme: ColorScheme.dark(
          brightness: Brightness.dark,
          primary: AppColors.primary,
          secondary: AppColors.secondary,
          surface: Colors.grey[850]!,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.white,
          error: AppColors.error,
          onError: Colors.black,
        ),
        scaffoldBackgroundColor: Colors.black,
        cardColor: Colors.grey[850],
        shadowColor: AppColors.shadowColor,
      ),
      themeMode: ThemeMode.system,
      initialRoute: RouteNames.splash,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
