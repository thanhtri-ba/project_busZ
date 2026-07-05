/// BusZ — Search Results Screen
///
/// Sprint 3.2: modern trip search results UI.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:busz/core/theme/app_colors.dart';
import 'package:busz/core/theme/app_radius.dart';
import 'package:busz/core/theme/app_spacing.dart';
import 'package:busz/core/theme/app_text_styles.dart';
import 'package:busz/core/widgets/buttons/primary_button.dart';
import 'package:busz/core/widgets/loading_skeleton.dart';

class SearchResultsScreen extends StatefulWidget {
  const SearchResultsScreen({super.key});

  @override
  State<SearchResultsScreen> createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  bool _isLoading = true;
  int _selectedFilter = 0;

  final List<_TripData> _trips = const [
    _TripData(
      id: 'trip-1',
      company: 'Phương Trang',
      type: 'Giường nằm cao cấp',
      price: '280.000đ',
      departureTime: '06:00',
      arrivalTime: '13:30',
      duration: '7h 30m',
      departureStation: 'BX Miền Đông',
      arrivalStation: 'BX Đà Lạt',
      seatsLeft: 12,
      rating: '4.8',
      tag: 'Đề xuất',
    ),
    _TripData(
      id: 'trip-2',
      company: 'Thành Bưởi',
      type: 'Phòng nằm VIP',
      price: '420.000đ',
      departureTime: '08:00',
      arrivalTime: '15:00',
      duration: '7h 00m',
      departureStation: 'BX Miền Đông',
      arrivalStation: 'VP Nguyễn Tử Lực',
      seatsLeft: 4,
      rating: '4.9',
      tag: 'VIP',
    ),
    _TripData(
      id: 'trip-3',
      company: 'Kumho Samco',
      type: 'Giường nằm 34 chỗ',
      price: '250.000đ',
      departureTime: '10:00',
      arrivalTime: '18:00',
      duration: '8h 00m',
      departureStation: 'BX Miền Đông',
      arrivalStation: 'BX Đà Lạt',
      seatsLeft: 20,
      rating: '4.5',
      tag: 'Giá tốt',
    ),
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 700), () {
      if (!mounted) return;
      setState(() => _isLoading = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: _SearchHeader(
                    onBack: () => context.pop(),
                    onEdit: () => context.pop(),
                  ),
                ),
                SliverToBoxAdapter(
                  child: _FilterRow(
                    selectedIndex: _selectedFilter,
                    onSelected: (index) => setState(() => _selectedFilter = index),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(
                    AppSpacing.md,
                    AppSpacing.md,
                    AppSpacing.md,
                    110,
                  ),
                  sliver: _isLoading
                      ? const SliverToBoxAdapter(child: SkeletonList(itemCount: 4))
                      : SliverList.separated(
                          itemCount: _trips.length,
                          separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.md),
                          itemBuilder: (context, index) {
                            final trip = _trips[index];
                            return _ModernTripCard(
                              trip: trip,
                              onTap: () => context.push('/trip/${trip.id}'),
                              onChooseSeat: () => context.push('/trip/${trip.id}/seats'),
                            );
                          },
                        ),
                ),
              ],
            ),
            Positioned(
              bottom: AppSpacing.lg,
              left: AppSpacing.md,
              right: AppSpacing.md,
              child: _FloatingToolbar(
                onFilter: () {},
                onSort: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchHeader extends StatelessWidget {
  const _SearchHeader({
    required this.onBack,
    required this.onEdit,
  });

  final VoidCallback onBack;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(AppSpacing.md, AppSpacing.sm, AppSpacing.md, AppSpacing.lg),
      decoration: const BoxDecoration(
        gradient: AppColors.heroGradient,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _CircleIconButton(icon: Icons.arrow_back_ios_new_rounded, onTap: onBack),
              const Spacer(),
              _CircleIconButton(icon: Icons.tune_rounded, onTap: onEdit),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppSpacing.lg),
            decoration: BoxDecoration(
              color: AppColors.white.withValues(alpha: 0.88),
              borderRadius: AppRadius.cardLarge,
              border: Border.all(color: AppColors.borderLight),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.08),
                  blurRadius: 26,
                  offset: const Offset(0, 12),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Chọn chuyến xe',
                  style: AppTextStyles.titleLarge.copyWith(fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: AppSpacing.md),
                Row(
                  children: [
                    const _RoutePoint(label: 'TP. HCM', color: AppColors.routeDeparture),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                        child: Column(
                          children: [
                            const Icon(Icons.directions_bus_rounded, color: AppColors.primary, size: 20),
                            const SizedBox(height: 4),
                            Container(height: 1, color: AppColors.borderStrong),
                          ],
                        ),
                      ),
                    ),
                    const _RoutePoint(label: 'Đà Lạt', color: AppColors.routeArrival),
                  ],
                ),
                const SizedBox(height: AppSpacing.md),
                Row(
                  children: [
                    const Icon(Icons.calendar_month_rounded, size: 18, color: AppColors.textSecondary),
                    const SizedBox(width: AppSpacing.xs),
                    Text('Th 7, 05/07', style: AppTextStyles.caption.copyWith(fontWeight: FontWeight.w600)),
                    const SizedBox(width: AppSpacing.md),
                    const Icon(Icons.person_rounded, size: 18, color: AppColors.textSecondary),
                    const SizedBox(width: AppSpacing.xs),
                    Text('1 khách', style: AppTextStyles.caption.copyWith(fontWeight: FontWeight.w600)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            'Tìm thấy 24 chuyến phù hợp với hành trình của bạn',
            style: AppTextStyles.bodySmall.copyWith(color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}

class _FilterRow extends StatelessWidget {
  const _FilterRow({
    required this.selectedIndex,
    required this.onSelected,
  });

  final int selectedIndex;
  final ValueChanged<int> onSelected;

  static const filters = ['Tất cả', 'Giá tốt', 'VIP', 'Sớm nhất'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        separatorBuilder: (_, __) => const SizedBox(width: AppSpacing.sm),
        itemBuilder: (context, index) {
          final selected = selectedIndex == index;
          return InkWell(
            onTap: () => onSelected(index),
            borderRadius: AppRadius.pillAll,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
              decoration: BoxDecoration(
                color: selected ? AppColors.primary : AppColors.white,
                borderRadius: AppRadius.pillAll,
                border: Border.all(color: selected ? AppColors.primary : AppColors.borderNormal),
              ),
              child: Center(
                child: Text(
                  filters[index],
                  style: AppTextStyles.label.copyWith(
                    color: selected ? AppColors.white : AppColors.textSecondary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ModernTripCard extends StatelessWidget {
  const _ModernTripCard({
    required this.trip,
    required this.onTap,
    required this.onChooseSeat,
  });

  final _TripData trip;
  final VoidCallback onTap;
  final VoidCallback onChooseSeat;

  @override
  Widget build(BuildContext context) {
    final fewSeats = trip.seatsLeft <= 5;

    return InkWell(
      onTap: onTap,
      borderRadius: AppRadius.cardLarge,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.surfaceCard,
          borderRadius: AppRadius.cardLarge,
          border: Border.all(color: AppColors.borderLight),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.055),
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
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    borderRadius: AppRadius.largeAll,
                  ),
                  child: const Icon(Icons.directions_bus_filled_rounded, color: AppColors.white),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(trip.company, style: AppTextStyles.titleMedium.copyWith(fontWeight: FontWeight.w800)),
                      const SizedBox(height: 2),
                      Text(trip.type, style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary)),
                    ],
                  ),
                ),
                _RatingBadge(rating: trip.rating),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            Row(
              children: [
                _TimeColumn(
                  time: trip.departureTime,
                  station: trip.departureStation,
                  alignEnd: false,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                    child: Column(
                      children: [
                        Text(trip.duration, style: AppTextStyles.captionSmall.copyWith(fontWeight: FontWeight.w700)),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            Container(width: 7, height: 7, decoration: const BoxDecoration(color: AppColors.routeDeparture, shape: BoxShape.circle)),
                            Expanded(child: Container(height: 1, color: AppColors.borderStrong)),
                            Container(width: 7, height: 7, decoration: const BoxDecoration(color: AppColors.routeArrival, shape: BoxShape.circle)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                _TimeColumn(
                  time: trip.arrivalTime,
                  station: trip.arrivalStation,
                  alignEnd: true,
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            Container(
              padding: const EdgeInsets.all(AppSpacing.sm),
              decoration: BoxDecoration(
                color: AppColors.gray50,
                borderRadius: AppRadius.largeAll,
              ),
              child: Row(
                children: [
                  _InfoPill(
                    icon: Icons.local_offer_rounded,
                    label: trip.tag,
                    color: AppColors.warning,
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  _InfoPill(
                    icon: Icons.event_seat_rounded,
                    label: 'Còn ${trip.seatsLeft} chỗ',
                    color: fewSeats ? AppColors.error : AppColors.success,
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Từ', style: AppTextStyles.captionSmall.copyWith(color: AppColors.textSecondary)),
                      Text(
                        trip.price,
                        style: AppTextStyles.titleLarge.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 128,
                  child: PrimaryButton(
                    text: 'Chọn ghế',
                    height: 44,
                    onPressed: onChooseSeat,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _FloatingToolbar extends StatelessWidget {
  const _FloatingToolbar({
    required this.onFilter,
    required this.onSort,
  });

  final VoidCallback onFilter;
  final VoidCallback onSort;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: AppColors.white.withValues(alpha: 0.95),
          borderRadius: AppRadius.pillAll,
          border: Border.all(color: AppColors.borderLight),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.14),
              blurRadius: 24,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _ToolbarButton(icon: Icons.filter_alt_rounded, label: 'Lọc', onTap: onFilter),
            Container(width: 1, height: 24, color: AppColors.borderNormal),
            _ToolbarButton(icon: Icons.swap_vert_rounded, label: 'Giá thấp nhất', onTap: onSort),
          ],
        ),
      ),
    );
  }
}

class _ToolbarButton extends StatelessWidget {
  const _ToolbarButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: AppRadius.pillAll,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
        child: Row(
          children: [
            Icon(icon, size: 20, color: AppColors.textPrimary),
            const SizedBox(width: AppSpacing.xs),
            Text(label, style: AppTextStyles.label),
          ],
        ),
      ),
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  const _CircleIconButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: AppRadius.pillAll,
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: AppColors.white,
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.borderLight),
        ),
        child: Icon(icon, size: 19, color: AppColors.textPrimary),
      ),
    );
  }
}

class _RoutePoint extends StatelessWidget {
  const _RoutePoint({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(width: 12, height: 12, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        const SizedBox(height: 6),
        Text(label, style: AppTextStyles.label.copyWith(fontWeight: FontWeight.w800)),
      ],
    );
  }
}

class _RatingBadge extends StatelessWidget {
  const _RatingBadge({required this.rating});

  final String rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.warningLight,
        borderRadius: AppRadius.pillAll,
      ),
      child: Row(
        children: [
          const Icon(Icons.star_rounded, size: 15, color: AppColors.warning),
          const SizedBox(width: 3),
          Text(rating, style: AppTextStyles.captionSmall.copyWith(color: AppColors.warning, fontWeight: FontWeight.w800)),
        ],
      ),
    );
  }
}

class _TimeColumn extends StatelessWidget {
  const _TimeColumn({required this.time, required this.station, required this.alignEnd});

  final String time;
  final String station;
  final bool alignEnd;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 88,
      child: Column(
        crossAxisAlignment: alignEnd ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(time, style: AppTextStyles.titleMedium.copyWith(fontWeight: FontWeight.w900)),
          const SizedBox(height: 3),
          Text(
            station,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: alignEnd ? TextAlign.right : TextAlign.left,
            style: AppTextStyles.captionSmall.copyWith(color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}

class _InfoPill extends StatelessWidget {
  const _InfoPill({required this.icon, required this.label, required this.color});

  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: 8),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: AppRadius.pillAll,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 15, color: color),
            const SizedBox(width: 5),
            Flexible(
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.captionSmall.copyWith(color: color, fontWeight: FontWeight.w800),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TripData {
  const _TripData({
    required this.id,
    required this.company,
    required this.type,
    required this.price,
    required this.departureTime,
    required this.arrivalTime,
    required this.duration,
    required this.departureStation,
    required this.arrivalStation,
    required this.seatsLeft,
    required this.rating,
    required this.tag,
  });

  final String id;
  final String company;
  final String type;
  final String price;
  final String departureTime;
  final String arrivalTime;
  final String duration;
  final String departureStation;
  final String arrivalStation;
  final int seatsLeft;
  final String rating;
  final String tag;
}
