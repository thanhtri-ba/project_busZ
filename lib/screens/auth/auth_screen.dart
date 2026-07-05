import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:busz/core/theme/app_colors.dart';
import 'package:busz/core/theme/app_spacing.dart';
import 'package:busz/core/widgets/buttons/primary_button.dart';
import 'package:busz/core/widgets/inputs/app_text_field.dart';
import 'package:busz/screens/auth/widgets/auth_scaffold.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  final _inputController = TextEditingController();
  bool _isEmail = true;

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  void _onContinue() {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    final value = _inputController.text.trim();
    if (value.toLowerCase() == 'admin@busz.com') {
      context.go('/home');
      return;
    }

    context.push('/otp', extra: {
      'type': _isEmail ? 'email' : 'phone',
      'value': value,
    });
  }

  String? _validateInput(String? value) {
    final text = value?.trim() ?? '';
    if (text.isEmpty) {
      return _isEmail ? 'Please enter your email' : 'Please enter your phone number';
    }

    if (_isEmail) {
      final emailRegExp = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
      if (!emailRegExp.hasMatch(text)) {
        return 'Please enter a valid email address';
      }
    } else if (text.length < 8) {
      return 'Phone number is too short';
    }

    return null;
  }

  void _toggleMethod() {
    setState(() {
      _isEmail = !_isEmail;
      _inputController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AuthHeader(
            title: 'Log in or sign up',
            subtitle: 'Book trips, track tickets and manage your BusZ wallet from one account.',
          ),
          const SizedBox(height: AppSpacing.xxl),
          AuthCard(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  AppTextField(
                    controller: _inputController,
                    labelText: _isEmail ? 'Email address' : 'Phone number',
                    hintText: _isEmail ? 'you@example.com' : '0900 000 000',
                    prefixIcon: _isEmail ? Icons.mail_outline_rounded : Icons.phone_iphone_rounded,
                    keyboardType: _isEmail ? TextInputType.emailAddress : TextInputType.phone,
                    textInputAction: TextInputAction.done,
                    validator: _validateInput,
                    onSubmitted: (_) => _onContinue(),
                    suffixIcon: !_isEmail
                        ? IconButton(
                            tooltip: 'Select country code',
                            onPressed: () => context.push('/country-code'),
                            icon: const Icon(Icons.flag_circle_outlined),
                          )
                        : null,
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
          ),
          const SizedBox(height: AppSpacing.xxl),
          const AuthDivider(),
          const SizedBox(height: AppSpacing.xl),
          SocialAuthButton(
            icon: _isEmail ? Icons.phone_iphone_rounded : Icons.mail_outline_rounded,
            iconColor: AppColors.primary,
            label: _isEmail ? 'Continue with phone number' : 'Continue with email',
            onPressed: _toggleMethod,
          ),
          const SizedBox(height: AppSpacing.md),
          SocialAuthButton(
            icon: Icons.apple_rounded,
            label: 'Continue with Apple',
            onPressed: () {},
          ),
          const SizedBox(height: AppSpacing.md),
          SocialAuthButton(
            icon: Icons.g_mobiledata_rounded,
            iconColor: AppColors.error,
            label: 'Continue with Google',
            onPressed: () {},
          ),
          const SizedBox(height: AppSpacing.md),
          SocialAuthButton(
            icon: Icons.facebook_rounded,
            iconColor: AppColors.info,
            label: 'Continue with Facebook',
            onPressed: () {},
          ),
          const SizedBox(height: AppSpacing.xl),
        ],
      ),
    );
  }
}
