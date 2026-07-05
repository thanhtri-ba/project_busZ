/// BusZ Design System — Border Radius Tokens
///
/// Source of Truth: BusZ-Documentation/06_Flutter/02_Design_System.md §8
///                  BusZ-Documentation/02_UI/02_Design_System.md §5
import 'package:flutter/material.dart';

class AppRadius {
  AppRadius._();

  // ─── Values ─────────────────────────────────────────────────────
  static const double small = 8;
  static const double medium = 12;
  static const double large = 16;
  static const double extraLarge = 24;
  static const double pill = 999;

  // ─── BorderRadius shortcuts ─────────────────────────────────────
  static final BorderRadius smallAll = BorderRadius.circular(small);
  static final BorderRadius mediumAll = BorderRadius.circular(medium);
  static final BorderRadius largeAll = BorderRadius.circular(large);
  static final BorderRadius extraLargeAll = BorderRadius.circular(extraLarge);
  static final BorderRadius pillAll = BorderRadius.circular(pill);

  // ─── Component-specific ─────────────────────────────────────────
  /// Cards (radius 16)
  static final BorderRadius card = BorderRadius.circular(large);

  /// Buttons (radius 12)
  static final BorderRadius button = BorderRadius.circular(medium);

  /// Bottom Sheet (top corners only, radius 24)
  static const BorderRadius bottomSheet = BorderRadius.only(
    topLeft: Radius.circular(24),
    topRight: Radius.circular(24),
  );

  /// Input fields (radius 12)
  static final BorderRadius input = BorderRadius.circular(medium);

  /// Dialog (radius 24)
  static final BorderRadius dialog = BorderRadius.circular(extraLarge);
}
