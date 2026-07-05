/// BusZ — Seat Selection Screen
///
/// Source of Truth: BusZ-Documentation/06_Flutter/07_Booking_Module.md §3-6
///
/// Interactive seat map with:
/// - Color-coded seat statuses (Available, Selected, Booked, VIP, Blocked)
/// - 15-minute hold timer countdown
/// - Running total price
/// - Max 10 seats per booking
/// - Pickup/Dropoff selector
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:busz/core/theme/app_colors.dart';
import 'package:busz/core/theme/app_text_styles.dart';
import 'package:busz/core/theme/app_spacing.dart';
import 'package:busz/core/theme/app_radius.dart';
import 'package:busz/core/router/route_names.dart';

enum SeatStatus { available, selected, booked, vip, blocked }

class SeatData {
  final String id;
  final String label;
  final SeatStatus status;
  final int price;

  const SeatData({
    required this.id,
    required this.label,
    this.status = SeatStatus.available,
    this.price = 280000,
  });

  SeatData copyWith({SeatStatus? status}) => SeatData(
        id: id,
        label: label,
        status: status ?? this.status,
        price: price,
      );
}

class SeatSelectionScreen extends StatefulWidget {
  final String tripId;

  const SeatSelectionScreen({super.key, required this.tripId});

  @override
  State<SeatSelectionScreen> createState() => _SeatSelectionScreenState();
}

class _SeatSelectionScreenState extends State<SeatSelectionScreen> with TickerProviderStateMixin {
  late List<List<SeatData?>> _seatMap;
  final Set<String> _selectedSeats = {};
  int _remainingSeconds = 15 * 60;
  late final AnimationController _timerController;

  @override
  void initState() {
    super.initState();
    _initSeatMap();
    _timerController = AnimationController(
      vsync: this,
      duration: Duration(seconds: _remainingSeconds),
    )..addListener(_onTimerTick);
    _timerController.forward();
  }

  void _onTimerTick() {
    if (!mounted) return;
    setState(() {
      _remainingSeconds = ((1.0 - _timerController.value) * 15 * 60).round();
    });
    if (_remainingSeconds <= 0) {
      _timerController.stop();
      _showTimerExpiredDialog();
    }
  }

  void _showTimerExpiredDialog() {
    if (!mounted) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: AppRadius.dialog),
        title: const Text('Hết thời gian'),
        content: const Text('Thời gian giữ ghế đã hết. Vui lòng chọn lại.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              context.pop();
            },
            child: const Text('Quay lại'),
          ),
        ],
      ),
    );
  }

  void _initSeatMap() {
    _seatMap = List.generate(10, (row) {
      return [
        SeatData(
          id: '${row}A',
          label: '${row + 1}A',
          status: row < 2 ? SeatStatus.vip : SeatStatus.available,
          price: row < 2 ? 350000 : 280000,
        ),
        SeatData(
          id: '${row}B',
          label: '${row + 1}B',
          status: row < 2 ? SeatStatus.vip : (row == 3 || row == 5 ? SeatStatus.booked : SeatStatus.available),
          price: row < 2 ? 350000 : 280000,
        ),
        null,
        SeatData(
          id: '${row}C',
          label: '${row + 1}C',
          status: row == 4 ? SeatStatus.booked : SeatStatus.available,
          price: row < 2 ? 350000 : 280000,
        ),
        SeatData(
          id: '${row}D',
          label: '${row + 1}D',
          status: row == 7 ? SeatStatus.blocked : SeatStatus.available,
          price: row < 2 ? 350000 : 280000,
        ),
      ];
    });
  }

  void _toggleSeat(int row, int col) {
    final seat = _seatMap[row][col];
    if (seat == null) return;
    if (seat.status == SeatStatus.booked || seat.status == SeatStatus.blocked) return;

    setState(() {
      if (_selectedSeats.contains(seat.id)) {
        _selectedSeats.remove(seat.id);
        _seatMap[row][col] = seat.copyWith(status: seat.price > 300000 ? SeatStatus.vip : SeatStatus.available);
      } else {
        if (_selectedSeats.length >= 10) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Tối đa 10 ghế mỗi đơn')),
          );
          return;
        }
        _selectedSeats.add(seat.id);
        _seatMap[row][col] = seat.copyWith(status: SeatStatus.selected);
      }
    });
  }

  int get _totalPrice {
    int total = 0;
    for (final row in _seatMap) {
      for (final seat in row) {
        if (seat != null && _selectedSeats.contains(seat.id)) {
          total += seat.price;
        }
      }
    }
    return total;
  }

  String get _timerString {
    final m = _remainingSeconds ~/ 60;
    final s = _remainingSeconds % 60;
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isTimerWarning = _remainingSeconds <= 120;

    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundPrimary,
        elevation: 0,
        centerTitle: true,
        title: Text('Chọn ghế', style: AppTextStyles.titleMedium),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
          onPressed: () => context.pop(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: AppSpacing.md),
            child: _TimerBadge(
              value: _timerString,
              isWarning: isTimerWarning,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(AppSpacing.md, AppSpacing.sm, AppSpacing.md, AppSpacing.sm),
            child: _TripSummaryCard(
              from: 'HCM',
              to: 'Đà Lạt',
              time: '06:00 - 13:30',
              busType: 'Limousine 34 chỗ',
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            child: _LegendCard(items: [
              _LegendItem(AppColors.white, 'Trống', border: AppColors.borderStrong),
              _LegendItem(AppColors.primary, 'Đã chọn'),
              _LegendItem(AppColors.gray400, 'Đã đặt'),
              _LegendItem(AppColors.seatVIP.withValues(alpha: 0.35), 'VIP', border: AppColors.seatVIP),
              _LegendItem(AppColors.gray600, 'Khóa'),
            ]),
          ),
          const SizedBox(height: AppSpacing.sm),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(AppSpacing.md, 0, AppSpacing.md, AppSpacing.lg),
              child: _SeatDeck(
                seatMap: _seatMap,
                onSeatTap: _toggleSeat,
                seatColor: _seatColor,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _BottomBookingBar(
        selectedCount: _selectedSeats.length,
        totalPrice: _formatPrice(_totalPrice),
        onContinue: _selectedSeats.isEmpty ? null : () => context.push(RouteNames.passengerInfo),
      ),
    );
  }

  Color _seatColor(SeatStatus status) {
    switch (status) {
      case SeatStatus.available:
        return AppColors.white;
      case SeatStatus.selected:
        return AppColors.seatSelected;
      case SeatStatus.booked:
        return AppColors.gray400;
      case SeatStatus.vip:
        return AppColors.seatVIP.withValues(alpha: 0.35);
      case SeatStatus.blocked:
        return AppColors.gray600;
    }
  }

  String _formatPrice(int price) {
    return price.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (match) => '${match[1]}.',
    );
  }
}

class _TimerBadge extends StatelessWidget {
  const _TimerBadge({required this.value, required this.isWarning});

  final String value;
  final bool isWarning;

  @override
  Widget build(BuildContext context) {
    final color = isWarning ? AppColors.error : AppColors.primary;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: AppRadius.pillAll,
        border: Border.all(color: color.withValues(alpha: 0.18)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.timer_outlined, size: 16, color: color),
          const SizedBox(width: 5),
          Text(
            value,
            style: AppTextStyles.labelSmall.copyWith(
              color: color,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

class _TripSummaryCard extends StatelessWidget {
  const _TripSummaryCard({
    required this.from,
    required this.to,
    required this.time,
    required this.busType,
  });

  final String from;
  final String to;
  final String time;
  final String busType;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: AppRadius.cardLarge,
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.22),
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
              color: AppColors.white.withValues(alpha: 0.18),
              borderRadius: AppRadius.largeAll,
            ),
            child: const Icon(Icons.directions_bus_rounded, color: AppColors.white),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(from, style: AppTextStyles.titleSmall.copyWith(color: AppColors.white)),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Icon(Icons.arrow_forward_rounded, color: AppColors.white, size: 18),
                    ),
                    Text(to, style: AppTextStyles.titleSmall.copyWith(color: AppColors.white)),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  '$time • $busType',
                  style: AppTextStyles.caption.copyWith(color: AppColors.white.withValues(alpha: 0.82)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LegendItem {
  const _LegendItem(this.color, this.label, {this.border});

  final Color color;
  final String label;
  final Color? border;
}

class _LegendCard extends StatelessWidget {
  const _LegendCard({required this.items});

  final List<_LegendItem> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.surfacePrimary,
        borderRadius: AppRadius.extraLargeAll,
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Wrap(
        spacing: 12,
        runSpacing: 10,
        alignment: WrapAlignment.center,
        children: items.map((item) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  color: item.color,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: item.border ?? item.color),
                ),
              ),
              const SizedBox(width: 5),
              Text(item.label, style: AppTextStyles.captionSmall.copyWith(color: AppColors.textSecondary)),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class _SeatDeck extends StatelessWidget {
  const _SeatDeck({
    required this.seatMap,
    required this.onSeatTap,
    required this.seatColor,
  });

  final List<List<SeatData?>> seatMap;
  final void Function(int row, int col) onSeatTap;
  final Color Function(SeatStatus status) seatColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(AppSpacing.md, AppSpacing.md, AppSpacing.md, AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.surfacePrimary,
        borderRadius: AppRadius.cardLarge,
        border: Border.all(color: AppColors.borderLight),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.04),
            blurRadius: 28,
            offset: const Offset(0, 16),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text('Tầng dưới', style: AppTextStyles.titleSmall),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.gray100,
                  borderRadius: AppRadius.pillAll,
                ),
                child: Row(
                  children: [
                    const Icon(Icons.airline_seat_recline_extra_rounded, size: 18, color: AppColors.gray600),
                    const SizedBox(width: 6),
                    Text('Tài xế', style: AppTextStyles.labelSmall),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          ...List.generate(seatMap.length, (row) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(seatMap[row].length, (col) {
                  final seat = seatMap[row][col];
                  if (seat == null) return const SizedBox(width: 24);
                  return _SeatTile(
                    seat: seat,
                    color: seatColor(seat.status),
                    onTap: () => onSeatTap(row, col),
                  );
                }),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _SeatTile extends StatelessWidget {
  const _SeatTile({required this.seat, required this.color, required this.onTap});

  final SeatData seat;
  final Color color;
  final VoidCallback onTap;

  bool get _isDark => seat.status == SeatStatus.selected || seat.status == SeatStatus.blocked;
  bool get _isDisabled => seat.status == SeatStatus.booked || seat.status == SeatStatus.blocked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _isDisabled ? null : onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        width: 52,
        height: 56,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: seat.status == SeatStatus.selected
                ? AppColors.primaryDark
                : seat.status == SeatStatus.vip
                    ? AppColors.seatVIP
                    : AppColors.borderNormal,
            width: seat.status == SeatStatus.selected ? 1.8 : 1,
          ),
          boxShadow: seat.status == SeatStatus.selected
              ? [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.28),
                    blurRadius: 14,
                    offset: const Offset(0, 7),
                  ),
                ]
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.event_seat_rounded,
              size: 17,
              color: _isDark ? AppColors.white : AppColors.textPrimary,
            ),
            const SizedBox(height: 3),
            Text(
              seat.label,
              style: AppTextStyles.labelSmall.copyWith(
                color: _isDark ? AppColors.white : AppColors.textPrimary,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomBookingBar extends StatelessWidget {
  const _BottomBookingBar({
    required this.selectedCount,
    required this.totalPrice,
    required this.onContinue,
  });

  final int selectedCount;
  final String totalPrice;
  final VoidCallback? onContinue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(AppSpacing.md, AppSpacing.md, AppSpacing.md, AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surfacePrimary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.08),
            blurRadius: 24,
            offset: const Offset(0, -10),
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
                  Text('$selectedCount ghế đã chọn', style: AppTextStyles.caption),
                  const SizedBox(height: 3),
                  Text(
                    '${totalPrice}đ',
                    style: AppTextStyles.titleLarge.copyWith(color: AppColors.primary),
                  ),
                ],
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            SizedBox(
              height: 54,
              child: ElevatedButton(
                onPressed: onContinue,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  shape: RoundedRectangleBorder(borderRadius: AppRadius.button),
                ),
                child: const Text('Tiếp tục'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
