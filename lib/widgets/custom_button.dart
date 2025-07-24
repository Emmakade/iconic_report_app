import 'package:flutter/material.dart';

import '../core/app_export.dart';

/// CustomButton - A reusable button component with customizable styling
///
/// @param text - The text to display on the button
/// @param onPressed - Callback function when button is pressed
/// @param backgroundColor - Background color of the button
/// @param textColor - Color of the button text
/// @param borderColor - Color of the button border
/// @param borderRadius - Border radius of the button
/// @param padding - Internal padding of the button
/// @param fontSize - Font size of the button text
/// @param fontWeight - Font weight of the button text
/// @param isEnabled - Whether the button is enabled or disabled
class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.fontSize,
    this.fontWeight,
    this.isEnabled,
  });

  /// The text to display on the button
  final String text;

  /// Callback function when button is pressed
  final VoidCallback? onPressed;

  /// Background color of the button
  final Color? backgroundColor;

  /// Color of the button text
  final Color? textColor;

  /// Color of the button border
  final Color? borderColor;

  /// Border radius of the button
  final double? borderRadius;

  /// Internal padding of the button
  final EdgeInsets? padding;

  /// Font size of the button text
  final double? fontSize;

  /// Font weight of the button text
  final FontWeight? fontWeight;

  /// Whether the button is enabled or disabled
  final bool? isEnabled;

  @override
  Widget build(BuildContext context) {
    final bool buttonEnabled = isEnabled ?? true;
    final Color defaultBackgroundColor =
        backgroundColor ?? const Color(0xFFF3F4F6);
    final Color defaultTextColor = textColor ?? const Color(0xFF10B981);
    final Color defaultBorderColor = borderColor ?? const Color(0xFFE5E7EB);
    final double defaultBorderRadius = borderRadius ?? 16.h;
    final EdgeInsets defaultPadding =
        padding ?? EdgeInsets.symmetric(horizontal: 24.h, vertical: 8.h);
    final double defaultFontSize = fontSize ?? 16.fSize;
    final FontWeight defaultFontWeight = fontWeight ?? FontWeight.w900;

    return ElevatedButton(
      onPressed: buttonEnabled ? onPressed : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: defaultBackgroundColor,
        foregroundColor: defaultTextColor,
        elevation: 0,
        padding: defaultPadding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(defaultBorderRadius),
          side: BorderSide(
            color: defaultBorderColor,
            width: 1.h,
          ),
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: Size.zero,
      ),
      child: Text(
        text,
        style: TextStyleHelper.instance.textStyle8,
      ),
    );
  }
}
