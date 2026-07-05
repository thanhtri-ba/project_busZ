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
      backgroundColor: AppColors.backgroundPrimary,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundPrimary,
        elevation: 0,
        centerTitle: true,
        title: Text('Vé của tôi', style: AppTextStyles.titleMedium),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.gray100,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.borderLight),
            ),
            child: TabBar(
              controller: _tabController,
              labelColor: AppColors.primary,
              unselectedLabelColor: AppColors.textSecondary,
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent,
              indicator: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              labelStyle: AppTextStyles.labelSmall.copyWith(fontWeight: FontWeight.w800),
              unselectedLabelStyle: AppTextStyles.labelSmall.copyWith(fontWeight: FontWeight.w600),
              tabs: const [
                Tab(text: 'Sắp tới'),
                Tab(text: 'Lịch sử'),
                Tab(text: 'Đã hủy'),
                Tab(text: 'Hoàn tiền'),
              ],
            ),
          ),
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
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 80),
      itemCount: status == 'upcoming' ? 2 : 1,
      itemBuilder: (context, index) {
        return _buildTicketCard(
          busCompany: index == 0 ? 'Phương Trang' : 'Thành Bưởi',
          route: 'HCM → Đà Lạt',
          date: index == 0 ? '05/07/2026' : '28/06/2026',
          time: index == 0 ? '06:00' : '21:00',
          seat: index == 0 ? '1A, 1B' : '3B',
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
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: AppColors.surfaceCard,
          borderRadius: AppRadius.cardLarge,
          border: Border.all(color: AppColors.borderLight),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
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
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.primaryLight,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.directions_bus_rounded, size: 20, color: AppColors.primary),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(busCompany, style: AppTextStyles.label),
                        const SizedBox(height: 2),
                        Text(code, style: AppTextStyles.caption),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: 0.1),
                    borderRadius: AppRadius.pillAll,
                  ),
                  child: Text(
                    statusLabel,
                    style: AppTextStyles.captionSmall.copyWith(
                      color: statusColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(height: 28),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(time, style: AppTextStyles.titleSmall),
                      const SizedBox(height: 4),
                      Text(route, style: AppTextStyles.caption),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(date, style: AppTextStyles.label),
                    const SizedBox(height: 4),
                    Text('Ghế $seat', style: AppTextStyles.caption),
                  ],
                ),
              ],
            ),
            const Divider(height: 28),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(Icons.qr_code_2_rounded, size: 18, color: AppColors.primary),
                const SizedBox(width: 6),
                Text(
                  'Chi tiết vé',
                  style: AppTextStyles.labelSmall.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const Icon(Icons.chevron_right_rounded, size: 18, color: AppColors.primary),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
