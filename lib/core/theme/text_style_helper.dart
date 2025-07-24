import 'package:flutter/material.dart';
import '../app_export.dart';
import 'theme_helper.dart';

/// A helper class for managing text styles in the application
class TextStyleHelper {
  static TextStyleHelper? _instance;

  TextStyleHelper._();

  static TextStyleHelper get instance {
    _instance ??= TextStyleHelper._();
    return _instance!;
  }

  // Headline Styles
  // Medium-large text styles for section headers

  TextStyle get headline24Black => TextStyle(
        fontSize: 24.fSize,
        fontWeight: FontWeight.w900,
        color: appTheme.colorFF2627,
      );

  TextStyle get headline24Medium => TextStyle(
        fontSize: 24.fSize,
        fontWeight: FontWeight.w500,
        color: appTheme.colorFF1F29,
      );

  // Title Styles
  // Medium text styles for titles and subtitles

  TextStyle get title20RegularRoboto => TextStyle(
        fontSize: 20.fSize,
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
      );

  TextStyle get title16Medium => TextStyle(
        fontSize: 16.fSize,
        fontWeight: FontWeight.w500,
        color: appTheme.colorFF1F29,
      );

  TextStyle get title16Black => TextStyle(
        fontSize: 16.fSize,
        fontWeight: FontWeight.w900,
        color: appTheme.colorFF66C6,
      );

  // Body Styles
  // Standard text styles for body content

  TextStyle get body12Black => TextStyle(
        fontSize: 12.fSize,
        fontWeight: FontWeight.w900,
        color: appTheme.colorFF10B9,
      );

  // Other Styles
  // Miscellaneous text styles without specified font size

  TextStyle get bodyTextMedium => const TextStyle(
        fontWeight: FontWeight.w500,
      );

  TextStyle get textStyle8 => const TextStyle();
}
