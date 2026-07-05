import 'package:flutter/material.dart';
import 'package:busz/core/theme/app_radius.dart';

class AppFilterChip extends StatelessWidget {
  const AppFilterChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onTap,
      borderRadius: AppRadius.pillAll,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 11),
        decoration: BoxDecoration(
          color: selected ? colorScheme.primary : colorScheme.surface,
          borderRadius: AppRadius.pillAll,
          border: Border.all(
            color: selected ? colorScheme.primary : colorScheme.outlineVariant,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.white : colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
