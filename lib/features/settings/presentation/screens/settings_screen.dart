/// BusZ — Settings Screen
///
/// Source of Truth: BusZ-Documentation/06_Flutter/10_Profile_Module.md
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:busz/core/theme/app_colors.dart';
import 'package:busz/core/theme/app_text_styles.dart';
import 'package:busz/core/theme/app_spacing.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cài đặt'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
          onPressed: () => context.pop(),
        ),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Chế độ Dark Mode'),
            value: false,
            onChanged: (v) {},
          ),
          ListTile(
            title: const Text('Ngôn ngữ'),
            trailing: const Text('Tiếng Việt', style: TextStyle(color: AppColors.primary)),
            onTap: () {},
          ),
          SwitchListTile(
            title: const Text('Nhận thông báo khuyến mãi'),
            value: true,
            onChanged: (v) {},
          ),
          const Divider(),
          ListTile(
            title: const Text('Chính sách bảo mật'),
            trailing: const Icon(Icons.open_in_new_rounded, size: 16),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Điều khoản sử dụng'),
            trailing: const Icon(Icons.open_in_new_rounded, size: 16),
            onTap: () {},
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(AppSpacing.md),
            child: Text('Phiên bản 1.0.0', textAlign: TextAlign.center, style: TextStyle(color: AppColors.gray500)),
          ),
        ],
      ),
    );
  }
}
