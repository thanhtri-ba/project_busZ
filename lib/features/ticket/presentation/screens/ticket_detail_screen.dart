/// BusZ — Ticket Detail Screen
///
/// Source of Truth: BusZ-Documentation/06_Flutter/09_Ticket_Module.md §5-6
///
/// Shows: Booking/Ticket codes, QR Code, passenger info, seat,
///        pickup/dropoff, payment summary, action buttons
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:busz/core/theme/app_colors.dart';
import 'package:busz/core/theme/app_text_styles.dart';
import 'package:busz/core/theme/app_spacing.dart';
import 'package:busz/core/theme/app_radius.dart';

class TicketDetailScreen extends StatelessWidget {
  final String ticketId;

  const TicketDetailScreen({super.key, required this.ticketId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chi tiết vé'),
        leading: IconButton(
          icon: const Icon(Symbols.arrow_back_ios_new_rounded, size: 18),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Symbols.share_rounded),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Symbols.more_vert_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          children: [
            // Ticket Card with QR
            Container(
              padding: const EdgeInsets.all(AppSpacing.xl),
              decoration: BoxDecoration(
                color: AppColors.surfaceCard,
                borderRadius: AppRadius.card,
                border: Border.all(color: AppColors.borderLight),
              ),
              child: Column(
                children: [
                  // Status
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.successLight,
                      borderRadius: AppRadius.pillAll,
                    ),
                    child: Text(
                      'Sẵn sàng lên xe',
                      style: AppTextStyles.labelSmall.copyWith(color: AppColors.success),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),

                  // QR Code
                  QrImageView(
                    data: 'BUSZ-TK-$ticketId-SIG-abc123',
                    version: QrVersions.auto,
                    size: 180,
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
                  const SizedBox(height: AppSpacing.sm),
                  Text('Mã vé: $ticketId', style: AppTextStyles.label),
                  Text('Mã đặt vé: BK-ABC123', style: AppTextStyles.caption),

                  const SizedBox(height: AppSpacing.lg),

                  // Dashed divider
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

                  const SizedBox(height: AppSpacing.lg),

                  // Trip Info
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('06:00', style: AppTextStyles.titleLarge),
                            const SizedBox(height: 2),
                            Text('Bến xe Miền Đông', style: AppTextStyles.caption),
                            Text('TP. HCM', style: AppTextStyles.captionSmall),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          const Icon(Symbols.directions_bus_rounded, size: 20, color: AppColors.primary),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            width: 60,
                            height: 1,
                            color: AppColors.gray300,
                          ),
                          Text('7h 30m', style: AppTextStyles.captionSmall),
                        ],
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('13:30', style: AppTextStyles.titleLarge),
                            const SizedBox(height: 2),
                            Text('Bến xe Đà Lạt', style: AppTextStyles.caption),
                            Text('Lâm Đồng', style: AppTextStyles.captionSmall),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppSpacing.md),

            // Details
            _buildDetailSection('Thông tin chuyến xe', [
              _DetailItem('Nhà xe', 'Phương Trang'),
              _DetailItem('Loại xe', 'Giường nằm cao cấp'),
              _DetailItem('Ngày', 'Thứ 7, 05/07/2026'),
              _DetailItem('Ghế', '1A (VIP)'),
            ]),

            const SizedBox(height: AppSpacing.md),

            _buildDetailSection('Hành khách', [
              _DetailItem('Họ tên', 'Nguyễn Văn A'),
              _DetailItem('Số điện thoại', '0912 345 678'),
              _DetailItem('CCCD', '001234567890'),
            ]),

            const SizedBox(height: AppSpacing.md),

            _buildDetailSection('Thanh toán', [
              _DetailItem('Tổng tiền', '350.000đ'),
              _DetailItem('Phương thức', 'VNPay'),
              _DetailItem('Mã giao dịch', 'TXN-2026070500123'),
            ]),

            const SizedBox(height: AppSpacing.xl),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Symbols.picture_as_pdf_rounded, size: 20),
                    label: const Text('Tải PDF'),
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Symbols.share_rounded, size: 20),
                    label: const Text('Chia sẻ'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            SizedBox(
              width: double.infinity,
              child: TextButton.icon(
                onPressed: () {},
                icon: const Icon(Symbols.support_agent_rounded, size: 20),
                label: const Text('Liên hệ nhà xe'),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            SizedBox(
              width: double.infinity,
              child: TextButton.icon(
                onPressed: () {},
                style: TextButton.styleFrom(foregroundColor: AppColors.error),
                icon: const Icon(Symbols.cancel_rounded, size: 20),
                label: const Text('Yêu cầu hoàn tiền'),
              ),
            ),

            const SizedBox(height: AppSpacing.xxl),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailSection(String title, List<_DetailItem> items) {
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
          Text(title, style: AppTextStyles.titleSmall),
          const SizedBox(height: AppSpacing.sm),
          ...items.map((item) => Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.xxs),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(item.label, style: AppTextStyles.bodySmall),
                    Text(item.value, style: AppTextStyles.label),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

class _DetailItem {
  final String label;
  final String value;
  _DetailItem(this.label, this.value);
}
