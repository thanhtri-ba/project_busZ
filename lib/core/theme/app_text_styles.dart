import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:busz/core/theme/app_colors.dart';

/// BusZ UI Kit — typography tokens.
class AppTextStyles {
  AppTextStyles._();

  static String get _fontFamily => GoogleFonts.inter().fontFamily!;

  static TextStyle _style({
    required double size,
    required FontWeight weight,
    required double height,
    Color color = AppColors.textPrimary,
    double letterSpacing = 0,
  }) {
    return TextStyle(
      fontFamily: _fontFamily,
      fontSize: size,
      fontWeight: weight,
      height: height,
      color: color,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle get displayLarge => _style(size: 34, weight: FontWeight.w800, height: 1.18, letterSpacing: -0.7);
  static TextStyle get displayMedium => _style(size: 30, weight: FontWeight.w800, height: 1.2, letterSpacing: -0.5);
  static TextStyle get headline => _style(size: 24, weight: FontWeight.w800, height: 1.25, letterSpacing: -0.25);
  static TextStyle get headlineSmall => _style(size: 22, weight: FontWeight.w700, height: 1.27, letterSpacing: -0.2);

  static TextStyle get titleLarge => _style(size: 20, weight: FontWeight.w700, height: 1.35, letterSpacing: -0.15);
  static TextStyle get titleMedium => _style(size: 18, weight: FontWeight.w700, height: 1.35, letterSpacing: -0.1);
  static TextStyle get titleSmall => _style(size: 16, weight: FontWeight.w700, height: 1.45);

  static TextStyle get bodyLarge => _style(size: 16, weight: FontWeight.w400, height: 1.55);
  static TextStyle get bodyMedium => _style(size: 14, weight: FontWeight.w400, height: 1.5);
  static TextStyle get bodySmall => _style(size: 12, weight: FontWeight.w400, height: 1.45, color: AppColors.textSecondary);

  static TextStyle get caption => _style(size: 12, weight: FontWeight.w400, height: 1.4, color: AppColors.textHint);
  static TextStyle get captionSmall => _style(size: 10, weight: FontWeight.w500, height: 1.3, color: AppColors.textHint);

  static TextStyle get button => _style(size: 16, weight: FontWeight.w700, height: 1.45, color: AppColors.textWhite);
  static TextStyle get buttonSmall => _style(size: 14, weight: FontWeight.w700, height: 1.4, color: AppColors.textWhite);

  static TextStyle get label => _style(size: 14, weight: FontWeight.w600, height: 1.4);
  static TextStyle get labelSmall => _style(size: 12, weight: FontWeight.w600, height: 1.3, color: AppColors.textSecondary);
}
