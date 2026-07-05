/// BusZ Design System — Typography
///
/// Source of Truth: BusZ-Documentation/06_Flutter/02_Design_System.md §5-6
///                  BusZ-Documentation/02_UI/04_Typography.md
///
/// Font: Inter (primary), Roboto (fallback)
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:busz/core/theme/app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static String get _fontFamily => GoogleFonts.inter().fontFamily!;

  // ─── Display ────────────────────────────────────────────────────
  /// 32 / Bold — Hero titles, large numbers
  static TextStyle get displayLarge => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
        height: 1.25,
      );

  // ─── Headline ───────────────────────────────────────────────────
  /// 24 / Bold — Section headers
  static TextStyle get headline => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
        height: 1.33,
      );

  // ─── Title ──────────────────────────────────────────────────────
  /// 20 / SemiBold — Card titles, screen titles
  static TextStyle get titleLarge => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
        height: 1.4,
      );

  /// 18 / SemiBold
  static TextStyle get titleMedium => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
        height: 1.33,
      );

  /// 16 / SemiBold
  static TextStyle get titleSmall => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
        height: 1.5,
      );

  // ─── Body ───────────────────────────────────────────────────────
  /// 16 / Regular — Primary body text
  static TextStyle get bodyLarge => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: AppColors.textPrimary,
        height: 1.5,
      );

  /// 14 / Regular — Secondary body text
  static TextStyle get bodyMedium => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: AppColors.textPrimary,
        height: 1.43,
      );

  /// 12 / Regular — Supporting text
  static TextStyle get bodySmall => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: AppColors.textSecondary,
        height: 1.33,
      );

  // ─── Caption ────────────────────────────────────────────────────
  /// 12 / Regular — Labels, timestamps, metadata
  static TextStyle get caption => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: AppColors.textHint,
        height: 1.33,
      );

  /// 10 / Regular — Smallest text (badges, fine print)
  static TextStyle get captionSmall => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 10,
        fontWeight: FontWeight.normal,
        color: AppColors.textHint,
        height: 1.4,
      );

  // ─── Button ─────────────────────────────────────────────────────
  /// 16 / Medium — Primary button text
  static TextStyle get button => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.textWhite,
        height: 1.5,
      );

  /// 14 / Medium — Secondary/small button text
  static TextStyle get buttonSmall => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.textWhite,
        height: 1.43,
      );

  // ─── Label ──────────────────────────────────────────────────────
  /// 14 / Medium — Form labels, chip text
  static TextStyle get label => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.textPrimary,
        height: 1.43,
      );

  /// 12 / Medium — Small labels
  static TextStyle get labelSmall => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppColors.textSecondary,
        height: 1.33,
      );
}
