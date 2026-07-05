import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:busz/core/router/route_names.dart';
import 'package:busz/core/theme/app_colors.dart';
import 'package:busz/core/theme/app_spacing.dart';
import 'package:busz/core/theme/app_text_styles.dart';

import 'package:busz/screens/home/widgets/busz_header.dart';
import 'package:busz/screens/home/widgets/balance_card.dart';
import 'package:busz/screens/home/widgets/home_search_card.dart';
import 'package:busz/screens/home/widgets/member_profile_card.dart';
import 'package:busz/screens/home/widgets/transport_type_card.dart';
import 'package:busz/screens/home/widgets/my_ticket_section.dart';
import 'package:busz/screens/home/widgets/promo_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(const Duration(milliseconds: 700));
          },
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              const SliverToBoxAdapter(child: BuszHeader()),
              SliverToBoxAdapter(
                child: HomeSearchCard(
                  onSearch: () => context.push(RouteNames.searchResults),
                  onSelectFrom: () => context.push(RouteNames.searchCity),
                  onSelectTo: () => context.push('${RouteNames.searchCity}?destination=true'),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
                  child: _WalletMemberPanel(),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TransportTypeCard(
                          icon: Icons.directions_bus_filled_rounded,
                          title: 'Intercity',
                          subtitle: 'City to city bus',
                          isSelected: true,
                          onTap: () => context.push(RouteNames.intercitySearch),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TransportTypeCard(
                          icon: Icons.airport_shuttle_rounded,
                          title: 'Local Trans',
                          subtitle: 'Nearby routes',
                          isSelected: false,
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.xl)),
              const SliverToBoxAdapter(child: _PopularRoutesSection()),
              const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.xl)),
              const SliverToBoxAdapter(child: MyTicketSection()),
              const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.xl)),
              const SliverToBoxAdapter(child: PromoSection()),
              const SliverToBoxAdapter(child: SizedBox(height: 28)),
            ],
          ),
        ),
      ),
    );
  }
}

class _WalletMemberPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfacePrimary,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.08),
            blurRadius: 26,
            offset: const Offset(0, 14),
          ),
        ],
      ),
      child: const Column(
        children: [
          BalanceCard(),
          SizedBox(height: 14),
          MemberProfileCard(),
        ],
      ),
    );
  }
}

class _PopularRoutesSection extends StatelessWidget {
  const _PopularRoutesSection();

  @override
  Widget build(BuildContext context) {
    final routes = [
      ('TP. HCM', 'Đà Lạt', '280.000đ', '4.8'),
      ('TP. HCM', 'Nha Trang', '320.000đ', '4.7'),
      ('Hà Nội', 'Sapa', '350.000đ', '4.9'),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Popular routes',
                  style: AppTextStyles.titleMedium.copyWith(fontWeight: FontWeight.w900),
                ),
              ),
              TextButton(
                onPressed: () => context.push(RouteNames.intercitySearch),
                child: const Text('See all'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 142,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            itemCount: routes.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final route = routes[index];
              return _PopularRouteCard(
                from: route.$1,
                to: route.$2,
                price: route.$3,
                rating: route.$4,
                onTap: () => context.push(RouteNames.searchResults),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _PopularRouteCard extends StatelessWidget {
  const _PopularRouteCard({
    required this.from,
    required this.to,
    required this.price,
    required this.rating,
    required this.onTap,
  });

  final String from;
  final String to;
  final String price;
  final String rating;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(26),
      child: Container(
        width: 230,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surfacePrimary,
          borderRadius: BorderRadius.circular(26),
          border: Border.all(color: AppColors.borderLight),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.045),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(Icons.directions_bus_rounded, color: AppColors.textWhite),
                ),
                const Spacer(),
                const Icon(Icons.star_rounded, color: AppColors.accent, size: 18),
                const SizedBox(width: 3),
                Text(rating, style: AppTextStyles.labelSmall.copyWith(fontWeight: FontWeight.w800)),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                Text(from, style: AppTextStyles.titleSmall.copyWith(fontWeight: FontWeight.w900)),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7),
                  child: Icon(Icons.arrow_forward_rounded, size: 18, color: AppColors.textSecondary),
                ),
                Text(to, style: AppTextStyles.titleSmall.copyWith(fontWeight: FontWeight.w900)),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'From $price',
              style: AppTextStyles.label.copyWith(color: AppColors.primary, fontWeight: FontWeight.w900),
            ),
          ],
        ),
      ),
    );
  }
}
