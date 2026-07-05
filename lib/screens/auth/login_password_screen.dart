import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:busz/core/theme/app_colors.dart';
import 'package:busz/core/theme/app_radius.dart';
import 'package:busz/core/theme/app_spacing.dart';
import 'package:busz/core/theme/app_text_styles.dart';
import 'package:busz/core/widgets/buttons/primary_button.dart';
import 'package:busz/core/widgets/inputs/app_text_field.dart';
import 'package:busz/screens/auth/widgets/auth_scaffold.dart';
import 'package:busz/services/auth_service.dart';
import 'package:busz/shared/pref_helper.dart';

class LoginPasswordScreen extends StatefulWidget {
  const LoginPasswordScreen({super.key});

  @override
  State<LoginPasswordScreen> createState() => _LoginPasswordScreenState();
}

class _LoginPasswordScreenState extends State<LoginPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  bool _obscure = true;
  bool _isLoading = false;
  String _email = 'thanhtri.bsa@gmail.com';
  String _errorMessage = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = GoRouterState.of(context).extra as Map<String, dynamic>?;
    if (args != null) {
      _email = args['email'] as String? ?? _email;
    }
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    final response = await AuthService.login(_email, _passwordController.text);
    if (!mounted) return;

    setState(() => _isLoading = false);

    if (response.success) {
      await PrefHelper.setAccessToken(response.accessToken ?? '');
      if (response.refreshToken != null) {
        await PrefHelper.setRefreshToken(response.refreshToken!);
      }
      if (!mounted) return;
      context.go('/home');
    } else {
      setState(() => _errorMessage = response.message);
      _showErrorBottomSheet();
    }
  }

  String? _validatePassword(String? value) {
    if ((value ?? '').isEmpty) return 'Please enter your password';
    if ((value ?? '').length < 6) return 'Password must be at least 6 characters';
    return null;
  }

  void _showErrorBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          margin: const EdgeInsets.all(AppSpacing.md),
          padding: const EdgeInsets.all(AppSpacing.xl),
          decoration: BoxDecoration(
            color: AppColors.surfacePrimary,
            borderRadius: AppRadius.cardLarge,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 28,
                offset: const Offset(0, 14),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: const BoxDecoration(
                  color: AppColors.error,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.lock_outline, color: AppColors.textWhite, size: 24),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'Email or password not matched',
                            style: AppTextStyles.titleSmall.copyWith(fontWeight: FontWeight.w800),
                          ),
                        ),
                        IconButton(
                          visualDensity: VisualDensity.compact,
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.close, size: 20),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      _errorMessage.isEmpty
                          ? "We couldn't verify your email and password. Please check them and try again."
                          : _errorMessage,
                      style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondary),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AuthHeader(
            title: 'Welcome back',
            subtitle: 'Enter your password to continue booking and managing your trips.',
          ),
          const SizedBox(height: AppSpacing.xxl),
          AuthCard(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Your email', style: AppTextStyles.caption),
                  const SizedBox(height: AppSpacing.xxs),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          _email,
                          style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w700),
                        ),
                      ),
                      TextButton(
                        onPressed: () => context.go('/auth'),
                        child: const Text('Change'),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  AppTextField(
                    controller: _passwordController,
                    labelText: 'Password',
                    prefixIcon: Icons.lock_outline_rounded,
                    obscureText: _obscure,
                    validator: _validatePassword,
                    onChanged: (_) {
                      if (_errorMessage.isNotEmpty) {
                        setState(() => _errorMessage = '');
                      }
                    },
                    onSubmitted: (_) => _login(),
                    suffixIcon: IconButton(
                      onPressed: () => setState(() => _obscure = !_obscure),
                      icon: Icon(
                        _obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  PrimaryButton(
                    text: 'Continue',
                    icon: Icons.arrow_forward_rounded,
                    isLoading: _isLoading,
                    onPressed: _login,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Center(
            child: TextButton(
              onPressed: () {
                context.push('/forgot-password', extra: {'email': _email});
              },
              child: const Text('Forgot password?'),
            ),
          ),
        ],
      ),
    );
  }
}
