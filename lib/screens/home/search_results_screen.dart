/// BusZ — Search Results Screen
///
/// Source of Truth: BusZ-Documentation/06_Flutter/06_Search_Module.md
///
/// Implements: Header (Search Params), Filter Bar, Sort Bar, Trip List,
/// and Trip Cards.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:busz/core/theme/app_colors.dart';
import 'package:busz/core/theme/app_text_styles.dart';
import 'package:busz/core/theme/app_spacing.dart';
import 'package:busz/core/theme/app_radius.dart';
import 'package:busz/core/router/route_names.dart';
import 'package:busz/core/widgets/loading_skeleton.dart';

class SearchResultsScreen extends StatefulWidget {
  const SearchResultsScreen({super.key});

  @override
  State<SearchResultsScreen> createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Simulate network request
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      appBar: AppBar(
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('TP. HCM', style: AppTextStyles.titleMedium),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(Icons.arrow_right_alt_rounded, size: 20),
                ),
                Text('Đà Lạt', style: AppTextStyles.titleMedium),
              ],
            ),
            const SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Th 7, 05/07', style: AppTextStyles.caption),
                const Text(' • ', style: TextStyle(color: AppColors.gray500)),
                const Icon(Icons.person, color: AppColors.gray500, size: 12),
                const SizedBox(width: 4),
                Text('1 Khách', style: AppTextStyles.caption),
              ],
            ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            onPressed: () => context.pop(), // Go back to search screen to edit
          ),
        ],
      ),
      body: Stack(
        children: [
          // Trip List
          ListView(
            padding: const EdgeInsets.only(
              left: AppSpacing.md,
              right: AppSpacing.md,
              top: AppSpacing.md,
              bottom: 100, // Space for floating filter bar
            ),
            children: [
              if (_isLoading) ...[
                const SkeletonList(itemCount: 4),
              ] else ...[
                _buildTripCard(
                  id: 'trip-1',
                  company: 'Phương Trang',
                  type: 'Giường nằm cao cấp',
                  price: '280.000đ',
                  departureTime: '06:00',
                  arrivalTime: '13:30',
                  duration: '7h 30m',
                  departureStation: 'BX Miền Đông',
                  arrivalStation: 'BX Đà Lạt',
                  seatsLeft: 12,
                  rating: '4.8',
                ),
                _buildTripCard(
                  id: 'trip-2',
                  company: 'Thành Bưởi',
                  type: 'Phòng nằm VIP',
                  price: '420.000đ',
                  departureTime: '08:00',
                  arrivalTime: '15:00',
                  duration: '7h 00m',
                  departureStation: 'BX Miền Đông',
                  arrivalStation: 'VP Nguyễn Tử Lực',
                  seatsLeft: 4,
                  rating: '4.9',
                ),
                _buildTripCard(
                  id: 'trip-3',
                  company: 'Kumho Samco',
                  type: 'Giường nằm 34 chỗ',
                  price: '250.000đ',
                  departureTime: '10:00',
                  arrivalTime: '18:00',
                  duration: '8h 00m',
                  departureStation: 'BX Miền Đông',
                  arrivalStation: 'BX Đà Lạt',
                  seatsLeft: 20,
                  rating: '4.5',
                ),
              ],
            ],
          ),

          // Floating Filter/Sort Bar
          Positioned(
            bottom: AppSpacing.xl,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: AppRadius.pillAll,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildFloatingAction(Icons.filter_alt_outlined, 'Lọc', () {}),
                      Container(width: 1, height: 24, color: AppColors.gray300),
                      _buildFloatingAction(Icons.swap_vert_rounded, 'Giá thấp nhất', () {}),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingAction(IconData icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: AppRadius.pillAll,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.sm),
        child: Row(
          children: [
            Icon(icon, size: 20, color: AppColors.textPrimary),
            const SizedBox(width: AppSpacing.xs),
            Text(label, style: AppTextStyles.label),
          ],
        ),
      ),
    );
  }

  Widget _buildTripCard({
    required String id,
    required String company,
    required String type,
    required String price,
    required String departureTime,
    required String arrivalTime,
    required String duration,
    required String departureStation,
    required String arrivalStation,
    required int seatsLeft,
    required String rating,
  }) {
    final isFewSeats = seatsLeft <= 5;

    return GestureDetector(
      onTap: () => context.push('/trip/$id'),
      child: Container(
        margin: const EdgeInsets.only(bottom: AppSpacing.md),
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.surfaceCard,
          borderRadius: AppRadius.card,
          border: Border.all(color: AppColors.borderLight),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Company Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: AppColors.gray100,
                        borderRadius: AppRadius.smallAll,
                      ),
                      child: const Icon(Icons.directions_bus, size: 16, color: AppColors.primary),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(company, style: AppTextStyles.label),
                        Text(type, style: AppTextStyles.captionSmall),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.warningLight,
                    borderRadius: AppRadius.smallAll,
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.star_rounded, size: 14, color: AppColors.warning),
                      const SizedBox(width: 2),
                      Text(rating, style: AppTextStyles.captionSmall.copyWith(color: AppColors.warning, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: AppSpacing.lg),
            
            // Route Time
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(departureTime, style: AppTextStyles.titleMedium),
                      const SizedBox(height: 2),
                      Text(departureStation, style: AppTextStyles.caption),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Text(duration, style: AppTextStyles.captionSmall),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      width: 40,
                      height: 1,
                      color: AppColors.gray300,
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(arrivalTime, style: AppTextStyles.titleMedium),
                      const SizedBox(height: 2),
                      Text(arrivalStation, style: AppTextStyles.caption),
                    ],
                  ),
                ),
              ],
            ),

            const Divider(height: AppSpacing.xl),

            // Footer (Price & Action)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(price, style: AppTextStyles.titleLarge.copyWith(color: AppColors.primary)),
                    Text(
                      'Còn $seatsLeft chỗ',
                      style: AppTextStyles.captionSmall.copyWith(
                        color: isFewSeats ? AppColors.error : AppColors.success,
                        fontWeight: isFewSeats ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () => context.push('/trip/$id/seats'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(100, 36),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                  child: const Text('Chọn ghế'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
