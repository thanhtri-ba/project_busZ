import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:busz/core/router/route_names.dart';
import 'package:busz/core/theme/app_colors.dart';
import 'package:busz/core/theme/app_spacing.dart';

// Home Widgets
import 'package:busz/screens/home/widgets/busz_header.dart';
import 'package:busz/screens/home/widgets/balance_card.dart';
import 'package:busz/screens/home/widgets/member_profile_card.dart';
import 'package:busz/screens/home/widgets/transport_type_card.dart';
import 'package:busz/screens/home/widgets/my_ticket_section.dart';
import 'package:busz/screens/home/widgets/promo_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfacePrimary,
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
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
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
                          subtitle: 'Book city to city bus',
                          isSelected: true,
                          onTap: () => context.push(RouteNames.intercitySearch),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TransportTypeCard(
                          icon: Icons.airport_shuttle_rounded,
                          title: 'Local Trans',
                          subtitle: 'Nearby public routes',
                          isSelected: false,
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.08),
            blurRadius: 24,
            offset: const Offset(0, 12),
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
