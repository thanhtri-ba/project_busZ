import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:busz/core/theme/app_colors.dart';
import 'package:busz/core/theme/app_text_styles.dart';
import 'package:busz/core/theme/app_spacing.dart';

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
      // Dev bypass account
      context.go('/home');
      return;
    }

    context.push('/otp', extra: {
      'type': _isEmail ? 'email' : 'phone',
      'value': val,
    });
  }

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
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Log in or sign up',
                style: AppTextStyles.headline,
              ),
              const SizedBox(height: AppSpacing.xl),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.borderNormal),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    if (!_isEmail)
                      GestureDetector(
                        onTap: () async {
                          // In a real app, await result from country code screen
                          context.push('/country-code');
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: const BoxDecoration(
                            border: Border(right: BorderSide(color: AppColors.borderNormal)),
                          ),
                          child: Row(
                            children: [
                              Text('🇺🇸 +1', style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w500)),
                              const SizedBox(width: AppSpacing.xxs),
                              const Icon(Icons.keyboard_arrow_down, size: 20, color: AppColors.textSecondary),
                            ],
                          ),
                        ),
                      ),
                    if (_isEmail)
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Icon(Icons.mail_outline, color: AppColors.textPrimary, size: 20),
                      ),
                    Expanded(
                      child: TextField(
                        controller: _inputController,
                        keyboardType: _isEmail ? TextInputType.emailAddress : TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: _isEmail ? 'Email Address' : 'Phone Number',
                          hintStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.textHint),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(vertical: 18),
                        ),
                        onSubmitted: (_) => _onContinue(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _onContinue,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.textWhite,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Continue',
                    style: AppTextStyles.button,
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.xxl),
              Row(
                children: [
                  const Expanded(child: Divider(color: AppColors.borderLight)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                    child: Text(
                      'Or',
                      style: AppTextStyles.caption.copyWith(color: AppColors.textHint),
                    ),
                  ),
                  const Expanded(child: Divider(color: AppColors.borderLight)),
                ],
              ),
              const SizedBox(height: AppSpacing.xxl),
              _SocialButton(
                icon: Icons.phone_iphone,
                iconColor: AppColors.primary,
                label: _isEmail ? 'Continue With Phone Number' : 'Continue With Email',
                onPressed: () {
                  setState(() {
                    _isEmail = !_isEmail;
                    _inputController.clear();
                  });
                },
              ),
              const SizedBox(height: AppSpacing.md),
              _SocialButton(
                icon: Icons.apple,
                iconColor: Colors.black,
                label: 'Continue with Apple',
                onPressed: () {},
              ),
              const SizedBox(height: AppSpacing.md),
              _SocialButton(
                icon: Icons.g_mobiledata, // Placeholder for Google
                iconColor: Colors.red,
                label: 'Continue with Google',
                onPressed: () {},
              ),
              const SizedBox(height: AppSpacing.md),
              _SocialButton(
                icon: Icons.facebook,
                iconColor: Colors.blue,
                label: 'Continue with Facebook',
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
  final IconData icon;
  final Color iconColor;
  final String label;
  final VoidCallback onPressed;

  const _SocialButton({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.borderNormal),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 16),
              child: Icon(icon, color: iconColor, size: 24),
            ),
            Expanded(
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: AppTextStyles.button.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            const SizedBox(width: 60), // Balance the icon space to perfectly center the text
          ],
        ),
      ),
    );
  }
}
