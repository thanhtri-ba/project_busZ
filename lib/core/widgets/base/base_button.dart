import 'package:flutter/material.dart';
import 'package:busz/core/theme/app_colors.dart';
import 'package:busz/core/theme/app_radius.dart';
import 'package:busz/core/theme/app_spacing.dart';

/// Shared button foundation for BusZ UI.
class BaseButton extends StatelessWidget {
  const BaseButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
    this.isLoading = false,
    this.isExpanded = true,
    this.height = AppSpacing.buttonHeight,
    this.backgroundColor = AppColors.primary,
    this.foregroundColor = AppColors.white,
    this.borderColor,
    this.elevation = 0,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool isLoading;
  final bool isExpanded;
  final double height;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color? borderColor;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    final buttonChild = isLoading
        ? SizedBox(
            width: 22,
            height: 22,
            child: CircularProgressIndicator(
              strokeWidth: 2.4,
              valueColor: AlwaysStoppedAnimation<Color>(foregroundColor),
            ),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(icon, size: 20),
                const SizedBox(width: AppSpacing.xs),
              ],
              Flexible(child: Text(label, overflow: TextOverflow.ellipsis)),
            ],
          );

    return SizedBox(
      width: isExpanded ? double.infinity : null,
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          disabledBackgroundColor: AppColors.backgroundDisabled,
          disabledForegroundColor: AppColors.textDisabled,
          elevation: elevation,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: AppRadius.button,
            side: borderColor == null ? BorderSide.none : BorderSide(color: borderColor!),
          ),
        ),
        child: buttonChild,
      ),
    );
  }
}
