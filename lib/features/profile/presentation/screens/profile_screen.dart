/// BusZ — Profile Screen
///
/// Source of Truth: BusZ-Documentation/06_Flutter/10_Profile_Module.md
///
/// Shows: User info, quick actions, account settings, travel history,
///        security, settings, and logout.
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:go_router/go_router.dart';
import 'package:busz/core/theme/app_colors.dart';
import 'package:busz/core/theme/app_text_styles.dart';
import 'package:busz/core/theme/app_spacing.dart';
import 'package:busz/core/theme/app_radius.dart';
import 'package:busz/core/router/route_names.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tài khoản'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          children: [
            // Profile Header
            Row(
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundColor: AppColors.primaryLight,
                  child: Text('A', style: AppTextStyles.headline.copyWith(color: AppColors.primary)),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nguyễn Văn A', style: AppTextStyles.titleMedium),
                      const SizedBox(height: 2),
                      Text('0912 345 678', style: AppTextStyles.bodyMedium),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppColors.warningLight,
                          borderRadius: AppRadius.pillAll,
                        ),
                        child: Text(
                          'Thành viên Vàng',
                          style: AppTextStyles.captionSmall.copyWith(color: AppColors.warning),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Symbols.edit_rounded),
                  onPressed: () => context.push(RouteNames.editProfile),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.xl),

            // Quick Actions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildQuickAction(Symbols.wallet_rounded, 'Ví BusZ', () {}),
                _buildQuickAction(Symbols.confirmation_number_rounded, 'Vé của tôi', () => context.go(RouteNames.bookings)),
                _buildQuickAction(Symbols.local_offer_rounded, 'Khuyến mãi', () {}),
                _buildQuickAction(Symbols.support_agent_rounded, 'Hỗ trợ', () {}),
              ],
            ),
            const SizedBox(height: AppSpacing.xl),

            // Sections
            _buildSection(
              title: 'Cài đặt tài khoản',
              children: [
                _buildListTile(Symbols.person_rounded, 'Chỉnh sửa thông tin', onTap: () => context.push(RouteNames.editProfile)),
                _buildListTile(Symbols.location_on_rounded, 'Địa chỉ của tôi', onTap: () {}),
                _buildListTile(Symbols.credit_card_rounded, 'Phương thức thanh toán', onTap: () {}),
              ],
            ),
            
            _buildSection(
              title: 'Lịch sử & Chuyến đi',
              children: [
                _buildListTile(
                  Symbols.history_rounded,
                  'Lịch sử đặt vé',
                  onTap: () => context.push(RouteNames.bookingHistory),
                ),
                _buildListTile(
                  Symbols.favorite_rounded,
                  'Tuyến đường yêu thích',
                  onTap: () => context.push(RouteNames.favoriteRoutes),
                ),
              ],
            ),

            _buildSection(
              title: 'Bảo mật & Cài đặt',
              children: [
                _buildListTile(
                  Symbols.security_rounded,
                  'Đổi mật khẩu',
                  onTap: () => context.push(RouteNames.changePassword),
                ),
                _buildListTile(Symbols.settings_rounded, 'Cài đặt ứng dụng', onTap: () => context.push(RouteNames.settings)),
              ],
            ),

            const SizedBox(height: AppSpacing.lg),
            
            SizedBox(
              width: double.infinity,
              child: TextButton.icon(
                onPressed: () => _showLogoutDialog(context),
                style: TextButton.styleFrom(foregroundColor: AppColors.error),
                icon: const Icon(Symbols.logout_rounded),
                label: const Text('Đăng xuất'),
              ),
            ),
            const SizedBox(height: AppSpacing.xxl),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Đăng xuất'),
        content: const Text('Bạn có chắc chắn muốn đăng xuất khỏi ứng dụng?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Hủy'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              context.go(RouteNames.auth);
            },
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.error),
            child: const Text('Đăng xuất'),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickAction(IconData icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: AppRadius.mediumAll,
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xs),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(AppSpacing.sm),
              decoration: BoxDecoration(
                color: AppColors.gray100,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: AppColors.primary),
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(label, style: AppTextStyles.captionSmall),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required List<Widget> children}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
          child: Text(title, style: AppTextStyles.titleSmall),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.surfaceCard,
            borderRadius: AppRadius.card,
            border: Border.all(color: AppColors.borderLight),
          ),
          child: Column(
            children: children,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
      ],
    );
  }

  Widget _buildListTile(IconData icon, String title, {VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: AppColors.textSecondary),
      title: Text(title, style: AppTextStyles.bodyMedium),
      trailing: const Icon(Symbols.chevron_right_rounded, color: AppColors.gray500),
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: AppRadius.card),
    );
  }
}
