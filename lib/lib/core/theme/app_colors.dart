/// BusZ Design System — Color Palette
///
/// Source of Truth: BusZ-Documentation/15_Assets/Color_Palette.md
///                  BusZ-Documentation/06_Flutter/02_Design_System.md
///
/// All colors in this file MUST match the documentation.
/// Do NOT add ad-hoc colors outside this system.
import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // ─── Brand Colors ───────────────────────────────────────────────
  /// Primary brand color — BusZ Red
  static const Color primary = Color(0xFFE53935);
  static const Color primaryDark = Color(0xFFC62828);
  static const Color primaryLight = Color(0xFFFFEBEE);

  /// Secondary — Blue
  static const Color secondary = Color(0xFF1565C0);
  static const Color secondaryLight = Color(0xFFE3F2FD);

  // ─── Semantic Colors ────────────────────────────────────────────
  static const Color success = Color(0xFF43A047);
  static const Color successLight = Color(0xFFE8F5E9);

  static const Color warning = Color(0xFFFB8C00);
  static const Color warningLight = Color(0xFFFFF3E0);

  static const Color error = Color(0xFFD32F2F);
  static const Color errorLight = Color(0xFFFFEBEE);

  static const Color info = Color(0xFF0288D1);
  static const Color infoLight = Color(0xFFE1F5FE);

  // ─── Neutral Colors ─────────────────────────────────────────────
  static const Color black = Color(0xFF212121);
  static const Color gray900 = Color(0xFF424242);
  static const Color gray700 = Color(0xFF616161);
  static const Color gray500 = Color(0xFF9E9E9E);
  static const Color gray300 = Color(0xFFE0E0E0);
  static const Color gray200 = Color(0xFFEEEEEE);
  static const Color gray100 = Color(0xFFF5F5F5);
  static const Color gray50 = Color(0xFFFAFAFA);
  static const Color white = Color(0xFFFFFFFF);

  // ─── Background Colors ──────────────────────────────────────────
  static const Color backgroundPrimary = Color(0xFFF7F9FC);
  static const Color backgroundSecondary = Color(0xFFF5F5F5);
  static const Color backgroundDisabled = Color(0xFFEEEEEE);

  // ─── Surface Colors ─────────────────────────────────────────────
  static const Color surfacePrimary = Color(0xFFFFFFFF);
  static const Color surfaceCard = Color(0xFFFFFFFF);
  static const Color surfaceDialog = Color(0xFFFFFFFF);

  // ─── Border Colors ──────────────────────────────────────────────
  static const Color borderLight = Color(0xFFEEEEEE);
  static const Color borderNormal = Color(0xFFE0E0E0);
  static const Color borderStrong = Color(0xFFBDBDBD);
  static const Color borderFocus = Color(0xFFE53935);
  static const Color borderError = Color(0xFFD32F2F);

  // ─── Text Colors ────────────────────────────────────────────────
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF616161);
  static const Color textHint = Color(0xFF9E9E9E);
  static const Color textDisabled = Color(0xFFBDBDBD);
  static const Color textWhite = Color(0xFFFFFFFF);
  static const Color textError = Color(0xFFD32F2F);
  static const Color textSuccess = Color(0xFF43A047);

  // ─── Booking / Seat Colors (Color_Palette.md §6) ────────────────
  static const Color seatAvailable = Color(0xFF4CAF50);
  static const Color seatSelected = Color(0xFF1976D2);
  static const Color seatBooked = Color(0xFFBDBDBD);
  static const Color seatVIP = Color(0xFFFFC107);
  static const Color seatFemale = Color(0xFFEC407A);
  static const Color seatBlocked = Color(0xFF757575);

  // ─── Payment Status Colors (Color_Palette.md §7) ────────────────
  static const Color paymentPending = Color(0xFFFFB300);
  static const Color paymentSuccess = Color(0xFF43A047);
  static const Color paymentFailed = Color(0xFFE53935);
  static const Color paymentRefunded = Color(0xFF8E24AA);

  // ─── Route Colors (Color_Palette.md §8) ─────────────────────────
  static const Color routeDeparture = Color(0xFF1565C0);
  static const Color routeArrival = Color(0xFF2E7D32);
  static const Color routeCheckpoint = Color(0xFFF57C00);

  // ─── Chart Colors (Color_Palette.md §9) ─────────────────────────
  static const List<Color> chartColors = [
    Color(0xFF1976D2),
    Color(0xFF43A047),
    Color(0xFFFB8C00),
    Color(0xFF8E24AA),
    Color(0xFFE53935),
    Color(0xFF00897B),
    Color(0xFF5E35B1),
    Color(0xFF3949AB),
  ];

  // ─── Gradient (Color_Palette.md §10) ────────────────────────────
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFFE53935), Color(0xFFC62828)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient blueGradient = LinearGradient(
    colors: [Color(0xFF42A5F5), Color(0xFF1976D2)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // ─── Dark Theme Colors (Color_Palette.md §11) ───────────────────
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkCard = Color(0xFF242424);
  static const Color darkPrimary = Color(0xFFEF5350);
  static const Color darkTextPrimary = Color(0xFFFFFFFF);
  static const Color darkTextSecondary = Color(0xFFB3B3B3);
  static const Color darkBorder = Color(0xFF333333);
}
