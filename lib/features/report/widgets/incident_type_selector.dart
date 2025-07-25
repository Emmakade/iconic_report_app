import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../models/report_add_model.dart';

class IncidentTypeSelector extends StatelessWidget {
  final IncidentType? selectedType;
  final Function(IncidentType) onTypeSelected;

  const IncidentTypeSelector({
    super.key,
    required this.selectedType,
    required this.onTypeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'What are you reporting?',
          style: TextStyleHelper.instance.title16Medium,
        ),
        SizedBox(height: 16.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildIncidentTypeItem(
                IncidentType.dumpedRubbish,
                Icons.delete_outline,
                'Dumped\nRubbish',
              ),
              SizedBox(width: 16.h),
              _buildIncidentTypeItem(
                IncidentType.graffitiVandalism,
                Icons.brush,
                'Graffiti or\nVandalism',
              ),
              SizedBox(width: 16.h),
              _buildIncidentTypeItem(
                IncidentType.pedestrianHazard,
                Icons.directions_walk,
                'Pedestrian\nHazard',
              ),
              SizedBox(width: 16.h),
              _buildIncidentTypeItem(
                IncidentType.trafficIssue,
                Icons.directions_car,
                'Traffic\nIssue',
              ),
              SizedBox(width: 16.h),
              _buildIncidentTypeItem(
                IncidentType.other,
                Icons.error_outline,
                'Other',
              ),
            ],
          ),
        ),
        if (selectedType == IncidentType.other) ...[
          SizedBox(height: 16.h),
          Text(
            'If answering \'Other\', please provide details in the description.',
            style: TextStyleHelper.instance.title16Medium.copyWith(
              color: appTheme.colorFF9CA3,
              fontSize: 14.fSize,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildIncidentTypeItem(
    IncidentType type,
    IconData icon,
    String label,
  ) {
    final bool isSelected = selectedType == type;

    return GestureDetector(
      onTap: () => onTypeSelected(type),
      child: Container(
        width: 80.h,
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.h),
        decoration: BoxDecoration(
          color: isSelected
              ? appTheme.colorFF10B9.withAlpha(26)
              : appTheme.whiteCustom,
          border: Border.all(
            color: isSelected ? appTheme.colorFF10B9 : appTheme.colorFFE5E7,
            width: 2.h,
          ),
          borderRadius: BorderRadius.circular(12.h),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(12.h),
              decoration: BoxDecoration(
                color: isSelected ? appTheme.colorFF10B9 : appTheme.colorFFF3F4,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 24.h,
                color: isSelected ? appTheme.whiteCustom : appTheme.colorFF9CA3,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyleHelper.instance.title16Medium.copyWith(
                fontSize: 12.fSize,
                color: isSelected ? appTheme.colorFF10B9 : appTheme.colorFF9CA3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
