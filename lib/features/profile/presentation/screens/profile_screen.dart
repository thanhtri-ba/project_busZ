/// BusZ — Profile Screen
///
/// Source of Truth: BusZ-Documentation/06_Flutter/10_Profile_Module.md
///
/// Shows: User info, quick actions, account settings, travel history,
///        security, settings, and logout.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:busz/core/theme/app_colors.dart';
import 'package:busz/core/theme/app_text_styles.dart';
import 'package:busz/core/theme/app_radius.dart';
import 'package:busz/core/router/route_names.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundPrimary,
        elevation: 0,
        centerTitle: true,
        title: Text('Tài khoản', style: AppTextStyles.titleMedium),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 40),
        child: Column(
          children: [
            // Profile Header Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: AppRadius.cardLarge,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.18),
                    blurRadius: 24,
                    offset: const Offset(0, 12),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.white, width: 2.5),
                    ),
                    child: CircleAvatar(
                      radius: 32,
                      backgroundColor: AppColors.white.withValues(alpha: 0.2),
                      child: Text(
                        'A',
                        style: AppTextStyles.headline.copyWith(color: AppColors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nguyễn Văn A',
                          style: AppTextStyles.titleMedium.copyWith(color: AppColors.white),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          '0912 345 678',
                          style: AppTextStyles.bodyMedium.copyWith(color: AppColors.white.withValues(alpha: 0.86)),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.accent,
                            borderRadius: AppRadius.pillAll,
                          ),
                          child: Text(
                            'Thành viên Vàng',
                            style: AppTextStyles.captionSmall.copyWith(
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Material(
                    color: AppColors.white.withValues(alpha: 0.18),
                    shape: const CircleBorder(),
                    child: IconButton(
                      icon: const Icon(Icons.edit_outlined, color: AppColors.white),
                      onPressed: () => context.push(RouteNames.editProfile),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Quick Actions Card
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
              decoration: BoxDecoration(
                color: AppColors.surfaceCard,
                borderRadius: AppRadius.cardLarge,
                border: Border.all(color: AppColors.borderLight),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.035),
                    blurRadius: 18,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildQuickAction(Icons.account_balance_wallet_rounded, 'Ví BusZ', () {}),
                  _buildQuickAction(Icons.confirmation_number_rounded, 'Vé của tôi', () => context.go(RouteNames.bookings)),
                  _buildQuickAction(Icons.local_offer_rounded, 'Ưu đãi', () {}),
                  _buildQuickAction(Icons.support_agent_rounded, 'Hỗ trợ', () {}),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Sections
            _buildSection(
              title: 'Cài đặt tài khoản',
              children: [
                _buildListTile(Icons.person_outline_rounded, 'Chỉnh sửa thông tin', onTap: () => context.push(RouteNames.editProfile)),
                _buildListTile(Icons.location_on_outlined, 'Địa chỉ lưu trữ', onTap: () {}),
                _buildListTile(Icons.credit_card_rounded, 'Phương thức thanh toán', onTap: () {}),
              ],
            ),
            
            _buildSection(
              title: 'Lịch sử & Chuyến đi',
              children: [
                _buildListTile(Icons.history_rounded, 'Lịch sử đặt vé', onTap: () {}),
                _buildListTile(Icons.favorite_border_rounded, 'Tuyến đường yêu thích', onTap: () {}),
              ],
            ),

            _buildSection(
              title: 'Bảo mật & Cài đặt',
              children: [
                _buildListTile(Icons.lock_outline_rounded, 'Đổi mật khẩu', onTap: () {}),
                _buildListTile(Icons.settings_outlined, 'Cài đặt ứng dụng', onTap: () => context.push(RouteNames.settings)),
              ],
            ),

            const SizedBox(height: 14),
            
            SizedBox(
              width: double.infinity,
              height: 52,
              child: TextButton.icon(
                onPressed: () => _showLogoutDialog(context),
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.error,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                icon: const Icon(Icons.logout_rounded),
                label: const Text('Đăng xuất'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: AppRadius.cardLarge),
        title: const Text('Đăng xuất', style: TextStyle(fontWeight: FontWeight.w900)),
        content: const Text('Bạn có chắc chắn muốn đăng xuất khỏi ứng dụng BusZ?'),
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
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.error,
              foregroundColor: AppColors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text('Đăng xuất'),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickAction(IconData icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Column(
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: AppColors.primary, size: 20),
            ),
            const SizedBox(height: 8),
            Text(label, style: AppTextStyles.labelSmall.copyWith(fontWeight: FontWeight.w700)),
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
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          child: Text(title, style: AppTextStyles.titleSmall),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.surfaceCard,
            borderRadius: AppRadius.cardLarge,
            border: Border.all(color: AppColors.borderLight),
          ),
          child: Column(
            children: children,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildListTile(IconData icon, String title, {VoidCallback? onTap}) {
    return ListTile(
      leading: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: AppColors.gray100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: AppColors.textSecondary, size: 18),
      ),
      title: Text(title, style: AppTextStyles.label.copyWith(fontWeight: FontWeight.w700)),
      trailing: const Icon(Icons.chevron_right_rounded, color: AppColors.gray500, size: 20),
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: AppRadius.cardLarge),
    );
  }
}
