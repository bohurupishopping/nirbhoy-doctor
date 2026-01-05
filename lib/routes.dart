import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'features/auth/presentation/login_page.dart';
import 'features/auth/presentation/auth_controller.dart';
import 'features/dashboard/presentation/dashboard_page.dart';
import 'features/patient/presentation/patient_details_page.dart';
import 'features/patient/presentation/patient_list_page.dart';
// import 'features/shared/presentation/main_layout.dart';
import 'features/booking/presentation/booking_page.dart';
import 'features/appointments/presentation/appointments_page.dart';
import 'features/finance/presentation/pages/finance_page.dart';
import 'features/splash/presentation/splash_page.dart';
import 'features/consultation/presentation/pages/consultation_page.dart';

class Routes {
  static const String login = '/login';
  static const String dashboard = '/';
  static const String splash = '/splash';
}

final routerProvider = Provider<GoRouter>((ref) {
  // Use a ValueNotifier to listen to auth changes without rebuilding the router
  final authNotifier = ValueNotifier(ref.read(currentUserProvider));

  // Update the notifier when the provider changes
  ref.listen(currentUserProvider, (_, next) {
    authNotifier.value = next;
  });

  return GoRouter(
    initialLocation: Routes.splash,
    refreshListenable: authNotifier,
    redirect: (context, state) {
      // Read directly from the provider (safe in redirect) or notifier
      final authState = ref.read(currentUserProvider);
      final isLoggedIn = authState != null;
      final isLoggingIn = state.uri.toString() == Routes.login;
      final isSplash = state.uri.toString() == Routes.splash;

      if (isSplash) return null;

      if (!isLoggedIn && !isLoggingIn) {
        return Routes.login;
      }

      if (isLoggedIn && isLoggingIn) {
        return Routes.dashboard;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: Routes.login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: Routes.dashboard,
        builder: (context, state) => const DashboardPage(),
        routes: [
          GoRoute(
            path: 'patient', // /patient
            builder: (context, state) => const PatientListPage(),
            routes: [
              GoRoute(
                path: ':id', // /patient/:id
                builder: (context, state) =>
                    PatientDetailsPage(patientId: state.pathParameters['id']!),
                routes: [
                  GoRoute(
                    path: 'booking', // /patient/:id/booking
                    builder: (context, state) =>
                        BookingPage(patientId: state.pathParameters['id']!),
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            path: 'appointments', // /appointments
            builder: (context, state) => const AppointmentsPage(),
          ),
          GoRoute(
            path: 'finance', // /finance
            builder: (context, state) => const FinancePage(),
          ),
        ],
      ),
      GoRoute(
        path: '/consultation/:id',
        builder: (context, state) =>
            ConsultationPage(appointmentId: state.pathParameters['id']!),
      ),
    ],
  );
});
