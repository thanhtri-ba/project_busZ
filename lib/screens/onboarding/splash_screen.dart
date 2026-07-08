import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:go_router/go_router.dart';
import 'package:busz/shared/pref_helper.dart';
import 'package:busz/core/theme/app_colors.dart';
import 'package:busz/core/theme/app_text_styles.dart';
import 'package:busz/core/theme/app_spacing.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  Future<void> _checkAuth() async {
    await Future.delayed(const Duration(seconds: 2));

    final hasSeenOnboarding = await PrefHelper.isOnboardingSeen();
    final token = await PrefHelper.getAccessToken();

    if (!mounted) return;

    if (token != null) {
      context.go('/home');
    } else if (hasSeenOnboarding) {
      context.go('/auth');
    } else {
      context.go('/onboarding');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfacePrimary,
      body: Center(
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Logo Placeholder (Speed lines + Icon)
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(width: 16, height: 4, decoration: BoxDecoration(color: AppColors.primaryLight, borderRadius: BorderRadius.circular(2))),
                  const SizedBox(height: 4),
                  Container(width: 24, height: 4, decoration: BoxDecoration(color: AppColors.primaryLight, borderRadius: BorderRadius.circular(2))),
                  const SizedBox(height: 4),
                  Container(width: 12, height: 4, decoration: BoxDecoration(color: AppColors.primaryLight, borderRadius: BorderRadius.circular(2))),
                ],
              ),
              const SizedBox(width: AppSpacing.xxs),
              const Icon(Symbols.bolt_rounded, size: 48, color: AppColors.primary),
              const SizedBox(width: AppSpacing.xxs),
              Text(
                'BUSZ',
                style: AppTextStyles.displayLarge.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
