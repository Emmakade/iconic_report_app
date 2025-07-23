import 'package:flutter/material.dart';
import 'routes/app_routes.dart';
import 'routes/route_names.dart';

void main() {
  runApp(const IconicReportApp());
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
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00509E), // Primary color from design
          surface: Colors.white,
          onSurface: Colors.black87,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00509E),
          surface: Colors.black,
          onSurface: Colors.white70,
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      initialRoute: RouteNames.splash,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
