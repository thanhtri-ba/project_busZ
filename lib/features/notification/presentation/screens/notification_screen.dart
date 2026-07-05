/// BusZ — Notification Screen
///
/// Source of Truth: BusZ-Documentation/06_Flutter/11_Notification_Module.md
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:busz/core/theme/app_colors.dart';
import 'package:busz/core/theme/app_text_styles.dart';
import 'package:busz/core/theme/app_radius.dart';
import 'package:busz/core/widgets/empty_state_widget.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<_MockNotification> _notifications = [
    _MockNotification(
      id: '1',
      icon: Icons.confirmation_number_rounded,
      color: AppColors.success,
      title: 'Đặt vé thành công!',
      message: 'Chuyến đi HCM → Đà Lạt ngày 05/07/2026 đã được xác nhận.',
      time: '10:30',
      group: 'Hôm nay',
      isUnread: true,
    ),
    _MockNotification(
      id: '2',
      icon: Icons.local_offer_rounded,
      color: AppColors.warning,
      title: 'Khuyến mãi đặc biệt 20%',
      message: 'Nhập mã HÈ2026 để được giảm 20% cho chuyến đi tiếp theo.',
      time: '08:00',
      group: 'Hôm nay',
      isUnread: true,
    ),
    _MockNotification(
      id: '3',
      icon: Icons.account_balance_wallet_rounded,
      color: AppColors.info,
      title: 'Thanh toán thành công',
      message: 'Bạn đã thanh toán 725.000đ qua VNPay.',
      time: '15:20',
      group: 'Hôm qua',
      isUnread: false,
    ),
  ];

  void _markAllAsRead() {
    setState(() {
      _notifications = _notifications.map((n) => n.copyWith(isUnread: false)).toList();
    });
  }

  void _clearNotifications() {
    setState(() {
      _notifications = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    final hasNotifications = _notifications.isNotEmpty;

    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundPrimary,
        elevation: 0,
        centerTitle: true,
        title: Text('Thông báo', style: AppTextStyles.titleMedium),
        actions: [
          if (hasNotifications) ...[
            TextButton(
              onPressed: _markAllAsRead,
              child: Text(
                'Đọc tất cả',
                style: AppTextStyles.labelSmall.copyWith(color: AppColors.primary, fontWeight: FontWeight.w800),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.delete_outline_rounded, size: 20, color: AppColors.textSecondary),
              onPressed: _clearNotifications,
            ),
          ],
        ],
      ),
      body: hasNotifications
          ? _buildNotificationList()
          : EmptyStateWidget(
              icon: Icons.notifications_none_rounded,
              title: 'Chưa có thông báo nào',
              message: 'Thông báo về hành trình, ưu đãi sẽ xuất hiện ở đây.',
              actionLabel: 'Quay lại trang chủ',
              onAction: () => context.go('/home'),
            ),
    );
  }

  Widget _buildNotificationList() {
    final groups = <String, List<_MockNotification>>{};
    for (final item in _notifications) {
      groups.putIfAbsent(item.group, () => []).add(item);
    }

    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 40),
      itemCount: groups.keys.length,
      itemBuilder: (context, groupIdx) {
        final groupName = groups.keys.elementAt(groupIdx);
        final list = groups[groupName]!;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
              child: Text(
                groupName,
                style: AppTextStyles.titleSmall.copyWith(color: AppColors.textSecondary),
              ),
            ),
            ...list.map((item) => _buildNotificationItem(item)),
            const SizedBox(height: 12),
          ],
        );
      },
    );
  }

  Widget _buildNotificationItem(_MockNotification item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: item.isUnread ? item.color.withValues(alpha: 0.05) : AppColors.surfaceCard,
        borderRadius: AppRadius.cardLarge,
        border: Border.all(
          color: item.isUnread ? item.color.withValues(alpha: 0.25) : AppColors.borderLight,
          width: item.isUnread ? 1.4 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: item.color.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(item.icon, color: item.color, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: AppTextStyles.label.copyWith(
                    fontWeight: item.isUnread ? FontWeight.w800 : FontWeight.w600,
                    color: item.isUnread ? AppColors.textPrimary : AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.message,
                  style: AppTextStyles.bodySmall.copyWith(
                    height: 1.4,
                    color: item.isUnread ? AppColors.textPrimary.withValues(alpha: 0.9) : AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  item.time,
                  style: AppTextStyles.captionSmall.copyWith(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          if (item.isUnread)
            Container(
              margin: const EdgeInsets.only(top: 4, left: 8),
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: item.color,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}

class _MockNotification {
  final String id;
  final IconData icon;
  final Color color;
  final String title;
  final String message;
  final String time;
  final String group;
  final bool isUnread;

  _MockNotification({
    required this.id,
    required this.icon,
    required this.color,
    required this.title,
    required this.message,
    required this.time,
    required this.group,
    required this.isUnread,
  });

  _MockNotification copyWith({bool? isUnread}) {
    return _MockNotification(
      id: id,
      icon: icon,
      color: color,
      title: title,
      message: message,
      time: time,
      group: group,
      isUnread: isUnread ?? this.isUnread,
    );
  }
}
