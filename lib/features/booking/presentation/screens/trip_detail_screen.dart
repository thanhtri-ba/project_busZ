import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:busz/core/theme/app_colors.dart';
import 'package:busz/core/theme/app_radius.dart';
import 'package:busz/core/theme/app_spacing.dart';
import 'package:busz/core/theme/app_text_styles.dart';
import 'package:busz/core/widgets/buttons/primary_button.dart';

class TripDetailScreen extends StatelessWidget {
  const TripDetailScreen({super.key, required this.tripId});

  final String tripId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            elevation: 0,
            backgroundColor: AppColors.primary,
            leading: Padding(
              padding: const EdgeInsets.all(8),
              child: _CircleIconButton(
                icon: Icons.arrow_back_ios_new_rounded,
                onTap: () => context.pop(),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: _CircleIconButton(
                  icon: Icons.favorite_border_rounded,
                  onTap: () {},
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Container(decoration: const BoxDecoration(gradient: AppColors.primaryGradient)),
                  Positioned(
                    top: 82,
                    right: -36,
                    child: Icon(
                      Icons.directions_bus_filled_rounded,
                      size: 190,
                      color: Colors.white.withValues(alpha: 0.10),
                    ),
                  ),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 72, 20, 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.18),
                              borderRadius: AppRadius.pillAll,
                              border: Border.all(color: Colors.white.withValues(alpha: 0.24)),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.verified_rounded, color: Colors.white, size: 16),
                                SizedBox(width: 6),
                                Text(
                                  'Nhà xe xác thực',
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Phương Trang',
                            style: AppTextStyles.displayMedium.copyWith(color: Colors.white),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Giường nằm cao cấp · TP.HCM → Đà Lạt',
                            style: AppTextStyles.bodyMedium.copyWith(color: Colors.white.withValues(alpha: 0.86)),
                          ),
                          const SizedBox(height: 18),
                          const Row(
                            children: [
                              _HeroStat(icon: Icons.star_rounded, value: '4.8', label: 'Rating'),
                              SizedBox(width: 10),
                              _HeroStat(icon: Icons.event_seat_rounded, value: '18', label: 'Ghế trống'),
                              SizedBox(width: 10),
                              _HeroStat(icon: Icons.schedule_rounded, value: '7h30', label: 'Thời gian'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 120),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _RouteTimelineCard(),
                  const SizedBox(height: 20),
                  _SectionTitle(title: 'Tiện ích trên xe', actionText: '6 tiện ích'),
                  const SizedBox(height: 12),
                  const Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      _FacilityChip(icon: Icons.wifi_rounded, label: 'WiFi'),
                      _FacilityChip(icon: Icons.ac_unit_rounded, label: 'Điều hòa'),
                      _FacilityChip(icon: Icons.usb_rounded, label: 'Sạc USB'),
                      _FacilityChip(icon: Icons.water_drop_rounded, label: 'Nước uống'),
                      _FacilityChip(icon: Icons.airline_seat_flat_rounded, label: 'Giường nằm'),
                      _FacilityChip(icon: Icons.wc_rounded, label: 'WC'),
                    ],
                  ),
                  const SizedBox(height: 22),
                  _InfoCard(
                    title: 'Chính sách vé',
                    children: const [
                      _InfoRow(icon: Icons.cancel_outlined, text: 'Hủy miễn phí trước 24 giờ'),
                      _InfoRow(icon: Icons.swap_horiz_rounded, text: 'Đổi vé trước 12 giờ'),
                      _InfoRow(icon: Icons.luggage_outlined, text: 'Hành lý tối đa 20kg'),
                      _InfoRow(icon: Icons.support_agent_rounded, text: 'Hỗ trợ khách hàng 24/7'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _ReviewCard(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _BottomBookingBar(tripId: tripId),
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  const _CircleIconButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withValues(alpha: 0.92),
      shape: RoundedRectangleBorder(borderRadius: AppRadius.mediumAll),
      child: InkWell(
        onTap: onTap,
        borderRadius: AppRadius.mediumAll,
        child: Icon(icon, size: 18, color: AppColors.textPrimary),
      ),
    );
  }
}

class _HeroStat extends StatelessWidget {
  const _HeroStat({required this.icon, required this.value, required this.label});

  final IconData icon;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.16),
          borderRadius: AppRadius.largeAll,
          border: Border.all(color: Colors.white.withValues(alpha: 0.22)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.white, size: 18),
            const SizedBox(height: 8),
            Text(value, style: AppTextStyles.titleSmall.copyWith(color: Colors.white)),
            Text(label, style: AppTextStyles.caption.copyWith(color: Colors.white.withValues(alpha: 0.72))),
          ],
        ),
      ),
    );
  }
}

class _RouteTimelineCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surfaceCard,
        borderRadius: AppRadius.cardLarge,
        border: Border.all(color: AppColors.borderLight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: const [
          _RouteStop(
            time: '06:00',
            title: 'Bến xe Miền Đông',
            subtitle: 'TP. Hồ Chí Minh',
            color: AppColors.routeDeparture,
          ),
          _RouteConnector(),
          _RouteStop(
            time: '13:30',
            title: 'Bến xe Đà Lạt',
            subtitle: 'Đà Lạt, Lâm Đồng',
            color: AppColors.routeArrival,
          ),
        ],
      ),
    );
  }
}

class _RouteStop extends StatelessWidget {
  const _RouteStop({required this.time, required this.title, required this.subtitle, required this.color});

  final String time;
  final String title;
  final String subtitle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 56, child: Text(time, style: AppTextStyles.titleSmall)),
        Container(width: 14, height: 14, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextStyles.label),
              const SizedBox(height: 2),
              Text(subtitle, style: AppTextStyles.caption),
            ],
          ),
        ),
      ],
    );
  }
}

class _RouteConnector extends StatelessWidget {
  const _RouteConnector();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 62),
      child: Row(
        children: [
          Container(width: 2, height: 46, color: AppColors.borderStrong),
          const SizedBox(width: 18),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(color: AppColors.primaryLight, borderRadius: AppRadius.pillAll),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.schedule_rounded, size: 14, color: AppColors.primary),
                const SizedBox(width: 5),
                Text('7h 30m · Không trung chuyển', style: AppTextStyles.labelSmall.copyWith(color: AppColors.primary)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title, this.actionText});

  final String title;
  final String? actionText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(title, style: AppTextStyles.titleSmall)),
        if (actionText != null) Text(actionText!, style: AppTextStyles.labelSmall.copyWith(color: AppColors.primary)),
      ],
    );
  }
}

class _FacilityChip extends StatelessWidget {
  const _FacilityChip({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.surfaceCard,
        borderRadius: AppRadius.pillAll,
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: AppColors.primary),
          const SizedBox(width: 7),
          Text(label, style: AppTextStyles.labelSmall.copyWith(color: AppColors.textPrimary)),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
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
          Text(title, style: AppTextStyles.titleSmall),
          const SizedBox(height: 12),
          ...children,
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(color: AppColors.gray100, borderRadius: AppRadius.mediumAll),
            child: Icon(icon, size: 18, color: AppColors.gray600),
          ),
          const SizedBox(width: 12),
          Expanded(child: Text(text, style: AppTextStyles.bodyMedium)),
        ],
      ),
    );
  }
}

class _ReviewCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surfaceCard,
        borderRadius: AppRadius.cardLarge,
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Row(
        children: [
          Column(
            children: [
              Text('4.8', style: AppTextStyles.displayLarge.copyWith(color: AppColors.warning)),
              Row(
                children: List.generate(
                  5,
                  (index) => const Icon(Icons.star_rounded, size: 15, color: AppColors.warning),
                ),
              ),
              const SizedBox(height: 4),
              Text('128 đánh giá', style: AppTextStyles.caption),
            ],
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              children: const [
                _RatingBar(label: '5', value: 0.72),
                _RatingBar(label: '4', value: 0.18),
                _RatingBar(label: '3', value: 0.06),
                _RatingBar(label: '2', value: 0.03),
                _RatingBar(label: '1', value: 0.01),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RatingBar extends StatelessWidget {
  const _RatingBar({required this.label, required this.value});

  final String label;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          SizedBox(width: 12, child: Text(label, style: AppTextStyles.captionSmall)),
          const SizedBox(width: 8),
          Expanded(
            child: ClipRRect(
              borderRadius: AppRadius.pillAll,
              child: LinearProgressIndicator(
                value: value,
                minHeight: 6,
                backgroundColor: AppColors.gray100,
                valueColor: const AlwaysStoppedAnimation(AppColors.warning),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomBookingBar extends StatelessWidget {
  const _BottomBookingBar({required this.tripId});

  final String tripId;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 14, 20, 20),
      decoration: BoxDecoration(
        color: AppColors.surfacePrimary,
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(28), topRight: Radius.circular(28)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 24,
            offset: const Offset(0, -8),
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
                  Text('Giá từ', style: AppTextStyles.caption),
                  const SizedBox(height: 2),
                  Text('280.000đ', style: AppTextStyles.titleLarge.copyWith(color: AppColors.primary)),
                ],
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: PrimaryButton(
                text: 'Chọn ghế',
                icon: Icons.event_seat_rounded,
                onPressed: () => context.push('/trip/$tripId/seats'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
