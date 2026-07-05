import 'package:flutter/material.dart';
import 'package:busz/core/theme/app_colors.dart';
import 'package:busz/core/theme/app_radius.dart';
import 'package:busz/core/theme/app_shadows.dart';
import 'package:busz/core/theme/app_spacing.dart';

/// Shared card foundation for BusZ UI.
///
/// Use this as the visual shell for feature cards so radius, border, shadow
/// and tap animation stay consistent across the whole app.
class BaseCard extends StatelessWidget {
  const BaseCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding = const EdgeInsets.all(AppSpacing.cardPadding),
    this.margin = EdgeInsets.zero,
    this.borderRadius,
    this.backgroundColor = AppColors.surfaceCard,
    this.borderColor = AppColors.borderLight,
    this.shadow,
    this.width,
    this.height,
    this.clipBehavior = Clip.antiAlias,
  });

  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final BorderRadius? borderRadius;
  final Color backgroundColor;
  final Color borderColor;
  final List<BoxShadow>? shadow;
  final double? width;
  final double? height;
  final Clip clipBehavior;

  @override
  Widget build(BuildContext context) {
    final radius = borderRadius ?? AppRadius.card;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      curve: Curves.easeOut,
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: radius,
        border: Border.all(color: borderColor),
        boxShadow: shadow ?? AppShadows.soft,
      ),
      clipBehavior: clipBehavior,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          borderRadius: radius,
          child: Padding(
            padding: padding,
            child: child,
          ),
        ),
      ),
    );
  }
}
