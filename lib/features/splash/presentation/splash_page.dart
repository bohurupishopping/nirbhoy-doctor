import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../auth/presentation/auth_controller.dart';
import '../../../routes.dart';
import '../../../core/services/update_service.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  Future<void> _checkAuth() async {
    try {
      // Minimum splash duration of 2 seconds, max wait 5 seconds for auth
      await Future.wait([
        Future.delayed(const Duration(seconds: 2)),
        ref.read(authControllerProvider.notifier).checkSession(),
        UpdateService.checkForUpdate().then((updateAvailable) async {
          if (updateAvailable) {
            await UpdateService.performImmediateUpdate();
          }
        }),
      ]).timeout(const Duration(seconds: 7));
    } catch (e) {
      // Timeout or error - we'll handle navigation below based on state
    }

    if (!mounted) return;

    final user = ref.read(currentUserProvider);

    if (user != null) {
      context.go(Routes.dashboard);
    } else {
      context.go(Routes.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/logo.png', width: 200, height: 200),
      ),
    );
  }
}
