import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:busz/core/theme/app_colors.dart';
import 'package:busz/core/theme/app_radius.dart';
import 'package:busz/core/theme/app_spacing.dart';
import 'package:busz/core/theme/app_text_styles.dart';

class AuthScaffold extends StatelessWidget {
  const AuthScaffold({
    super.key,
    required this.child,
    this.showBackButton = true,
    this.padding = const EdgeInsets.symmetric(
      horizontal: AppSpacing.xl,
      vertical: AppSpacing.md,
    ),
  });

  final Widget child;
  final bool showBackButton;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      body: Stack(
        children: [
          const _AuthBackground(),
          SafeArea(
            child: Column(
              children: [
                if (showBackButton)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 4, 8, 0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton.filledTonal(
                        onPressed: () {
                          if (context.canPop()) {
                            context.pop();
                          }
                        },
                        icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
                      ),
                    ),
                  )
                else
                  const SizedBox(height: AppSpacing.lg),
                Expanded(
                  child: SingleChildScrollView(
                    padding: padding,
                    child: child,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.badgeText = 'BUSZ',
    this.icon = Icons.directions_bus_filled_rounded,
  });

  final String title;
  final String subtitle;
  final String badgeText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.primaryLight,
            borderRadius: AppRadius.pillAll,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: AppColors.primary, size: 18),
              const SizedBox(width: 8),
              Text(
                badgeText,
                style: AppTextStyles.label.copyWith(
                  color: AppColors.primaryDark,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.xl),
        Text(title, style: AppTextStyles.displayMedium),
        const SizedBox(height: AppSpacing.sm),
        Text(
          subtitle,
          style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondary),
        ),
      ],
    );
  }
}

class AuthCard extends StatelessWidget {
  const AuthCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(AppSpacing.lg),
  });

  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        color: AppColors.surfacePrimary.withValues(alpha: 0.92),
        borderRadius: AppRadius.cardLarge,
        border: Border.all(color: AppColors.white.withValues(alpha: 0.72)),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.08),
            blurRadius: 30,
            offset: const Offset(0, 18),
          ),
        ],
      ),
      child: child,
    );
  }
}

class SocialAuthButton extends StatelessWidget {
  const SocialAuthButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
    this.iconColor,
  });

  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: AppRadius.button,
      child: Container(
        height: AppSpacing.buttonHeight,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.surfacePrimary,
          borderRadius: AppRadius.button,
          border: Border.all(color: AppColors.borderNormal),
        ),
        child: Row(
          children: [
            Icon(icon, color: iconColor ?? AppColors.textPrimary, size: 24),
            Expanded(
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: AppTextStyles.button.copyWith(color: AppColors.textPrimary),
              ),
            ),
            const SizedBox(width: 24),
          ],
        ),
      ),
    );
  }
}

class AuthDivider extends StatelessWidget {
  const AuthDivider({super.key, this.text = 'Or'});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: AppColors.borderNormal)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          child: Text(
            text,
            style: AppTextStyles.caption.copyWith(color: AppColors.textHint),
          ),
        ),
        const Expanded(child: Divider(color: AppColors.borderNormal)),
      ],
    );
  }
}

class _AuthBackground extends StatelessWidget {
  const _AuthBackground();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(gradient: AppColors.heroGradient),
      child: Stack(
        children: [
          Positioned(
            top: -90,
            right: -70,
            child: _Blob(size: 210, color: AppColors.primary.withValues(alpha: 0.18)),
          ),
          Positioned(
            bottom: -80,
            left: -80,
            child: _Blob(size: 230, color: AppColors.accent.withValues(alpha: 0.16)),
          ),
        ],
      ),
    );
  }
}

class _Blob extends StatelessWidget {
  const _Blob({required this.size, required this.color});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}
