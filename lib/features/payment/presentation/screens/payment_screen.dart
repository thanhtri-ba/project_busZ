/// BusZ — Payment Screen
///
/// Source of Truth: BusZ-Documentation/06_Flutter/08_Payment_Module.md
///
/// Payment methods: VNPay, MoMo, ZaloPay, Stripe, Credit/Debit Card, Cash
/// Shows: Booking summary, payment method selection, price breakdown,
///        T&C agreement, countdown timer, Pay button
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:go_router/go_router.dart';
import 'package:busz/core/theme/app_colors.dart';
import 'package:busz/core/theme/app_text_styles.dart';
import 'package:busz/core/theme/app_spacing.dart';
import 'package:busz/core/theme/app_radius.dart';
import 'package:busz/core/router/route_names.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int _selectedMethod = 0;
  bool _agreedTerms = false;
  bool _agreedPrivacy = false;

  final _paymentMethods = const [
    _PaymentMethod(name: 'VNPay', icon: Symbols.account_balance_rounded, description: 'Thanh toán qua VNPay'),
    _PaymentMethod(name: 'MoMo', icon: Symbols.phone_android_rounded, description: 'Ví điện tử MoMo'),
    _PaymentMethod(name: 'ZaloPay', icon: Symbols.wallet_rounded, description: 'Ví điện tử ZaloPay'),
    _PaymentMethod(name: 'Thẻ tín dụng', icon: Symbols.credit_card_rounded, description: 'Visa, Mastercard, JCB'),
    _PaymentMethod(name: 'Thẻ ghi nợ', icon: Symbols.credit_card_rounded, description: 'ATM nội địa'),
    _PaymentMethod(name: 'Thanh toán tại quầy', icon: Symbols.store_rounded, description: 'Trả tiền mặt tại quầy'),
  ];

  bool get _canPay => _agreedTerms && _agreedPrivacy;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thanh toán'),
        leading: IconButton(
          icon: const Icon(Symbols.arrow_back_ios_new_rounded, size: 18),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Countdown
            Container(
              padding: const EdgeInsets.all(AppSpacing.sm),
              decoration: BoxDecoration(
                color: AppColors.warningLight,
                borderRadius: AppRadius.smallAll,
              ),
              child: Row(
                children: [
                  const Icon(Symbols.timer_rounded, size: 20, color: AppColors.warning),
                  const SizedBox(width: AppSpacing.xs),
                  Text('Hoàn tất thanh toán trong ', style: AppTextStyles.bodySmall),
                  Text('14:59', style: AppTextStyles.label.copyWith(color: AppColors.warning)),
                ],
              ),
            ),

            const SizedBox(height: AppSpacing.lg),

            // Payment Methods
            Text('Phương thức thanh toán', style: AppTextStyles.titleSmall),
            const SizedBox(height: AppSpacing.sm),
            ...List.generate(_paymentMethods.length, (i) {
              final m = _paymentMethods[i];
              final isSelected = _selectedMethod == i;
              return GestureDetector(
                onTap: () => setState(() => _selectedMethod = i),
                child: Container(
                  margin: const EdgeInsets.only(bottom: AppSpacing.xs),
                  padding: const EdgeInsets.all(AppSpacing.md),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceCard,
                    borderRadius: AppRadius.mediumAll,
                    border: Border.all(
                      color: isSelected ? AppColors.primary : AppColors.borderLight,
                      width: isSelected ? 2 : 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: isSelected ? AppColors.primaryLight : AppColors.gray100,
                          borderRadius: AppRadius.smallAll,
                        ),
                        child: Icon(m.icon, color: isSelected ? AppColors.primary : AppColors.gray500, size: 24),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(m.name, style: AppTextStyles.label),
                            Text(m.description, style: AppTextStyles.caption),
                          ],
                        ),
                      ),
                      Radio<int>(
                        value: i,
                        groupValue: _selectedMethod,
                        onChanged: (v) => setState(() => _selectedMethod = v!),
                        activeColor: AppColors.primary,
                      ),
                    ],
                  ),
                ),
              );
            }),

            const SizedBox(height: AppSpacing.lg),

            // Price Breakdown
            Container(
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
                  const SizedBox(height: AppSpacing.sm),
                  _buildPriceRow('Giá vé', '700.000đ'),
                  _buildPriceRow('Giảm giá', '-50.000đ'),
                  _buildPriceRow('Phí dịch vụ', '10.000đ'),
                  _buildPriceRow('VAT (10%)', '65.000đ'),
                  const Divider(height: AppSpacing.xl),
                  _buildPriceRow('Tổng cộng', '725.000đ', isTotal: true),
                ],
              ),
            ),

            const SizedBox(height: AppSpacing.lg),

            // Agreement
            CheckboxListTile(
              value: _agreedTerms,
              onChanged: (v) => setState(() => _agreedTerms = v!),
              title: Text('Tôi đồng ý với Điều khoản & Điều kiện', style: AppTextStyles.bodySmall),
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
              activeColor: AppColors.primary,
              dense: true,
            ),
            CheckboxListTile(
              value: _agreedPrivacy,
              onChanged: (v) => setState(() => _agreedPrivacy = v!),
              title: Text('Tôi đồng ý với Chính sách Bảo mật', style: AppTextStyles.bodySmall),
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
              activeColor: AppColors.primary,
              dense: true,
            ),

            const SizedBox(height: 80),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.surfacePrimary,
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 8, offset: const Offset(0, -2)),
          ],
        ),
        child: SafeArea(
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

  Widget _buildPriceRow(String label, String amount, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.xxs),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: isTotal ? AppTextStyles.titleSmall : AppTextStyles.bodySmall),
          Text(
            amount,
            style: isTotal
                ? AppTextStyles.titleLarge.copyWith(color: AppColors.primary)
                : AppTextStyles.label,
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

  const _PaymentMethod({required this.name, required this.icon, required this.description});
}
