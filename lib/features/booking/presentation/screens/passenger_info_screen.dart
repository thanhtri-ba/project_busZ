import 'package:busz/core/router/route_names.dart';
import 'package:busz/core/theme/app_colors.dart';
import 'package:busz/core/theme/app_radius.dart';
import 'package:busz/core/theme/app_spacing.dart';
import 'package:busz/core/theme/app_text_styles.dart';
import 'package:busz/core/widgets/buttons/primary_button.dart';
import 'package:busz/core/widgets/inputs/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// BusZ — Passenger Information Screen
///
/// Collects contact information and passenger details for every selected seat.
class PassengerInfoScreen extends StatefulWidget {
  const PassengerInfoScreen({super.key});

  @override
  State<PassengerInfoScreen> createState() => _PassengerInfoScreenState();
}

class _PassengerInfoScreenState extends State<PassengerInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scrollController = ScrollController();

  // TODO: Replace by selected seats from the previous screen when booking state is wired.
  final List<String> _selectedSeats = const ['A1', 'A2'];
  late final List<_PassengerFormData> _passengers;

  final _contactEmailController = TextEditingController();
  final _contactPhoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _passengers = List.generate(
      _selectedSeats.length,
      (index) => _PassengerFormData(seatCode: _selectedSeats[index]),
    );
  }

  @override
  void dispose() {
    _contactEmailController.dispose();
    _contactPhoneController.dispose();
    for (final passenger in _passengers) {
      passenger.dispose();
    }
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      appBar: AppBar(
        title: const Text('Thông tin hành khách'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
          onPressed: () => context.pop(),
        ),
      ),
      body: Form(
        key: _formKey,
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.md,
                  AppSpacing.md,
                  AppSpacing.md,
                  AppSpacing.xl,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _BookingProgressHeader(),
                    const SizedBox(height: AppSpacing.lg),
                    _ContactInfoCard(
                      emailController: _contactEmailController,
                      phoneController: _contactPhoneController,
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    Text(
                      'Danh sách hành khách',
                      style: AppTextStyles.titleMedium,
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      'Nhập thông tin đúng với giấy tờ tùy thân để lên xe nhanh hơn.',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    ...List.generate(
                      _passengers.length,
                      (index) => _PassengerCard(
                        index: index,
                        data: _passengers[index],
                      ),
                    ),
                    const SizedBox(height: 96),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _BottomCheckoutBar(
        passengerCount: _passengers.length,
        onContinue: _handleContinue,
      ),
    );
  }

  void _handleContinue() {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState?.validate() ?? false) {
      context.push(RouteNames.bookingSummary);
    }
  }
}

class _BookingProgressHeader extends StatelessWidget {
  const _BookingProgressHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: AppRadius.card,
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.18),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.16),
              borderRadius: AppRadius.mediumAll,
            ),
            child: const Icon(
              Icons.assignment_ind_rounded,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bước 3/4',
                  style: AppTextStyles.labelSmall.copyWith(
                    color: Colors.white.withValues(alpha: 0.78),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Xác nhận thông tin đặt vé',
                  style: AppTextStyles.titleSmall.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.verified_user_rounded, color: Colors.white),
        ],
      ),
    );
  }
}

class _ContactInfoCard extends StatelessWidget {
  const _ContactInfoCard({
    required this.emailController,
    required this.phoneController,
  });

  final TextEditingController emailController;
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      icon: Icons.contact_mail_rounded,
      title: 'Thông tin liên hệ',
      subtitle: 'Vé điện tử và thông báo chuyến đi sẽ được gửi về thông tin này.',
      child: Column(
        children: [
          AppTextField(
            controller: emailController,
            labelText: 'Email',
            hintText: 'example@email.com',
            prefixIcon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            validator: (value) {
              final text = value?.trim() ?? '';
              if (text.isEmpty) return 'Vui lòng nhập email';
              if (!text.contains('@') || !text.contains('.')) {
                return 'Email không hợp lệ';
              }
              return null;
            },
          ),
          const SizedBox(height: AppSpacing.sm),
          AppTextField(
            controller: phoneController,
            labelText: 'Số điện thoại',
            hintText: '0912 345 678',
            prefixIcon: Icons.phone_outlined,
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.next,
            validator: (value) {
              final text = value?.trim() ?? '';
              if (text.isEmpty) return 'Vui lòng nhập số điện thoại';
              if (text.length < 9) return 'Số điện thoại không hợp lệ';
              return null;
            },
          ),
        ],
      ),
    );
  }
}

class _PassengerCard extends StatelessWidget {
  const _PassengerCard({
    required this.index,
    required this.data,
  });

  final int index;
  final _PassengerFormData data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.md),
      child: _SectionCard(
        icon: Icons.event_seat_rounded,
        title: 'Hành khách ${index + 1}',
        subtitle: 'Ghế ${data.seatCode}',
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
          decoration: BoxDecoration(
            color: AppColors.primaryLight,
            borderRadius: AppRadius.pillAll,
          ),
          child: Text(
            data.seatCode,
            style: AppTextStyles.labelSmall.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        child: Column(
          children: [
            AppTextField(
              controller: data.nameController,
              labelText: 'Họ và tên *',
              hintText: 'Nguyễn Văn A',
              prefixIcon: Icons.person_outline_rounded,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              validator: (value) {
                final text = value?.trim() ?? '';
                if (text.isEmpty) return 'Vui lòng nhập họ tên';
                if (text.length < 2) return 'Tên quá ngắn';
                return null;
              },
            ),
            const SizedBox(height: AppSpacing.sm),
            AppTextField(
              controller: data.phoneController,
              labelText: 'Số điện thoại *',
              hintText: '0912 345 678',
              prefixIcon: Icons.phone_outlined,
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.next,
              validator: (value) {
                final text = value?.trim() ?? '';
                if (text.isEmpty) return 'Vui lòng nhập số điện thoại';
                if (text.length < 9) return 'Số điện thoại không hợp lệ';
                return null;
              },
            ),
            const SizedBox(height: AppSpacing.sm),
            AppTextField(
              controller: data.idController,
              labelText: 'CCCD / Hộ chiếu *',
              hintText: '001234567890',
              prefixIcon: Icons.badge_outlined,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              validator: (value) {
                final text = value?.trim() ?? '';
                if (text.isEmpty) return 'Vui lòng nhập CCCD/Hộ chiếu';
                if (text.length < 6) return 'Mã giấy tờ không hợp lệ';
                return null;
              },
            ),
            const SizedBox(height: AppSpacing.sm),
            AppTextField(
              controller: data.emailController,
              labelText: 'Email phụ',
              hintText: 'Không bắt buộc',
              prefixIcon: Icons.alternate_email_rounded,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              validator: (value) {
                final text = value?.trim() ?? '';
                if (text.isEmpty) return null;
                if (!text.contains('@') || !text.contains('.')) {
                  return 'Email không hợp lệ';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.child,
    this.trailing,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final Widget child;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surfaceCard,
        borderRadius: AppRadius.card,
        border: Border.all(color: AppColors.borderNormal),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 22,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: AppColors.primaryLight,
                  borderRadius: AppRadius.mediumAll,
                ),
                child: Icon(icon, color: AppColors.primary),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: AppTextStyles.titleSmall),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              if (trailing != null) trailing!,
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          child,
        ],
      ),
    );
  }
}

class _BottomCheckoutBar extends StatelessWidget {
  const _BottomCheckoutBar({
    required this.passengerCount,
    required this.onContinue,
  });

  final int passengerCount;
  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.md,
        AppSpacing.sm,
        AppSpacing.md,
        AppSpacing.md,
      ),
      decoration: BoxDecoration(
        color: AppColors.surfacePrimary,
        border: Border.all(color: AppColors.borderLight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 18,
            offset: const Offset(0, -6),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$passengerCount hành khách',
                    style: AppTextStyles.titleSmall,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Kiểm tra kỹ thông tin trước khi tiếp tục',
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            SizedBox(
              width: 148,
              child: PrimaryButton(
                text: 'Tiếp tục',
                onPressed: onContinue,
                height: 52,
                icon: Icons.arrow_forward_rounded,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PassengerFormData {
  _PassengerFormData({required this.seatCode});

  final String seatCode;
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final idController = TextEditingController();
  final emailController = TextEditingController();

  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    idController.dispose();
    emailController.dispose();
  }
}
