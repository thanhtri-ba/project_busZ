import 'package:flutter/material.dart';
import 'package:busz/core/theme/app_colors.dart';
import 'package:busz/core/theme/app_radius.dart';
import 'package:busz/core/theme/app_spacing.dart';
import 'package:busz/core/widgets/base/base_card.dart';

class PromoCard extends StatelessWidget {
  const PromoCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.badgeText,
    this.icon = Icons.local_offer_rounded,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final String? badgeText;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      onTap: onTap,
      padding: const EdgeInsets.all(AppSpacing.lg),
      borderRadius: AppRadius.cardLarge,
      backgroundColor: AppColors.accentLight,
      borderColor: AppColors.accent.withValues(alpha: 0.18),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.white.withValues(alpha: 0.8),
              borderRadius: AppRadius.largeAll,
            ),
            child: Icon(icon, color: AppColors.warning),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: AppSpacing.xxs),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textSecondary),
                ),
              ],
            ),
          ),
          if (badgeText != null) ...[
            const SizedBox(width: AppSpacing.sm),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: AppRadius.pillAll,
              ),
              child: Text(
                badgeText!,
                style: const TextStyle(
                  color: AppColors.warning,
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
