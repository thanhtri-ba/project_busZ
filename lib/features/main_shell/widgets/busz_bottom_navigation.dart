import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:busz/core/theme/app_colors.dart';

class BuszBottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BuszBottomNavigation({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? AppColors.darkSurface
            : AppColors.surfacePrimary,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.gray500,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Symbols.home_rounded),
            activeIcon: Icon(Symbols.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Symbols.confirmation_number_rounded),
            activeIcon: Icon(Symbols.confirmation_number_rounded),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Symbols.smart_toy_rounded),
            activeIcon: Icon(Symbols.smart_toy_rounded),
            label: 'AI',
          ),
          BottomNavigationBarItem(
            icon: Icon(Symbols.notifications_rounded),
            activeIcon: Icon(Symbols.notifications_rounded),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Symbols.person_rounded),
            activeIcon: Icon(Symbols.person_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
