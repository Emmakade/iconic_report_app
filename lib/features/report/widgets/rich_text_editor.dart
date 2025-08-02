import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

import '../../../core/app_export.dart';

class RichTextEditor extends StatelessWidget {
  final QuillController controller;
  final Function() onTextChanged;

  const RichTextEditor({
    super.key,
    required this.controller,
    required this.onTextChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Description', style: TextStyleHelper.instance.title16Medium),
      SizedBox(height: 16.h),
      Container(
          decoration: BoxDecoration(
              border: Border.all(color: appTheme.colorFFE5E7),
              borderRadius: BorderRadius.circular(12.h)),
          child: Column(children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 4.h),
                decoration: BoxDecoration(
                    color: appTheme.colorFFF3F4,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.h),
                        topRight: Radius.circular(12.h))),
                child: QuillSimpleToolbar(controller: controller)),
            Container(
                height: 200.h,
                padding: EdgeInsets.all(16.h),
                child: QuillEditor.basic(controller: controller)),
          ])),
    ]);
  }
}
