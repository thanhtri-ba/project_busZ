import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:busz/core/theme/app_colors.dart';
import 'package:busz/core/theme/app_text_styles.dart';
import 'package:busz/core/theme/app_radius.dart';
import 'package:busz/core/router/route_names.dart';
import 'package:busz/core/widgets/buttons/primary_button.dart';

class PaymentResultScreen extends StatelessWidget {
  final bool isSuccess;

  const PaymentResultScreen({super.key, this.isSuccess = true});

  @override
  Widget build(BuildContext context) {
    final ticketId = 'BK-ABC123';

    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 120),
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Status Indicator Icon
              Center(
                child: Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    color: isSuccess ? AppColors.success.withValues(alpha: 0.1) : AppColors.error.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSuccess ? AppColors.success.withValues(alpha: 0.2) : AppColors.error.withValues(alpha: 0.2),
                      width: 4,
                    ),
                  ),
                  child: Icon(
                    isSuccess ? Icons.check_circle_rounded : Icons.cancel_rounded,
                    size: 52,
                    color: isSuccess ? AppColors.success : AppColors.error,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                isSuccess ? 'Thanh toán thành công!' : 'Thanh toán thất bại',
                style: AppTextStyles.headline.copyWith(fontWeight: FontWeight.w900),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                isSuccess
                    ? 'Vé điện tử của bạn đã được tạo lập thành công.'
                    : 'Giao dịch của bạn không thể hoàn thành. Vui lòng thử lại.',
                style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondary),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),

              if (isSuccess) ...[
                // Ticket Card
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.surfaceCard,
                    borderRadius: AppRadius.cardLarge,
                    border: Border.all(color: AppColors.borderLight),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.04),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 24),
                      // QR Code
                      QrImageView(
                        data: 'BUSZ-TK-$ticketId-SIG-abc123',
                        version: QrVersions.auto,
                        size: 160,
                        gapless: true,
                        eyeStyle: const QrEyeStyle(
                          eyeShape: QrEyeShape.square,
                          color: AppColors.black,
                        ),
                        dataModuleStyle: const QrDataModuleStyle(
                          dataModuleShape: QrDataModuleShape.square,
                          color: AppColors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text('Mã vé: $ticketId', style: AppTextStyles.label.copyWith(fontWeight: FontWeight.w800)),
                      Text('Quét mã này khi lên xe', style: AppTextStyles.captionSmall),
                      const SizedBox(height: 20),

                      // Dashed Divider
                      Row(
                        children: List.generate(
                          30,
                          (i) => Expanded(
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 2),
                              height: 1,
                              color: i.isEven ? AppColors.gray300 : Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                      
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            _buildInfoRow('Hành trình', 'TP. Hồ Chí Minh → Đà Lạt'),
                            const SizedBox(height: 10),
                            _buildInfoRow('Thời gian', '05/07/2026 08:00'),
                            const SizedBox(height: 10),
                            _buildInfoRow('Ghế ngồi', 'A1, A2'),
                            const SizedBox(height: 10),
                            _buildInfoRow('Tổng tiền', '725.000đ', isHighlight: true),
                            const SizedBox(height: 10),
                            _buildInfoRow('Phương thức', 'VNPay'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ] else ...[
                // Error card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceCard,
                    borderRadius: AppRadius.cardLarge,
                    border: Border.all(color: AppColors.borderLight),
                  ),
                  child: Column(
                    children: [
                      const Icon(Icons.error_outline_rounded, size: 48, color: AppColors.error),
                      const SizedBox(height: 16),
                      Text(
                        'Lỗi hệ thống hoặc thẻ của bạn không đủ số dư. Vui lòng kiểm tra lại số dư tài khoản hoặc đổi phương thức thanh toán khác.',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondary, height: 1.5),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(20, 14, 20, 20),
        decoration: BoxDecoration(
          color: AppColors.surfacePrimary,
          border: Border(top: BorderSide(color: AppColors.borderLight)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 18,
              offset: const Offset(0, -6),
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          child: isSuccess
              ? Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 52,
                        child: OutlinedButton.icon(
                          onPressed: () => context.go(RouteNames.home),
                          icon: const Icon(Icons.home_rounded, size: 18),
                          label: const Text('Về trang chủ'),
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: PrimaryButton(
                        text: 'Xem vé',
                        height: 52,
                        icon: Icons.confirmation_number_rounded,
                        onPressed: () => context.go('/tickets/$ticketId'),
                      ),
                    ),
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 52,
                        child: OutlinedButton(
                          onPressed: () => context.pop(),
                          child: const Text('Phương thức khác'),
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: PrimaryButton(
                        text: 'Thử lại',
                        height: 52,
                        icon: Icons.refresh_rounded,
                        onPressed: () => context.pop(),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, {bool isHighlight = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: AppTextStyles.bodySmall.copyWith(fontWeight: FontWeight.w600)),
        Text(
          value,
          style: isHighlight
              ? AppTextStyles.label.copyWith(color: AppColors.primary, fontWeight: FontWeight.w900)
              : AppTextStyles.label.copyWith(fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
