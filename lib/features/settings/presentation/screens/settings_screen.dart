/// BusZ — Settings Screen
///
/// Source of Truth: BusZ-Documentation/06_Flutter/10_Profile_Module.md
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:busz/core/theme/app_colors.dart';
import 'package:busz/core/theme/app_text_styles.dart';
import 'package:busz/core/theme/app_radius.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _darkMode = false;
  bool _promoNotif = true;
  bool _tripNotif = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundPrimary,
        elevation: 0,
        centerTitle: true,
        title: Text('Cài đặt', style: AppTextStyles.titleMedium),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 40),
        child: Column(
          children: [
            // Section: Cài đặt hiển thị & Ngôn ngữ
            _buildSection(
              title: 'Cá nhân hóa',
              children: [
                _buildSwitchTile(
                  icon: Icons.dark_mode_outlined,
                  title: 'Chế độ tối (Dark Mode)',
                  value: _darkMode,
                  onChanged: (val) => setState(() => _darkMode = val),
                ),
                _buildListTile(
                  icon: Icons.language_rounded,
                  title: 'Ngôn ngữ hiển thị',
                  value: 'Tiếng Việt',
                  onTap: () {},
                ),
              ],
            ),

            // Section: Cài đặt thông báo
            _buildSection(
              title: 'Cài đặt thông báo',
              children: [
                _buildSwitchTile(
                  icon: Icons.notifications_none_rounded,
                  title: 'Cập nhật chuyến đi',
                  value: _tripNotif,
                  onChanged: (val) => setState(() => _tripNotif = val),
                ),
                _buildSwitchTile(
                  icon: Icons.local_offer_outlined,
                  title: 'Thông tin ưu đãi & Sự kiện',
                  value: _promoNotif,
                  onChanged: (val) => setState(() => _promoNotif = val),
                ),
              ],
            ),

            // Section: Điều khoản & Bảo mật
            _buildSection(
              title: 'Pháp lý & Thông tin',
              children: [
                _buildListTile(
                  icon: Icons.shield_outlined,
                  title: 'Chính sách bảo mật',
                  onTap: () {},
                ),
                _buildListTile(
                  icon: Icons.description_outlined,
                  title: 'Điều khoản sử dụng',
                  onTap: () {},
                ),
              ],
            ),

            const SizedBox(height: 24),
            Text(
              'Phiên bản ứng dụng: BusZ v1.0.0 (Build 2026)',
              style: AppTextStyles.caption.copyWith(fontWeight: FontWeight.w600),
            ),
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

  Widget _buildSwitchTile({
    required IconData icon,
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
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
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeTrackColor: AppColors.primary,
      ),
      shape: RoundedRectangleBorder(borderRadius: AppRadius.cardLarge),
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required String title,
    String? value,
    required VoidCallback onTap,
  }) {
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
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (value != null)
            Text(
              value,
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w800,
              ),
            ),
          const SizedBox(width: 4),
          const Icon(Icons.chevron_right_rounded, color: AppColors.gray500, size: 20),
        ],
      ),
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: AppRadius.cardLarge),
    );
  }
}
