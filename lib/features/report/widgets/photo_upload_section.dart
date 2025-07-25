import 'dart:io';

import 'package:flutter/material.dart';

import '../../../core/app_export.dart';

class PhotoUploadSection extends StatelessWidget {
  final List<String> photoPaths;
  final VoidCallback onPickImage;
  final VoidCallback onPickMultipleImages;
  final Function(int) onRemovePhoto;

  const PhotoUploadSection({
    super.key,
    required this.photoPaths,
    required this.onPickImage,
    required this.onPickMultipleImages,
    required this.onRemovePhoto,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Photos',
              style: TextStyleHelper.instance.title16Medium,
            ),
            SizedBox(width: 8.h),
            Text(
              '(optional)',
              style: TextStyleHelper.instance.title16Medium.copyWith(
                color: appTheme.colorFF9CA3,
                fontSize: 14.fSize,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        if (photoPaths.isEmpty) ...[
          _buildPhotoPickerButtons(),
        ] else ...[
          _buildPhotoGrid(),
          SizedBox(height: 16.h),
          _buildPhotoPickerButtons(),
        ],
      ],
    );
  }

  Widget _buildPhotoPickerButtons() {
    return Container(
      padding: EdgeInsets.all(16.h),
      decoration: BoxDecoration(
        border: Border.all(
          color: appTheme.colorFFE5E7,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(12.h),
      ),
      child: Column(
        children: [
          Icon(
            Icons.add_photo_alternate_outlined,
            size: 48.h,
            color: appTheme.colorFF9CA3,
          ),
          SizedBox(height: 12.h),
          Text(
            'Add photos to support your report',
            style: TextStyleHelper.instance.title16Medium.copyWith(
              color: appTheme.colorFF9CA3,
              fontSize: 14.fSize,
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: onPickImage,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    decoration: BoxDecoration(
                      color: appTheme.colorFFF3F4,
                      border: Border.all(color: appTheme.colorFFE5E7),
                      borderRadius: BorderRadius.circular(8.h),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.camera_alt_outlined,
                          size: 20.h,
                          color: appTheme.colorFF9CA3,
                        ),
                        SizedBox(width: 8.h),
                        Text(
                          'Single Photo',
                          style:
                              TextStyleHelper.instance.title16Medium.copyWith(
                            fontSize: 14.fSize,
                            color: appTheme.colorFF1F29,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.h),
              Expanded(
                child: GestureDetector(
                  onTap: onPickMultipleImages,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    decoration: BoxDecoration(
                      color: appTheme.colorFFF3F4,
                      border: Border.all(color: appTheme.colorFFE5E7),
                      borderRadius: BorderRadius.circular(8.h),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.photo_library_outlined,
                          size: 20.h,
                          color: appTheme.colorFF9CA3,
                        ),
                        SizedBox(width: 8.h),
                        Text(
                          'Multiple Photos',
                          style:
                              TextStyleHelper.instance.title16Medium.copyWith(
                            fontSize: 14.fSize,
                            color: appTheme.colorFF1F29,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoGrid() {
    return SizedBox(
      height: 120.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: photoPaths.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(right: 12.h),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.h),
                  child: Image.file(
                    File(photoPaths[index]),
                    width: 120.h,
                    height: 120.h,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 4.h,
                  right: 4.h,
                  child: GestureDetector(
                    onTap: () => onRemovePhoto(index),
                    child: Container(
                      padding: EdgeInsets.all(4.h),
                      decoration: BoxDecoration(
                        color: appTheme.blackCustom.withAlpha(179),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.close,
                        size: 16.h,
                        color: appTheme.whiteCustom,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
