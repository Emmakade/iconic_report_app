import 'package:flutter/material.dart';
import '../../../../widgets/custom_app_bar.dart';
import '../../../../widgets/loading_overlay.dart';
import '../../../../core/theme/app_colors.dart';

class ReportHistoryScreen extends StatefulWidget {
  const ReportHistoryScreen({Key? key}) : super(key: key);

  @override
  State<ReportHistoryScreen> createState() => _ReportHistoryScreenState();
}

class _ReportHistoryScreenState extends State<ReportHistoryScreen> {
  bool _isLoading = true;
  List<Map<String, String>> _reportList = [];

  @override
  void initState() {
    super.initState();
    _fetchReports();
  }

  Future<void> _fetchReports() async {
    await Future.delayed(const Duration(seconds: 2)); // simulate delay

    // Mock report data
    _reportList = [
      {
        'title': 'Network Outage in Area A',
        'date': '2025-07-21',
        'status': 'Resolved',
      },
      {
        'title': 'Power Surge Complaint',
        'date': '2025-07-18',
        'status': 'Pending',
      },
    ];

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Report History"),
      body: LoadingOverlay(
        isLoading: _isLoading,
        child: _reportList.isEmpty
            ? const Center(
                child: Text(
                  'No reports submitted yet.',
                  style: TextStyle(fontSize: 16),
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: _reportList.length,
                itemBuilder: (context, index) {
                  final report = _reportList[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      leading: const Icon(Icons.description_outlined),
                      title: Text(report['title']!),
                      subtitle: Text('Date: ${report['date']}'),
                      trailing: Text(
                        report['status']!,
                        style: TextStyle(
                          color: report['status'] == 'Resolved'
                              ? AppColors.success
                              : AppColors.warning,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
