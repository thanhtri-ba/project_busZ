/// BusZ Navigation — GoRouter Configuration
///
/// Source of Truth: BusZ-Documentation/06_Flutter/03_Navigation.md
///
/// Uses GoRouter with ShellRoute for Bottom Navigation.
/// Supports:
/// - Authentication Guard (§8)
/// - Nested Navigation with state preservation (§7)
/// - Deep Linking (§11)
/// - Route Transitions (§13)
/// - 404 Error Route (§15)
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:busz/core/router/route_names.dart';

// Existing screens (kept as-is per Option B)
import 'package:busz/screens/onboarding/splash_screen.dart';
import 'package:busz/screens/onboarding/onboarding_screen.dart';
import 'package:busz/screens/auth/auth_screen.dart';
import 'package:busz/screens/auth/otp_screen.dart';
import 'package:busz/screens/auth/country_code_screen.dart';
import 'package:busz/screens/auth/login_password_screen.dart';
import 'package:busz/screens/auth/set_password_screen.dart';
import 'package:busz/screens/auth/forgot_password_screen.dart';
import 'package:busz/screens/auth/set_new_password_screen.dart';
import 'package:busz/screens/home/home_screen.dart';
import 'package:busz/screens/home/intercity_search_screen.dart';
import 'package:busz/screens/home/search_city_screen.dart';
import 'package:busz/screens/home/search_results_screen.dart';

// New feature screens (will be added as they are built)
import 'package:busz/features/main_shell/main_shell_screen.dart';
import 'package:busz/features/booking/presentation/screens/trip_detail_screen.dart';
import 'package:busz/features/booking/presentation/screens/seat_selection_screen.dart';
import 'package:busz/features/booking/presentation/screens/passenger_info_screen.dart';
import 'package:busz/features/booking/presentation/screens/booking_summary_screen.dart';
import 'package:busz/features/payment/presentation/screens/payment_screen.dart';
import 'package:busz/features/payment/presentation/screens/payment_result_screen.dart';
import 'package:busz/features/ticket/presentation/screens/ticket_list_screen.dart';
import 'package:busz/features/ticket/presentation/screens/ticket_detail_screen.dart';
import 'package:busz/features/profile/presentation/screens/profile_screen.dart';
import 'package:busz/features/profile/presentation/screens/edit_profile_screen.dart';
import 'package:busz/features/notification/presentation/screens/notification_screen.dart';
import 'package:busz/features/settings/presentation/screens/settings_screen.dart';
import 'package:busz/features/ai_chat/presentation/screens/ai_chat_screen.dart';
import 'package:busz/features/profile/presentation/screens/favorite_routes_screen.dart';
import 'package:busz/features/profile/presentation/screens/booking_history_screen.dart';
import 'package:busz/features/profile/presentation/screens/change_password_screen.dart';

class AppRouter {
  AppRouter._();

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  /// Check if user is authenticated.
  static bool get _isAuthenticated {
    return Supabase.instance.client.auth.currentSession != null;
  }

  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: RouteNames.splash,
    debugLogDiagnostics: true,

    // ─── Authentication Guard (Navigation.md §8) ──────────────────
    redirect: (context, state) {
      final isAuth = _isAuthenticated;
      final isAuthRoute = state.matchedLocation == RouteNames.auth ||
          state.matchedLocation == RouteNames.otp ||
          state.matchedLocation == RouteNames.loginPassword ||
          state.matchedLocation == RouteNames.setPassword ||
          state.matchedLocation == RouteNames.forgotPassword ||
          state.matchedLocation == RouteNames.setNewPassword ||
          state.matchedLocation == RouteNames.countryCode;
      final isSplash = state.matchedLocation == RouteNames.splash;
      final isOnboarding = state.matchedLocation == RouteNames.onboarding;

      // Allow splash and onboarding always
      if (isSplash || isOnboarding) return null;

      // Allow auth routes always
      if (isAuthRoute) return null;

      // Protected routes: redirect to auth if not logged in
      // (disabled for now to allow development — uncomment for production)
      // if (!isAuth) return RouteNames.auth;

      return null;
    },

    // ─── Route Transition (Navigation.md §13) ─────────────────────
    routes: [
      // ── Public routes ───────────────────────────────────────────
      GoRoute(
        path: RouteNames.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: RouteNames.onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: RouteNames.auth,
        builder: (context, state) => const AuthScreen(),
      ),
      GoRoute(
        path: RouteNames.otp,
        builder: (context, state) => const OtpScreen(),
      ),
      GoRoute(
        path: RouteNames.countryCode,
        builder: (context, state) => const CountryCodeScreen(),
      ),
      GoRoute(
        path: RouteNames.loginPassword,
        builder: (context, state) => const LoginPasswordScreen(),
      ),
      GoRoute(
        path: RouteNames.setPassword,
        builder: (context, state) => const SetPasswordScreen(),
      ),
      GoRoute(
        path: RouteNames.forgotPassword,
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      GoRoute(
        path: RouteNames.setNewPassword,
        builder: (context, state) => const SetNewPasswordScreen(),
      ),

      // ── Main Shell with Bottom Navigation (Navigation.md §6-7) ──
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => MainShellScreen(child: child),
        routes: [
          GoRoute(
            path: RouteNames.home,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: HomeScreen(),
            ),
          ),
          GoRoute(
            path: RouteNames.bookings,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: TicketListScreen(),
            ),
          ),
          GoRoute(
            path: RouteNames.notifications,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: NotificationScreen(),
            ),
          ),
          GoRoute(
            path: RouteNames.aiChat,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: AiChatScreen(),
            ),
          ),
          GoRoute(
            path: RouteNames.profile,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ProfileScreen(),
            ),
          ),
        ],
      ),

      // ── Search Flow ─────────────────────────────────────────────
      GoRoute(
        path: RouteNames.intercitySearch,
        builder: (context, state) => const IntercitySearchScreen(),
      ),
      GoRoute(
        path: RouteNames.searchCity,
        builder: (context, state) {
          final isDestination = state.uri.queryParameters['destination'] == 'true';
          return SearchCityScreen(isDestination: isDestination);
        },
      ),
      GoRoute(
        path: RouteNames.searchResults,
        builder: (context, state) => const SearchResultsScreen(),
      ),

      // ── Booking Flow ────────────────────────────────────────────
      GoRoute(
        path: '/trip/:tripId',
        builder: (context, state) {
          final tripId = state.pathParameters['tripId'] ?? '';
          return TripDetailScreen(tripId: tripId);
        },
      ),
      GoRoute(
        path: '/trip/:tripId/seats',
        builder: (context, state) {
          final tripId = state.pathParameters['tripId'] ?? '';
          return SeatSelectionScreen(tripId: tripId);
        },
      ),
      GoRoute(
        path: RouteNames.passengerInfo,
        builder: (context, state) => const PassengerInfoScreen(),
      ),
      GoRoute(
        path: RouteNames.bookingSummary,
        builder: (context, state) => const BookingSummaryScreen(),
      ),

      // ── Payment ─────────────────────────────────────────────────
      GoRoute(
        path: RouteNames.payment,
        builder: (context, state) => const PaymentScreen(),
      ),
      GoRoute(
        path: RouteNames.paymentResult,
        builder: (context, state) {
          final success = state.uri.queryParameters['success'] == 'true';
          return PaymentResultScreen(isSuccess: success);
        },
      ),

      // ── Ticket ──────────────────────────────────────────────────
      GoRoute(
        path: RouteNames.ticketList,
        builder: (context, state) => const TicketListScreen(),
      ),
      GoRoute(
        path: '/tickets/:ticketId',
        builder: (context, state) {
          final ticketId = state.pathParameters['ticketId'] ?? '';
          return TicketDetailScreen(ticketId: ticketId);
        },
      ),

      // ── Profile ─────────────────────────────────────────────────
      GoRoute(
        path: RouteNames.editProfile,
        builder: (context, state) => const EditProfileScreen(),
      ),
      GoRoute(
        path: RouteNames.favoriteRoutes,
        builder: (context, state) => const FavoriteRoutesScreen(),
      ),
      GoRoute(
        path: RouteNames.bookingHistory,
        builder: (context, state) => const BookingHistoryScreen(),
      ),
      GoRoute(
        path: RouteNames.changePassword,
        builder: (context, state) => const ChangePasswordScreen(),
      ),
      GoRoute(
        path: RouteNames.settings,
        builder: (context, state) => const SettingsScreen(),
      ),
    ],

    // ─── 404 Error Route (Navigation.md §15) ──────────────────────
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Symbols.error_outline_rounded, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            const Text('Page Not Found', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Route: ${state.matchedLocation}', style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.go(RouteNames.home),
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    ),
  );
}
