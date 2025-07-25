import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_button.dart';
import '../provider/report_add_provider.dart';
import '../widgets/incident_type_selector.dart';
import '../widgets/photo_upload_section.dart';

class ReportAddDashboard extends StatefulWidget {
  const ReportAddDashboard({super.key});

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<ReportAddProvider>(
      create: (context) => ReportAddProvider()..initialize(),
      child: const ReportAddDashboard(),
    );
  }

  @override
  State<ReportAddDashboard> createState() => _ReportAddDashboardState();
}

class _ReportAddDashboardState extends State<ReportAddDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.whiteCustom,
      appBar: _buildAppBar(),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomActions(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: appTheme.whiteCustom,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Text(
        'Add Report',
        style: TextStyleHelper.instance.title16Black.copyWith(
          color: appTheme.colorFF1F29,
          fontSize: 18.fSize,
        ),
      ),
      actions: [
        Consumer<ReportAddProvider>(
          builder: (context, provider, child) {
            return IconButton(
              icon: Icon(
                Icons.close,
                color: appTheme.colorFF1F29,
                size: 24.h,
              ),
              onPressed: provider.cancelReport,
            );
          },
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Consumer<ReportAddProvider>(
      builder: (context, provider, child) {
        return SingleChildScrollView(
          padding: EdgeInsets.all(24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IncidentTypeSelector(
                selectedType: provider.reportModel.selectedIncidentType,
                onTypeSelected: provider.selectIncidentType,
              ),
              SizedBox(height: 32.h),
              _buildLocationField(provider),
              SizedBox(height: 32.h),
              _buildQuillEditor(provider),
              SizedBox(height: 32.h),
              PhotoUploadSection(
                photoPaths: provider.reportModel.photoPaths ?? [],
                onPickImage: provider.pickImage,
                onPickMultipleImages: provider.pickMultipleImages,
                onRemovePhoto: provider.removePhoto,
              ),
              SizedBox(height: 24.h),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLocationField(ReportAddProvider provider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Location',
          style: TextStyleHelper.instance.title16Medium,
        ),
        SizedBox(height: 16.h),
        TextFormField(
          controller: provider.locationController,
          onChanged: (value) => provider.updateLocation(value),
          decoration: InputDecoration(
            hintText: 'Enter location details',
            hintStyle: TextStyleHelper.instance.title16Medium.copyWith(
              color: appTheme.colorFF9CA3,
              fontSize: 14.fSize,
            ),
            filled: true,
            fillColor: appTheme.whiteCustom,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.h),
              borderSide: BorderSide(color: appTheme.colorFFE5E7),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.h),
              borderSide: BorderSide(color: appTheme.colorFFE5E7),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.h),
              borderSide: BorderSide(color: appTheme.colorFF10B9),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.h,
              vertical: 16.h,
            ),
          ),
          style: TextStyleHelper.instance.title16Medium.copyWith(
            fontSize: 14.fSize,
          ),
        ),
      ],
    );
  }

  Widget _buildQuillEditor(ReportAddProvider provider) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: appTheme.colorFFE5E7),
        borderRadius: BorderRadius.circular(12.h),
      ),
      child: QuillEditor(
        controller: provider.quillController,
        focusNode: FocusNode(),
        scrollController: ScrollController(),
      ),
    );
  }

  Widget _buildBottomActions() {
    return Consumer<ReportAddProvider>(
      builder: (context, provider, child) {
        return Container(
          padding: EdgeInsets.all(24.h),
          decoration: BoxDecoration(
            color: appTheme.whiteCustom,
            border: Border(
              top: BorderSide(
                color: appTheme.colorFFE5E7,
                width: 1.h,
              ),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      text: 'Cancel',
                      onPressed: provider.reportModel.isSubmitting
                          ? null
                          : provider.cancelReport,
                      backgroundColor: appTheme.colorFFF3F4,
                      textColor: appTheme.colorFF9CA3,
                      borderColor: appTheme.colorFFE5E7,
                    ),
                  ),
                  SizedBox(width: 16.h),
                  Expanded(
                    flex: 2,
                    child: CustomButton(
                      text: provider.reportModel.isSubmitting
                          ? 'Submitting...'
                          : 'Submit Report',
                      onPressed: provider.reportModel.isFormValid &&
                              !provider.reportModel.isSubmitting
                          ? provider.submitReport
                          : null,
                      backgroundColor: provider.reportModel.isFormValid
                          ? appTheme.colorFF10B9
                          : appTheme.colorFFF3F4,
                      textColor: provider.reportModel.isFormValid
                          ? appTheme.whiteCustom
                          : appTheme.colorFF9CA3,
                      borderColor: provider.reportModel.isFormValid
                          ? appTheme.colorFF10B9
                          : appTheme.colorFFE5E7,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
