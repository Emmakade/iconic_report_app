import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import '../../../core/theme/app_colors.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_button.dart';
//import '../../../providers/report_provider.dart';

class SubmitReportScreen extends StatefulWidget {
  const SubmitReportScreen({super.key});

  @override
  State<SubmitReportScreen> createState() => _SubmitReportScreenState();
}

class _SubmitReportScreenState extends State<SubmitReportScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  bool _isSubmitting = false;
  bool success = true;

  void _submitReport() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSubmitting = true);

    //final reportProvider = Provider.of<ReportProvider>(context, listen: false);

    // final success = await reportProvider.submitReport(
    //   title: _titleController.text,
    //   description: _descriptionController.text,
    // );

    setState(() => _isSubmitting = false);

    if (success) {
      _titleController.clear();
      _descriptionController.clear();

      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.rightSlide,
        title: 'Success',
        desc: 'Report submitted successfully!',
        btnOkOnPress: () {},
      ).show();
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.leftSlide,
        title: 'Failed',
        desc: 'Could not submit report. Please try again.',
        btnOkOnPress: () {},
      ).show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Submit Report'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text(
                "Title",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 6),
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  hintText: "Enter title",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? "Title is required" : null,
              ),
              const SizedBox(height: 16),
              const Text(
                "Description",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 6),
              TextFormField(
                controller: _descriptionController,
                maxLines: 6,
                decoration: const InputDecoration(
                  hintText: "Enter detailed report",
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value == null || value.isEmpty
                    ? "Description is required"
                    : null,
              ),
              const SizedBox(height: 24),
              CustomButton(
                text: _isSubmitting ? "Submitting..." : "Submit",
                isLoading: _isSubmitting,
                onPressed: _submitReport,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
