import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/dashboard_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Dashboard'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome back!',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Here’s what you can do today:',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.count(
                crossAxisCount: screenWidth > 600 ? 3 : 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: const [
                  DashboardCard(
                    title: 'Submit Report',
                    icon: Icons.report,
                    route: '/submit-report',
                  ),
                  DashboardCard(
                    title: 'My Reports',
                    icon: Icons.list_alt,
                    route: '/my-reports',
                  ),
                  DashboardCard(
                    title: 'Profile',
                    icon: Icons.person_outline,
                    route: '/profile',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
