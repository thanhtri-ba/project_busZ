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
import 'package:material_symbols_icons/symbols.dart';
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
  int _remainingSeconds = 15 * 60; // 15 minutes
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
    setState(() {
      _remainingSeconds = ((1.0 - _timerController.value) * 15 * 60).round();
    });
    if (_remainingSeconds <= 0) {
      _timerController.stop();
      _showTimerExpiredDialog();
    }
  }

  void _showTimerExpiredDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
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
    // Sample seat layout: 10 rows × 4 columns (aisle between col 1 and 2)
    _seatMap = List.generate(10, (row) {
      return [
        SeatData(id: '${row}A', label: '${row + 1}A', status: row < 2 ? SeatStatus.vip : SeatStatus.available, price: row < 2 ? 350000 : 280000),
        SeatData(id: '${row}B', label: '${row + 1}B', status: row < 2 ? SeatStatus.vip : (row == 3 || row == 5 ? SeatStatus.booked : SeatStatus.available), price: row < 2 ? 350000 : 280000),
        null, // Aisle
        SeatData(id: '${row}C', label: '${row + 1}C', status: row == 4 ? SeatStatus.booked : SeatStatus.available, price: row < 2 ? 350000 : 280000),
        SeatData(id: '${row}D', label: '${row + 1}D', status: row == 7 ? SeatStatus.blocked : SeatStatus.available, price: row < 2 ? 350000 : 280000),
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
    final isTimerWarning = _remainingSeconds <= 120; // < 2 minutes warning

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chọn ghế'),
        leading: IconButton(
          icon: const Icon(Symbols.arrow_back_ios_new_rounded, size: 18),
          onPressed: () => context.pop(),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: AppSpacing.md),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: isTimerWarning ? AppColors.errorLight : AppColors.gray100,
              borderRadius: AppRadius.pillAll,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Symbols.timer_rounded,
                  size: 16,
                  color: isTimerWarning ? AppColors.error : AppColors.textSecondary,
                ),
                const SizedBox(width: 4),
                Text(
                  _timerString,
                  style: AppTextStyles.labelSmall.copyWith(
                    color: isTimerWarning ? AppColors.error : AppColors.textSecondary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Trip info banner
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            color: AppColors.primaryLight,
            child: Row(
              children: [
                const Icon(Symbols.directions_bus_rounded, color: AppColors.primary, size: 20),
                const SizedBox(width: AppSpacing.xs),
                Text('HCM', style: AppTextStyles.label.copyWith(color: AppColors.primary)),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Icon(Symbols.arrow_forward_rounded, size: 16, color: AppColors.primary),
                ),
                Text('Đà Lạt', style: AppTextStyles.label.copyWith(color: AppColors.primary)),
                const Spacer(),
                Text('06:00 - 13:30', style: AppTextStyles.caption.copyWith(color: AppColors.primary)),
              ],
            ),
          ),

          // Legend
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildLegend(AppColors.seatAvailable, 'Trống'),
                _buildLegend(AppColors.seatSelected, 'Đã chọn'),
                _buildLegend(AppColors.seatBooked, 'Đã đặt'),
                _buildLegend(AppColors.seatVIP, 'VIP'),
                _buildLegend(AppColors.seatBlocked, 'Khóa'),
              ],
            ),
          ),

          const Divider(height: 1),

          // Seat Map
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                children: [
                  // Driver icon
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.gray100,
                        borderRadius: AppRadius.smallAll,
                      ),
                      child: const Icon(Symbols.airline_seat_recline_extra_rounded, size: 24, color: AppColors.gray500),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),

                  // Seat grid
                  ...List.generate(_seatMap.length, (row) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: AppSpacing.xs),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(_seatMap[row].length, (col) {
                          final seat = _seatMap[row][col];
                          if (seat == null) {
                            return const SizedBox(width: 20);
                          }
                          return GestureDetector(
                            onTap: () => _toggleSeat(row, col),
                            child: Container(
                              width: 52,
                              height: 52,
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              decoration: BoxDecoration(
                                color: _seatColor(seat.status),
                                borderRadius: AppRadius.smallAll,
                                border: Border.all(
                                  color: seat.status == SeatStatus.selected
                                      ? AppColors.seatSelected
                                      : AppColors.borderLight,
                                  width: seat.status == SeatStatus.selected ? 2 : 1,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                seat.label,
                                style: AppTextStyles.labelSmall.copyWith(
                                  color: seat.status == SeatStatus.booked || seat.status == SeatStatus.blocked
                                      ? AppColors.white
                                      : seat.status == SeatStatus.selected
                                          ? AppColors.white
                                          : AppColors.textPrimary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),

      // Bottom Action Bar
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
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${_selectedSeats.length} ghế đã chọn',
                      style: AppTextStyles.caption,
                    ),
                    Text(
                      '${_formatPrice(_totalPrice)}đ',
                      style: AppTextStyles.titleLarge.copyWith(color: AppColors.primary),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: ElevatedButton(
                  onPressed: _selectedSeats.isEmpty
                      ? null
                      : () => context.push(RouteNames.passengerInfo),
                  child: const Text('Tiếp tục'),
                ),
              ),
            ],
          ),
        ),
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
        return AppColors.seatBooked;
      case SeatStatus.vip:
        return AppColors.seatVIP.withOpacity(0.3);
      case SeatStatus.blocked:
        return AppColors.seatBlocked;
    }
  }

  Widget _buildLegend(Color color, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color.withOpacity(color == AppColors.seatVIP ? 0.3 : 1),
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: AppColors.borderLight),
          ),
        ),
        const SizedBox(width: 4),
        Text(label, style: AppTextStyles.captionSmall),
      ],
    );
  }

  String _formatPrice(int price) {
    return price.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (match) => '${match[1]}.',
    );
  }
}
