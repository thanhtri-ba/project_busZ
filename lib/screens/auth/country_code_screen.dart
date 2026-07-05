import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:busz/core/theme/app_colors.dart';
import 'package:busz/core/theme/app_text_styles.dart';
import 'package:busz/core/theme/app_spacing.dart';

class CountryCodeScreen extends StatelessWidget {
  const CountryCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfacePrimary,
      appBar: AppBar(
        backgroundColor: AppColors.surfacePrimary,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20, color: AppColors.textPrimary),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Select region',
          style: AppTextStyles.titleSmall.copyWith(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: AppColors.borderLight, height: 1.0),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSpacing.xl),
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.backgroundSecondary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: AppTextStyles.bodyLarge.copyWith(color: AppColors.textHint),
                  prefixIcon: const Icon(Icons.search, color: AppColors.textHint),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl, vertical: AppSpacing.xs),
                  child: Text(
                    'Popular',
                    style: AppTextStyles.titleSmall.copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
                _buildItem(context, 'Indonesia', '+62', '🇮🇩', false),
                _buildItem(context, 'United States', '+1', '🇺🇸', true),
                _buildItem(context, 'Japan', '+81', '🇯🇵', false),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl, vertical: AppSpacing.xs),
                  child: Text(
                    'A',
                    style: AppTextStyles.titleSmall.copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
                _buildItem(context, 'Afghanistan', '+93', '🇦🇫', false),
                _buildItem(context, 'Albania', '+355', '🇦🇱', false),
                _buildItem(context, 'Algeria', '+213', '🇩🇿', false),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context, String name, String code, String flag, bool isSelected) {
    return InkWell(
      onTap: () {
        context.pop(code);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl, vertical: AppSpacing.md),
        child: Row(
          children: [
            Text(flag, style: const TextStyle(fontSize: 20)),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Text(
                name,
                style: AppTextStyles.bodyLarge.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Text(
              code,
              style: AppTextStyles.bodyLarge.copyWith(
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            if (isSelected)
              const Icon(Icons.check, color: AppColors.primary, size: 20)
            else
              const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
