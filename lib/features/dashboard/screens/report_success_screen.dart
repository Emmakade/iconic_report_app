// lib/features/dashboard/screens/report_success_screen.dart

import 'package:flutter/material.dart';
import '../../../../widgets/custom_button.dart';

class ReportSuccessScreen extends StatelessWidget {
  const ReportSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle_outline,
                  color: Colors.green, size: 100),
              const SizedBox(height: 20),
              const Text(
                'Report Submitted Successfully!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              CustomButton(
                text: "Back to Dashboard",
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                isLoading: false,
              )
            ],
          ),
        ),
      ),
    );
  }
}
