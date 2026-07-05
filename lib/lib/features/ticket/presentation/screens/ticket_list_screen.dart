/// BusZ — Ticket List Screen
///
/// Source of Truth: BusZ-Documentation/06_Flutter/09_Ticket_Module.md §3-4
///
/// Shows user's tickets with filter tabs:
/// Upcoming, Completed, Cancelled, Refunded
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:busz/core/theme/app_colors.dart';
import 'package:busz/core/theme/app_text_styles.dart';
import 'package:busz/core/theme/app_spacing.dart';
import 'package:busz/core/theme/app_radius.dart';
import 'package:busz/core/widgets/empty_state_widget.dart';

class TicketListScreen extends StatefulWidget {
  const TicketListScreen({super.key});

  @override
  State<TicketListScreen> createState() => _TicketListScreenState();
}

class _TicketListScreenState extends State<TicketListScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vé của tôi'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Sắp tới'),
            Tab(text: 'Hoàn thành'),
            Tab(text: 'Đã hủy'),
            Tab(text: 'Hoàn tiền'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildTicketList(status: 'upcoming'),
          _buildTicketList(status: 'completed'),
          _buildTicketList(status: 'cancelled'),
          _buildTicketList(status: 'refunded'),
        ],
      ),
    );
  }

  Widget _buildTicketList({required String status}) {
    // Sample data — will be connected to repository
    if (status == 'cancelled' || status == 'refunded') {
      return EmptyStateWidget(
        icon: Icons.confirmation_number_outlined,
        title: 'Chưa có vé nào',
        message: status == 'cancelled'
            ? 'Bạn chưa hủy vé nào.'
            : 'Bạn chưa có vé hoàn tiền nào.',
        actionLabel: 'Đặt vé mới',
        onAction: () => context.go('/home'),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(AppSpacing.md),
      itemCount: status == 'upcoming' ? 2 : 1,
      itemBuilder: (context, index) {
        return _buildTicketCard(
          busCompany: index == 0 ? 'Phương Trang' : 'Thành Bưởi',
          route: 'HCM → Đà Lạt',
          date: index == 0 ? '05/07/2026' : '28/06/2026',
          time: index == 0 ? '06:00' : '21:00',
          seat: index == 0 ? '1A' : '3B',
          code: index == 0 ? 'TK-ABC123' : 'TK-DEF456',
          status: status,
        );
      },
    );
  }

  Widget _buildTicketCard({
    required String busCompany,
    required String route,
    required String date,
    required String time,
    required String seat,
    required String code,
    required String status,
  }) {
    final statusColor = status == 'upcoming'
        ? AppColors.success
        : status == 'completed'
            ? AppColors.info
            : AppColors.gray500;
    final statusLabel = status == 'upcoming'
        ? 'Sắp khởi hành'
        : status == 'completed'
            ? 'Đã hoàn thành'
            : status == 'cancelled'
                ? 'Đã hủy'
                : 'Đã hoàn tiền';

    return GestureDetector(
      onTap: () => context.push('/tickets/$code'),
      child: Container(
        margin: const EdgeInsets.only(bottom: AppSpacing.sm),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: AppColors.primaryLight,
                        borderRadius: AppRadius.smallAll,
                      ),
                      child: const Icon(Icons.directions_bus, size: 20, color: AppColors.primary),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(busCompany, style: AppTextStyles.label),
                        Text(code, style: AppTextStyles.caption),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: AppRadius.pillAll,
                  ),
                  child: Text(statusLabel, style: AppTextStyles.captionSmall.copyWith(color: statusColor, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const Divider(height: AppSpacing.xl),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(time, style: AppTextStyles.titleSmall),
                      Text(route, style: AppTextStyles.caption),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(date, style: AppTextStyles.label),
                    Text('Ghế $seat', style: AppTextStyles.caption),
                  ],
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.qr_code_2_rounded, size: 16, color: AppColors.primary),
                const SizedBox(width: 4),
                Text('Xem vé', style: AppTextStyles.labelSmall.copyWith(color: AppColors.primary)),
                const Icon(Icons.chevron_right_rounded, size: 16, color: AppColors.primary),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
