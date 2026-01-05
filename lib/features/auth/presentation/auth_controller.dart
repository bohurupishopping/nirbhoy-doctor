import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import '../data/auth_repository.dart';
import '../domain/user_model.dart';
import '../../../routes.dart';

// State provider for the current user
final currentUserProvider = StateProvider<UserModel?>((ref) => null);

final authControllerProvider =
    StateNotifierProvider<AuthController, AsyncValue<void>>((ref) {
      return AuthController(ref.watch(authRepositoryProvider), ref);
    });

class AuthController extends StateNotifier<AsyncValue<void>> {
  final AuthRepository _authRepository;
  final Ref _ref;

  AuthController(this._authRepository, this._ref)
    : super(const AsyncData(null));

  Future<void> signIn({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = const AsyncLoading();

    try {
      final response = await _authRepository.signInWithEmailPassword(
        email,
        password,
      );

      if (response.user == null) {
        throw 'Login failed: No user returned';
      }

      // Check Role & Clinic
      final userModel = await _authRepository.getCurrentUserProfile();

      if (userModel == null) {
        await _authRepository.signOut();
        throw 'Profile not found. Please contact admin.';
      }

      if (userModel.role != 'doctor' && userModel.role != 'admin') {
        await _authRepository.signOut();
        throw 'Access Denied: You do not have doctor privileges.';
      }

      // Update global user state
      _ref.read(currentUserProvider.notifier).state = userModel;

      state = const AsyncData(null);

      if (context.mounted) {
        context.go(Routes.dashboard);
      }
    } catch (e, st) {
      state = AsyncError(e, st);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
        );
      }
    }
  }

  Future<void> signOut(BuildContext context) async {
    await _authRepository.signOut();
    _ref.read(currentUserProvider.notifier).state = null;
    if (context.mounted) {
      context.go(Routes.login);
    }
  }

  // Method to check session on app start
  Future<void> checkSession() async {
    final userModel = await _authRepository.getCurrentUserProfile();
    if (userModel != null &&
        (userModel.role == 'doctor' || userModel.role == 'admin')) {
      _ref.read(currentUserProvider.notifier).state = userModel;
    }
  }
}
