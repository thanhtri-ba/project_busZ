import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:busz/core/theme/app_colors.dart';
import 'package:busz/core/theme/app_radius.dart';
import 'package:busz/core/theme/app_spacing.dart';
import 'package:busz/core/widgets/base/base_card.dart';
import 'package:busz/core/widgets/buttons/primary_button.dart';
import 'package:busz/core/widgets/buttons/secondary_button.dart';
import 'package:busz/core/widgets/inputs/app_text_field.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isEmail = true;
  final _inputController = TextEditingController();

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  void _onContinue() {
    final val = _inputController.text.trim();
    if (val.isEmpty) return;

    if (val.toLowerCase() == 'admin@busz.com') {
      context.go('/home');
      return;
    }

    context.push('/otp', extra: {
      'type': _isEmail ? 'email' : 'phone',
      'value': val,
    });
  }

  void _toggleInputType() {
    setState(() {
      _isEmail = !_isEmail;
      _inputController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: AppRadius.extraLargeAll,
                ),
                child: const Icon(Icons.directions_bus_rounded, color: Colors.white, size: 30),
              ),
              const SizedBox(height: AppSpacing.xl),
              Text(
                'Log in or sign up',
                style: textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.4,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                'Book, track and manage your BusZ trips in one place.',
                style: textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary),
              ),
              const SizedBox(height: AppSpacing.xxl),
              BaseCard(
                padding: const EdgeInsets.all(AppSpacing.lg),
                borderRadius: AppRadius.cardLarge,
                child: Column(
                  children: [
                    AppTextField(
                      controller: _inputController,
                      keyboardType: _isEmail ? TextInputType.emailAddress : TextInputType.phone,
                      textInputAction: TextInputAction.done,
                      prefixIcon: _isEmail ? Icons.mail_outline_rounded : Icons.phone_iphone_rounded,
                      labelText: _isEmail ? 'Email Address' : 'Phone Number',
                      hintText: _isEmail ? 'you@example.com' : '+84 901 234 567',
                      onSubmitted: (_) => _onContinue(),
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    PrimaryButton(
                      text: 'Continue',
                      icon: Icons.arrow_forward_rounded,
                      onPressed: _onContinue,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.xxl),
              Row(
                children: [
                  const Expanded(child: Divider(color: AppColors.borderNormal)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                    child: Text(
                      'Or continue with',
                      style: textTheme.labelMedium?.copyWith(color: AppColors.textHint),
                    ),
                  ),
                  const Expanded(child: Divider(color: AppColors.borderNormal)),
                ],
              ),
              const SizedBox(height: AppSpacing.xl),
              SecondaryButton(
                text: _isEmail ? 'Phone Number' : 'Email Address',
                icon: _isEmail ? Icons.phone_iphone_rounded : Icons.mail_outline_rounded,
                onPressed: _toggleInputType,
              ),
              const SizedBox(height: AppSpacing.md),
              _SocialButton(
                icon: Icons.g_mobiledata_rounded,
                iconColor: Colors.red,
                label: 'Google',
                onPressed: () {},
              ),
              const SizedBox(height: AppSpacing.md),
              _SocialButton(
                icon: Icons.apple_rounded,
                iconColor: AppColors.textPrimary,
                label: 'Apple',
                onPressed: () {},
              ),
              const SizedBox(height: AppSpacing.md),
              _SocialButton(
                icon: Icons.facebook_rounded,
                iconColor: Colors.blue,
                label: 'Facebook',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  const _SocialButton({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.onPressed,
  });

  final IconData icon;
  final Color iconColor;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      onTap: onPressed,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.md),
      shadow: const [],
      borderRadius: AppRadius.button,
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 28),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Text(
              'Continue with $label',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ),
          const Icon(Icons.chevron_right_rounded, color: AppColors.textTertiary),
        ],
      ),
    );
  }
}
