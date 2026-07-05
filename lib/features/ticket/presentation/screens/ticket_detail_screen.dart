/// BusZ — Ticket Detail Screen
///
/// Source of Truth: BusZ-Documentation/06_Flutter/09_Ticket_Module.md §5-6
///
/// Shows: Booking/Ticket codes, QR Code, passenger info, seat,
///        pickup/dropoff, payment summary, action buttons
import 'package:flutter/material.dart';
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
      backgroundColor: AppColors.backgroundPrimary,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundPrimary,
        elevation: 0,
        centerTitle: true,
        title: Text('Chi tiết vé', style: AppTextStyles.titleMedium),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 40),
        child: Column(
          children: [
            // Ticket Card with QR
            Container(
              padding: const EdgeInsets.all(24),
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
                  // Status
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.success.withValues(alpha: 0.1),
                      borderRadius: AppRadius.pillAll,
                    ),
                    child: Text(
                      'Sẵn sàng lên xe',
                      style: AppTextStyles.labelSmall.copyWith(
                        color: AppColors.success,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),

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
                  Text('Mã đặt vé: BK-ABC123', style: AppTextStyles.captionSmall),

                  const SizedBox(height: 24),

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

                  const SizedBox(height: 24),

                  // Trip Info
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('06:00', style: AppTextStyles.titleLarge.copyWith(fontWeight: FontWeight.w900)),
                            const SizedBox(height: 4),
                            Text('Bến xe Miền Đông', style: AppTextStyles.caption),
                            Text('TP. HCM', style: AppTextStyles.captionSmall),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          const Icon(Icons.directions_bus_rounded, size: 20, color: AppColors.primary),
                          const SizedBox(height: 4),
                          Container(
                            width: 60,
                            height: 1.2,
                            color: AppColors.borderStrong,
                          ),
                          const SizedBox(height: 4),
                          Text('7h 30m', style: AppTextStyles.captionSmall.copyWith(fontWeight: FontWeight.w700)),
                        ],
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('13:30', style: AppTextStyles.titleLarge.copyWith(fontWeight: FontWeight.w900)),
                            const SizedBox(height: 4),
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
            _buildDetailSection(
              title: 'Thông tin chuyến xe',
              icon: Icons.directions_bus_outlined,
              items: [
                _DetailItem('Nhà xe', 'Phương Trang'),
                _DetailItem('Loại xe', 'Giường nằm cao cấp'),
                _DetailItem('Ngày đi', 'Thứ 7, 05/07/2026'),
                _DetailItem('Ghế ngồi', '1A, 1B (VIP)'),
              ],
            ),

            const SizedBox(height: AppSpacing.md),

            _buildDetailSection(
              title: 'Hành khách',
              icon: Icons.person_outline_rounded,
              items: [
                _DetailItem('Họ tên', 'Nguyễn Văn A'),
                _DetailItem('Số điện thoại', '0912 345 678'),
                _DetailItem('CCCD', '001234567890'),
              ],
            ),

            const SizedBox(height: AppSpacing.md),

            _buildDetailSection(
              title: 'Thanh toán',
              icon: Icons.receipt_long_outlined,
              items: [
                _DetailItem('Tổng tiền', '725.000đ', isHighlight: true),
                _DetailItem('Phương thức', 'VNPay'),
                _DetailItem('Mã giao dịch', 'TXN-2026070500123'),
              ],
            ),

            const SizedBox(height: AppSpacing.xl),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 52,
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.picture_as_pdf_outlined, size: 20),
                      label: const Text('Tải PDF'),
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: SizedBox(
                    height: 52,
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.share_outlined, size: 20),
                      label: const Text('Chia sẻ'),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.support_agent_outlined, size: 20),
                label: const Text('Liên hệ nhà xe'),
              ),
            ),
            const SizedBox(height: AppSpacing.xxs),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: TextButton.icon(
                onPressed: () {},
                style: TextButton.styleFrom(foregroundColor: AppColors.error),
                icon: const Icon(Icons.cancel_outlined, size: 20),
                label: const Text('Yêu cầu hoàn tiền / Hủy vé'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailSection({
    required String title,
    required IconData icon,
    required List<_DetailItem> items,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surfaceCard,
        borderRadius: AppRadius.cardLarge,
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: AppColors.primaryLight,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, size: 18, color: AppColors.primary),
              ),
              const SizedBox(width: 10),
              Text(title, style: AppTextStyles.titleSmall),
            ],
          ),
          const SizedBox(height: 16),
          ...items.map((item) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(item.label, style: AppTextStyles.bodySmall.copyWith(fontWeight: FontWeight.w600)),
                    Text(
                      item.value,
                      style: item.isHighlight
                          ? AppTextStyles.label.copyWith(color: AppColors.primary, fontWeight: FontWeight.w900)
                          : AppTextStyles.label.copyWith(fontWeight: FontWeight.w700),
                    ),
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
  final bool isHighlight;

  _DetailItem(this.label, this.value, {this.isHighlight = false});
}
