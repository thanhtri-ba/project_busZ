import 'package:flutter/material.dart';
import 'package:busz/core/widgets/base/base_button.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.isLoading = false,
    this.height = 56,
    this.isExpanded = true,
  });

  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool isLoading;
  final double height;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      label: text,
      onPressed: onPressed,
      icon: icon,
      isLoading: isLoading,
      height: height,
      isExpanded: isExpanded,
    );
  }
}
