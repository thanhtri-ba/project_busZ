import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:busz/core/theme/app_spacing.dart';
import 'package:busz/core/widgets/buttons/primary_button.dart';
import 'package:busz/core/widgets/inputs/app_text_field.dart';
import 'package:busz/screens/auth/widgets/auth_scaffold.dart';
import 'package:busz/services/auth_service.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _isLoading = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = GoRouterState.of(context).extra as Map<String, dynamic>?;
    if (args != null) {
      _emailController.text = args['email'] as String? ?? '';
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _sendResetLink() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    final email = _emailController.text.trim();
    setState(() => _isLoading = true);
    final response = await AuthService.forgotPassword(email);
    if (!mounted) return;
    setState(() => _isLoading = false);

    if (response.success) {
      context.push('/otp', extra: {
        'type': 'email',
        'value': email,
        'forgot': true,
      });
    }
  }

  String? _validateEmail(String? value) {
    final text = value?.trim() ?? '';
    if (text.isEmpty) return 'Please enter your email';
    final emailRegExp = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(text)) return 'Please enter a valid email address';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AuthHeader(
            title: 'Reset password',
            subtitle: "Enter your email and we'll send you a secure code to create a new password.",
            icon: Icons.lock_reset_rounded,
          ),
          const SizedBox(height: AppSpacing.xxl),
          AuthCard(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  AppTextField(
                    controller: _emailController,
                    labelText: 'Email address',
                    hintText: 'you@example.com',
                    prefixIcon: Icons.mail_outline_rounded,
                    keyboardType: TextInputType.emailAddress,
                    validator: _validateEmail,
                    onSubmitted: (_) => _sendResetLink(),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  PrimaryButton(
                    text: 'Send reset code',
                    icon: Icons.send_rounded,
                    isLoading: _isLoading,
                    onPressed: _sendResetLink,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
