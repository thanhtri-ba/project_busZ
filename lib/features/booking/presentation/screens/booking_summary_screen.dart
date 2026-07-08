/// BusZ — Booking Summary Screen
///
/// Source of Truth: BusZ-Documentation/06_Flutter/07_Booking_Module.md §10-11
///
/// Displays all booking details before payment:
/// - Route, bus company, seats, passengers
/// - Pickup/Dropoff points
/// - Price breakdown (ticket, discount, service fee, total)
/// - Promotion code input
/// - Confirmation dialog
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:go_router/go_router.dart';
import 'package:busz/core/theme/app_colors.dart';
import 'package:busz/core/theme/app_text_styles.dart';
import 'package:busz/core/theme/app_spacing.dart';
import 'package:busz/core/theme/app_radius.dart';
import 'package:busz/core/router/route_names.dart';

class BookingSummaryScreen extends StatefulWidget {
  const BookingSummaryScreen({super.key});

  @override
  State<BookingSummaryScreen> createState() => _BookingSummaryScreenState();
}

class _BookingSummaryScreenState extends State<BookingSummaryScreen> {
  final _promoController = TextEditingController();
  bool _promoApplied = false;

  @override
  void dispose() {
    _promoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tóm tắt đặt vé'),
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
            // Trip Info Card
            _buildSection(
              'Thông tin chuyến xe',
              Symbols.directions_bus_rounded,
              child: Column(
                children: [
                  _buildInfoRow('Nhà xe', 'Phương Trang'),
                  _buildInfoRow('Loại xe', 'Giường nằm cao cấp'),
                  _buildInfoRow('Ngày đi', 'Thứ 7, 05/07/2026'),
                  const Divider(height: AppSpacing.xl),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('06:00', style: AppTextStyles.titleSmall),
                            Text('Bến xe Miền Đông', style: AppTextStyles.caption),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          const Icon(Symbols.arrow_forward_rounded, size: 16, color: AppColors.primary),
                          Text('7h 30m', style: AppTextStyles.captionSmall),
                        ],
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('13:30', style: AppTextStyles.titleSmall),
                            Text('Bến xe Đà Lạt', style: AppTextStyles.caption),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppSpacing.md),

            // Seats & Passengers
            _buildSection(
              'Ghế & Hành khách',
              Symbols.event_seat_rounded,
              child: Column(
                children: [
                  _buildPassengerRow('1A (VIP)', 'Nguyễn Văn A', '0912 345 678'),
                  const Divider(height: AppSpacing.md),
                  _buildPassengerRow('1B (VIP)', 'Trần Thị B', '0923 456 789'),
                ],
              ),
            ),

            const SizedBox(height: AppSpacing.md),

            // Pickup / Dropoff
            _buildSection(
              'Điểm đón & trả',
              Symbols.location_on_rounded,
              child: Column(
                children: [
                  _buildLocationRow('Điểm đón', 'Bến xe Miền Đông', '05:45'),
                  const Divider(height: AppSpacing.md),
                  _buildLocationRow('Điểm trả', 'Bến xe Đà Lạt', '13:30'),
                ],
              ),
            ),

            const SizedBox(height: AppSpacing.md),

            // Promotion
            _buildSection(
              'Mã giảm giá',
              Symbols.local_offer_rounded,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _promoController,
                      decoration: const InputDecoration(
                        hintText: 'Nhập mã giảm giá',
                        isDense: true,
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  OutlinedButton(
                    onPressed: () {
                      setState(() => _promoApplied = true);
                    },
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(80, 48),
                    ),
                    child: const Text('Áp dụng'),
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppSpacing.md),

            // Price Breakdown
            _buildSection(
              'Chi tiết thanh toán',
              Symbols.receipt_long_rounded,
              child: Column(
                children: [
                  _buildPriceRow('Giá vé (2 ghế)', '700.000đ'),
                  if (_promoApplied) _buildPriceRow('Giảm giá', '-50.000đ', isDiscount: true),
                  _buildPriceRow('Phí dịch vụ', '10.000đ'),
                  _buildPriceRow('VAT (10%)', '65.000đ'),
                  const Divider(height: AppSpacing.xl),
                  _buildPriceRow('Tổng cộng', _promoApplied ? '725.000đ' : '775.000đ', isTotal: true),
                ],
              ),
            ),

            const SizedBox(height: 100),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.surfacePrimary,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          child: ElevatedButton(
            onPressed: _showConfirmDialog,
            child: const Text('Đặt vé ngay'),
          ),
        ),
      ),
    );
  }

  void _showConfirmDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Xác nhận đặt vé?'),
        content: const Text('Bạn sẽ được chuyển sang trang thanh toán sau khi xác nhận.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Quay lại'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              context.push(RouteNames.payment);
            },
            style: ElevatedButton.styleFrom(minimumSize: const Size(120, 44)),
            child: const Text('Tiếp tục thanh toán'),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, IconData icon, {required Widget child}) {
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
          Row(
            children: [
              Icon(icon, size: 20, color: AppColors.primary),
              const SizedBox(width: AppSpacing.xs),
              Text(title, style: AppTextStyles.titleSmall),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          child,
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.xs),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppTextStyles.bodySmall),
          Text(value, style: AppTextStyles.label),
        ],
      ),
    );
  }

  Widget _buildPassengerRow(String seat, String name, String phone) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.secondaryLight,
            borderRadius: AppRadius.smallAll,
          ),
          child: Text(seat, style: AppTextStyles.labelSmall.copyWith(color: AppColors.secondary)),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: AppTextStyles.label),
              Text(phone, style: AppTextStyles.caption),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLocationRow(String label, String station, String time) {
    return Row(
      children: [
        Icon(
          label == 'Điểm đón' ? Symbols.trip_origin_rounded : Symbols.place_rounded,
          size: 20,
          color: label == 'Điểm đón' ? AppColors.routeDeparture : AppColors.routeArrival,
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: AppTextStyles.caption),
              Text(station, style: AppTextStyles.label),
            ],
          ),
        ),
        Text(time, style: AppTextStyles.titleSmall),
      ],
    );
  }

  Widget _buildPriceRow(String label, String amount, {bool isDiscount = false, bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.xs),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: isTotal ? AppTextStyles.titleSmall : AppTextStyles.bodyMedium),
          Text(
            amount,
            style: isTotal
                ? AppTextStyles.titleLarge.copyWith(color: AppColors.primary)
                : isDiscount
                    ? AppTextStyles.label.copyWith(color: AppColors.success)
                    : AppTextStyles.label,
          ),
        ],
      ),
    );
  }
}
