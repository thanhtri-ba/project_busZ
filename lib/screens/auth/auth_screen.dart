import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:busz/core/theme/app_colors.dart';
import 'package:busz/core/theme/app_radius.dart';
import 'package:busz/core/theme/app_spacing.dart';
import 'package:busz/core/theme/app_text_styles.dart';
import 'package:busz/core/widgets/buttons/primary_button.dart';
import 'package:busz/core/widgets/inputs/app_text_field.dart';
import 'package:busz/screens/auth/widgets/auth_scaffold.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _inputController = TextEditingController();
  bool _isEmail = true;

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  void _onContinue() {
    final value = _inputController.text.trim();
    if (value.isEmpty) return;

    if (value.toLowerCase() == 'admin@busz.com') {
      context.go('/home');
      return;
    }

    if (_isEmail) {
      context.push('/login-password', extra: {'email': value});
      return;
    }

    context.push('/otp', extra: {
      'type': 'phone',
      'value': value,
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
    return AuthScaffold(
      title: 'Log in or sign up',
      subtitle: 'Book buses, track tickets, and manage every trip in one place.',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _AuthModeSwitch(
            isEmail: _isEmail,
            onChanged: _toggleInputType,
          ),
          const SizedBox(height: AppSpacing.lg),
          if (_isEmail)
            AppTextField(
              controller: _inputController,
              labelText: 'Email address',
              hintText: 'you@example.com',
              prefixIcon: Icons.mail_outline_rounded,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => _onContinue(),
            )
          else
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => context.push('/country-code'),
                  borderRadius: AppRadius.input,
                  child: Container(
                    height: AppSpacing.inputHeight,
                    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                    decoration: BoxDecoration(
                      color: AppColors.surfacePrimary,
                      borderRadius: AppRadius.input,
                      border: Border.all(color: AppColors.borderNormal),
                    ),
                    child: Row(
                      children: [
                        Text('🇺🇸', style: AppTextStyles.titleSmall),
                        const SizedBox(width: AppSpacing.xs),
                        Text('+1', style: AppTextStyles.label),
                        const SizedBox(width: AppSpacing.xxs),
                        const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 18,
                          color: AppColors.textSecondary,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: AppTextField(
                    controller: _inputController,
                    labelText: 'Phone number',
                    hintText: '812 345 6789',
                    prefixIcon: Icons.phone_iphone_rounded,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) => _onContinue(),
                  ),
                ),
              ],
            ),
          const SizedBox(height: AppSpacing.xl),
          PrimaryButton(
            text: 'Continue',
            icon: Icons.arrow_forward_rounded,
            onPressed: _onContinue,
          ),
          const SizedBox(height: AppSpacing.xxl),
          const _DividerLabel(text: 'Or continue with'),
          const SizedBox(height: AppSpacing.xl),
          _SocialButton(
            icon: _isEmail ? Icons.phone_iphone_rounded : Icons.mail_outline_rounded,
            iconColor: AppColors.primary,
            label: _isEmail ? 'Continue with phone number' : 'Continue with email',
            onPressed: _toggleInputType,
          ),
          const SizedBox(height: AppSpacing.sm),
          _SocialButton(
            icon: Icons.g_mobiledata_rounded,
            iconColor: Colors.red,
            label: 'Continue with Google',
            onPressed: () {},
          ),
          const SizedBox(height: AppSpacing.sm),
          _SocialButton(
            icon: Icons.apple_rounded,
            iconColor: AppColors.black,
            label: 'Continue with Apple',
            onPressed: () {},
          ),
          const SizedBox(height: AppSpacing.xl),
          Text(
            'By continuing, you agree to BusZ Terms of Service and Privacy Policy.',
            textAlign: TextAlign.center,
            style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}

class _AuthModeSwitch extends StatelessWidget {
  const _AuthModeSwitch({required this.isEmail, required this.onChanged});

  final bool isEmail;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColors.surfacePrimary,
        borderRadius: AppRadius.pillAll,
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Row(
        children: [
          Expanded(
            child: _ModeItem(
              label: 'Email',
              icon: Icons.mail_outline_rounded,
              selected: isEmail,
              onTap: isEmail ? null : onChanged,
            ),
          ),
          Expanded(
            child: _ModeItem(
              label: 'Phone',
              icon: Icons.phone_iphone_rounded,
              selected: !isEmail,
              onTap: !isEmail ? null : onChanged,
            ),
          ),
        ],
      ),
    );
  }
}

class _ModeItem extends StatelessWidget {
  const _ModeItem({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: AppRadius.pillAll,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(vertical: 11),
        decoration: BoxDecoration(
          gradient: selected ? AppColors.primaryGradient : null,
          borderRadius: AppRadius.pillAll,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 18,
              color: selected ? AppColors.textWhite : AppColors.textSecondary,
            ),
            const SizedBox(width: AppSpacing.xs),
            Text(
              label,
              style: AppTextStyles.label.copyWith(
                color: selected ? AppColors.textWhite : AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DividerLabel extends StatelessWidget {
  const _DividerLabel({required this.text});

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
            style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary),
          ),
        ),
        const Expanded(child: Divider(color: AppColors.borderNormal)),
      ],
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
    return InkWell(
      onTap: onPressed,
      borderRadius: AppRadius.button,
      child: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.surfacePrimary.withValues(alpha: 0.94),
          borderRadius: AppRadius.button,
          border: Border.all(color: AppColors.borderNormal),
        ),
        child: Row(
          children: [
            Icon(icon, color: iconColor, size: 24),
            Expanded(
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: AppTextStyles.label.copyWith(color: AppColors.textPrimary),
              ),
            ),
            const SizedBox(width: 24),
          ],
        ),
      ),
    );
  }
}
