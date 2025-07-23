import 'package:flutter/material.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/loading_overlay.dart';

class ViewReportScreen extends StatelessWidget {
  final String title;
  final String description;
  final DateTime submittedAt;

  const ViewReportScreen({
    Key? key,
    required this.title,
    required this.description,
    required this.submittedAt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('View Report')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Text(
              'Submitted on: ${submittedAt.toLocal()}'.split(' ')[0],
              style: const TextStyle(color: Colors.grey),
            ),
            const Spacer(),
            CustomButton(
              text: "Close",
              onPressed: () => Navigator.pop(context),
              isLoading: false,
            )
          ],
        ),
      ),
    );
  }
}
