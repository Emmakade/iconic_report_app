import 'package:flutter/material.dart';

LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

/// Helper class for managing themes and colors.

// ignore_for_file: must_be_immutable
class ThemeHelper {
  // The current app theme
  final _appTheme = "lightCode";

  // A map of custom color themes supported by the app
  final Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors()
  };

  // A map of color schemes supported by the app
  final Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme
  };

  /// Returns the lightCode colors for the current theme.
  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
    );
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

class ColorSchemes {
  static const lightCodeColorScheme = ColorScheme.light();
}

class LightCodeColors {
  // App Colors
  Color get black => const Color(0xFF1E1E1E);
  Color get white => const Color(0xFFFFFFFF);
  Color get green600 => const Color(0xFF059669);
  Color get gray100 => const Color(0xFFF3F4F6);
  Color get gray800 => const Color(0xFF1F2937);
  Color get gray400 => const Color(0xFF9CA3AF);
  Color get gray200 => const Color(0xFFE5E7EB);
  Color get green500 => const Color(0xFF10B981);

  // Additional Colors
  Color get whiteCustom => Colors.white;
  Color get blackCustom => Colors.black;
  Color get transparentCustom => Colors.transparent;
  Color get greyCustom => Colors.grey;
  Color get colorFF66C6 => const Color(0xFF66C61C);
  Color get colorFF2627 => const Color(0xFF26272B);
  Color get colorFFF4F4 => const Color(0xFFF4F4F5);
  Color get colorFFE4E4 => const Color(0xFFE4E4E7);
  Color get colorFF4CA3 => const Color(0xFF4CA30D);
  Color get colorFFF3F4 => const Color(0xFFF3F4F6);
  Color get colorFF1F29 => const Color(0xFF1F2937);
  Color get colorFF9CA3 => const Color(0xFF9CA3AF);
  Color get colorFFE5E7 => const Color(0xFFE5E7EB);
  Color get colorFF10B9 => const Color(0xFF10B981);

  // Color Shades - Each shade has its own dedicated constant
  Color get grey200 => Colors.grey.shade200;
  Color get grey100 => Colors.grey.shade100;
}
