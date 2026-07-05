import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:busz/core/router/route_names.dart';
import 'package:busz/core/theme/app_colors.dart';
import 'package:busz/core/theme/app_radius.dart';
import 'package:busz/core/theme/app_spacing.dart';
import 'package:busz/core/theme/app_text_styles.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int _selectedMethod = 0;
  bool _agreedTerms = false;
  bool _agreedPrivacy = false;

  final List<_PaymentMethod> _paymentMethods = const [
    _PaymentMethod(
      name: 'VNPay',
      icon: Icons.account_balance_rounded,
      description: 'Thanh toán qua cổng VNPay',
    ),
    _PaymentMethod(
      name: 'MoMo',
      icon: Icons.phone_android_rounded,
      description: 'Ví điện tử MoMo',
    ),
    _PaymentMethod(
      name: 'ZaloPay',
      icon: Icons.account_balance_wallet_rounded,
      description: 'Ví điện tử ZaloPay',
    ),
    _PaymentMethod(
      name: 'Thẻ tín dụng / ghi nợ',
      icon: Icons.credit_card_rounded,
      description: 'Visa, Mastercard, JCB',
    ),
    _PaymentMethod(
      name: 'Thanh toán tại quầy',
      icon: Icons.storefront_rounded,
      description: 'Trả tiền mặt tại quầy vé',
    ),
  ];

  bool get _canPay => _agreedTerms && _agreedPrivacy;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundPrimary,
        elevation: 0,
        centerTitle: true,
        title: Text('Thanh toán', style: AppTextStyles.titleMedium),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.md,
          AppSpacing.sm,
          AppSpacing.md,
          110,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _bookingSummaryCard(),
            const SizedBox(height: AppSpacing.md),
            _timerBox(),
            const SizedBox(height: AppSpacing.lg),
            Text('Phương thức thanh toán', style: AppTextStyles.titleSmall),
            const SizedBox(height: AppSpacing.sm),
            ...List.generate(_paymentMethods.length, _paymentMethodTile),
            const SizedBox(height: AppSpacing.lg),
            _priceCard(),
            const SizedBox(height: AppSpacing.lg),
            _agreementBox(),
          ],
        ),
      ),
      bottomNavigationBar: _bottomPayBar(),
    );
  }

  Widget _bookingSummaryCard() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surfaceCard,
        borderRadius: AppRadius.card,
        border: Border.all(color: AppColors.borderLight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Thông tin chuyến đi', style: AppTextStyles.titleSmall),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              _routeDot(AppColors.routeDeparture),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Text('TP. Hồ Chí Minh', style: AppTextStyles.label),
              ),
              Text('08:00', style: AppTextStyles.label),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 7),
            height: 24,
            width: 1,
            color: AppColors.borderStrong,
          ),
          Row(
            children: [
              _routeDot(AppColors.routeArrival),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Text('Đà Lạt', style: AppTextStyles.label),
              ),
              Text('14:30', style: AppTextStyles.label),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          const Divider(height: 1),
          const SizedBox(height: AppSpacing.md),
          _infoRow(Icons.event_seat_rounded, 'Ghế', 'A1, A2'),
          const SizedBox(height: AppSpacing.xs),
          _infoRow(Icons.calendar_month_rounded, 'Ngày đi', '05/07/2026'),
          const SizedBox(height: AppSpacing.xs),
          _infoRow(Icons.directions_bus_rounded, 'Nhà xe', 'BusZ Express'),
        ],
      ),
    );
  }

  Widget _timerBox() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.warningLight,
        borderRadius: AppRadius.mediumAll,
        border: Border.all(color: AppColors.warning.withOpacity(0.25)),
      ),
      child: Row(
        children: [
          const Icon(Icons.timer_outlined, color: AppColors.warning, size: 20),
          const SizedBox(width: AppSpacing.xs),
          Expanded(
            child: Text(
              'Giữ chỗ của bạn sẽ hết hạn sau',
              style: AppTextStyles.bodySmall,
            ),
          ),
          Text(
            '14:59',
            style: AppTextStyles.label.copyWith(color: AppColors.warning),
          ),
        ],
      ),
    );
  }

  Widget _paymentMethodTile(int index) {
    final method = _paymentMethods[index];
    final isSelected = _selectedMethod == index;

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.xs),
      child: InkWell(
        borderRadius: AppRadius.card,
        onTap: () => setState(() => _selectedMethod = index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.surfaceCard,
            borderRadius: AppRadius.card,
            border: Border.all(
              color: isSelected ? AppColors.primary : AppColors.borderLight,
              width: isSelected ? 1.6 : 1,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primaryLight : AppColors.gray100,
                  borderRadius: AppRadius.mediumAll,
                ),
                child: Icon(
                  method.icon,
                  color: isSelected ? AppColors.primary : AppColors.gray600,
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(method.name, style: AppTextStyles.label),
                    const SizedBox(height: 2),
                    Text(method.description, style: AppTextStyles.caption),
                  ],
                ),
              ),
              Radio<int>(
                value: index,
                groupValue: _selectedMethod,
                activeColor: AppColors.primary,
                onChanged: (value) {
                  if (value != null) {
                    setState(() => _selectedMethod = value);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _priceCard() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surfaceCard,
        borderRadius: AppRadius.card,
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Chi tiết thanh toán', style: AppTextStyles.titleSmall),
          const SizedBox(height: AppSpacing.md),
          _priceRow('Giá vé', '700.000đ'),
          _priceRow('Giảm giá', '-50.000đ', valueColor: AppColors.success),
          _priceRow('Phí dịch vụ', '10.000đ'),
          _priceRow('VAT', '65.000đ'),
          const Divider(height: AppSpacing.xl),
          _priceRow('Tổng cộng', '725.000đ', isTotal: true),
        ],
      ),
    );
  }

  Widget _agreementBox() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.surfaceCard,
        borderRadius: AppRadius.card,
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        children: [
          CheckboxListTile(
            value: _agreedTerms,
            onChanged: (value) {
              setState(() => _agreedTerms = value ?? false);
            },
            activeColor: AppColors.primary,
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.zero,
            title: Text(
              'Tôi đồng ý với Điều khoản & Điều kiện',
              style: AppTextStyles.bodySmall,
            ),
          ),
          CheckboxListTile(
            value: _agreedPrivacy,
            onChanged: (value) {
              setState(() => _agreedPrivacy = value ?? false);
            },
            activeColor: AppColors.primary,
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.zero,
            title: Text(
              'Tôi đồng ý với Chính sách Bảo mật',
              style: AppTextStyles.bodySmall,
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomPayBar() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surfacePrimary,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        child: SizedBox(
          height: AppSpacing.buttonHeight,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _canPay
                ? () => context.push('${RouteNames.paymentResult}?success=true')
                : null,
            child: const Text('Thanh toán 725.000đ'),
          ),
        ),
      ),
    );
  }

  Widget _routeDot(Color color) {
    return Container(
      width: 14,
      height: 14,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.white, width: 3),
      ),
    );
  }

  Widget _infoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 18, color: AppColors.primary),
        const SizedBox(width: AppSpacing.xs),
        Text(label, style: AppTextStyles.bodySmall),
        const Spacer(),
        Text(value, style: AppTextStyles.label),
      ],
    );
  }

  Widget _priceRow(
    String label,
    String value, {
    bool isTotal = false,
    Color? valueColor,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.xs),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: isTotal ? AppTextStyles.titleSmall : AppTextStyles.bodySmall,
            ),
          ),
          Text(
            value,
            style: isTotal
                ? AppTextStyles.titleLarge.copyWith(color: AppColors.primary)
                : AppTextStyles.label.copyWith(color: valueColor),
          ),
        ],
      ),
    );
  }
}

class _PaymentMethod {
  final String name;
  final IconData icon;
  final String description;

  const _PaymentMethod({
    required this.name,
    required this.icon,
    required this.description,
  });
}