import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:busz/core/router/route_names.dart';
import 'package:busz/core/theme/app_colors.dart';
import 'package:busz/core/theme/app_radius.dart';
import 'package:busz/core/theme/app_spacing.dart';
import 'package:busz/core/theme/app_text_styles.dart';

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
      backgroundColor: AppColors.backgroundPrimary,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 178,
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
              onPressed: () => context.pop(),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [AppColors.primary, AppColors.secondary],
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 54, 20, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tóm tắt đặt vé',
                          style: AppTextStyles.headline.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Kiểm tra thông tin trước khi thanh toán',
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: Colors.white.withValues(alpha: 0.86),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildTripHeroCard(),
                const SizedBox(height: AppSpacing.md),
                _buildSection(
                  'Ghế & Hành khách',
                  Icons.event_seat_outlined,
                  child: Column(
                    children: [
                      _buildPassengerRow('1A', 'Nguyễn Văn A', '0912 345 678'),
                      const Divider(height: AppSpacing.xl),
                      _buildPassengerRow('1B', 'Trần Thị B', '0923 456 789'),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                _buildSection(
                  'Điểm đón & trả',
                  Icons.location_on_outlined,
                  child: Column(
                    children: [
                      _buildLocationRow('Điểm đón', 'Bến xe Miền Đông', '05:45'),
                      const Divider(height: AppSpacing.xl),
                      _buildLocationRow('Điểm trả', 'Bến xe Đà Lạt', '13:30'),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                _buildPromoSection(),
                const SizedBox(height: AppSpacing.md),
                _buildPaymentSection(),
              ]),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildTripHeroCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surfaceCard,
        borderRadius: AppRadius.card,
        border: Border.all(color: AppColors.borderLight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: AppColors.primaryLight,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(Icons.directions_bus_rounded, color: AppColors.primary),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Phương Trang', style: AppTextStyles.titleSmall),
                    const SizedBox(height: 2),
                    Text('Giường nằm cao cấp • Thứ 7, 05/07/2026', style: AppTextStyles.caption),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.success.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  'Đã giữ ghế',
                  style: AppTextStyles.labelSmall.copyWith(color: AppColors.success),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              _buildRouteTime('06:00', 'Bến xe Miền Đông', CrossAxisAlignment.start),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(radius: 4, backgroundColor: AppColors.routeDeparture),
                          Expanded(
                            child: Container(
                              height: 1.4,
                              margin: const EdgeInsets.symmetric(horizontal: 6),
                              color: AppColors.borderLight,
                            ),
                          ),
                          const Icon(Icons.directions_bus_rounded, size: 18, color: AppColors.primary),
                          Expanded(
                            child: Container(
                              height: 1.4,
                              margin: const EdgeInsets.symmetric(horizontal: 6),
                              color: AppColors.borderLight,
                            ),
                          ),
                          const CircleAvatar(radius: 4, backgroundColor: AppColors.routeArrival),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text('7h 30m', style: AppTextStyles.captionSmall),
                    ],
                  ),
                ),
              ),
              _buildRouteTime('13:30', 'Bến xe Đà Lạt', CrossAxisAlignment.end),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRouteTime(String time, String station, CrossAxisAlignment alignment) {
    return SizedBox(
      width: 92,
      child: Column(
        crossAxisAlignment: alignment,
        children: [
          Text(time, style: AppTextStyles.titleLarge.copyWith(color: AppColors.textPrimary)),
          const SizedBox(height: 4),
          Text(station, textAlign: alignment == CrossAxisAlignment.end ? TextAlign.right : TextAlign.left, style: AppTextStyles.caption),
        ],
      ),
    );
  }

  Widget _buildPromoSection() {
    return _buildSection(
      'Mã giảm giá',
      Icons.local_offer_outlined,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _promoController,
              decoration: InputDecoration(
                hintText: 'Nhập mã giảm giá',
                prefixIcon: const Icon(Icons.confirmation_number_outlined),
                filled: true,
                fillColor: AppColors.backgroundPrimary,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          SizedBox(
            height: 54,
            child: OutlinedButton(
              onPressed: () => setState(() => _promoApplied = true),
              child: Text(_promoApplied ? 'Đã áp dụng' : 'Áp dụng'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentSection() {
    return _buildSection(
      'Chi tiết thanh toán',
      Icons.receipt_long_outlined,
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
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
      decoration: BoxDecoration(
        color: AppColors.surfacePrimary,
        border: Border(top: BorderSide(color: AppColors.borderLight)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 22,
            offset: const Offset(0, -8),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Tổng thanh toán', style: AppTextStyles.caption),
                  const SizedBox(height: 2),
                  Text(
                    _promoApplied ? '725.000đ' : '775.000đ',
                    style: AppTextStyles.titleLarge.copyWith(color: AppColors.primary),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 54,
              child: ElevatedButton.icon(
                onPressed: _showConfirmDialog,
                icon: const Icon(Icons.lock_rounded, size: 18),
                label: const Text('Đặt vé ngay'),
              ),
            ),
          ],
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
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.035),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: AppColors.primaryLight,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, size: 19, color: AppColors.primary),
              ),
              const SizedBox(width: AppSpacing.sm),
              Text(title, style: AppTextStyles.titleSmall),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          child,
        ],
      ),
    );
  }

  Widget _buildPassengerRow(String seat, String name, String phone) {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.secondaryLight,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(seat, style: AppTextStyles.label.copyWith(color: AppColors.secondary)),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: AppTextStyles.label),
              const SizedBox(height: 2),
              Text(phone, style: AppTextStyles.caption),
            ],
          ),
        ),
        const Icon(Icons.check_circle_rounded, color: AppColors.success, size: 20),
      ],
    );
  }

  Widget _buildLocationRow(String label, String station, String time) {
    final isPickup = label == 'Điểm đón';

    return Row(
      children: [
        Icon(
          isPickup ? Icons.trip_origin_rounded : Icons.place_rounded,
          size: 22,
          color: isPickup ? AppColors.routeDeparture : AppColors.routeArrival,
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: AppTextStyles.caption),
              const SizedBox(height: 2),
              Text(station, style: AppTextStyles.label),
            ],
          ),
        ),
        Text(time, style: AppTextStyles.titleSmall),
      ],
    );
  }

  Widget _buildPriceRow(String label, String amount, {bool isDiscount = false, bool isTotal = false}) {
    final amountStyle = isTotal
        ? AppTextStyles.titleLarge.copyWith(color: AppColors.primary, fontWeight: FontWeight.w800)
        : isDiscount
            ? AppTextStyles.label.copyWith(color: AppColors.success)
            : AppTextStyles.label;

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: isTotal ? AppTextStyles.titleSmall : AppTextStyles.bodyMedium),
          Text(amount, style: amountStyle),
        ],
      ),
    );
  }
}
