import 'package:flutter/material.dart';
import 'package:busz/core/theme/app_colors.dart';
import 'package:busz/core/widgets/base/base_button.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.height = 56,
    this.isExpanded = true,
  });

  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;
  final double height;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      label: text,
      onPressed: onPressed,
      icon: icon,
      height: height,
      isExpanded: isExpanded,
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.primary,
      borderColor: AppColors.borderStrong,
    );
  }
}
