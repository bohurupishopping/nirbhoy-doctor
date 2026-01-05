import 'package:supabase_flutter/supabase_flutter.dart';
import '../domain/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(Supabase.instance.client);
});

class AuthRepository {
  final SupabaseClient _supabase;

  AuthRepository(this._supabase);

  Session? get currentSession => _supabase.auth.currentSession;
  User? get currentUser => _supabase.auth.currentUser;

  Stream<AuthState> get authStateChanges => _supabase.auth.onAuthStateChange;

  Future<AuthResponse> signInWithEmailPassword(
    String email,
    String password,
  ) async {
    return await _supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }

  final _storage = const FlutterSecureStorage();

  /// Fetches the full user profile including Role and Clinic ID.
  /// Strategy:
  /// 1. Check App Metadata (Supabase Logic - Instant)
  /// 2. Check Local Cache (Secure Storage - Fast)
  /// 3. Fetch from DB (Network - Slow) and update Cache
  Future<UserModel?> getCurrentUserProfile() async {
    final user = _supabase.auth.currentUser;
    if (user == null) return null;

    // 1. Try to get metadata from the session (fastest)
    final role = user.appMetadata['role'];
    final clinicId = user.appMetadata['clinic_id'];

    if (role != null && clinicId != null) {
      // If fully present in metadata, we trust it.
      return UserModel(
        id: user.id,
        email: user.email ?? '',
        role: role,
        clinicId: clinicId,
        fullName: user.userMetadata?['full_name'],
        avatarUrl: user.userMetadata?['avatar_url'],
      );
    }

    // 2. Try Local Cache
    try {
      final cachedJson = await _storage.read(key: 'profile_${user.id}');
      if (cachedJson != null) {
        // We found a cache! Decode and return immediately.
        // We trigger a background refresh to keep it up to date (stale-while-revalidate)
        _fetchAndCacheProfile(user.id).ignore();
        return UserModel.fromJson(jsonDecode(cachedJson));
      }
    } catch (e) {
      // Cache missing or corrupt, proceed to network
    }

    // 3. Fetch from DB
    return await _fetchAndCacheProfile(user.id);
  }

  /// Fetches from DB and writes to local cache
  Future<UserModel?> _fetchAndCacheProfile(String userId) async {
    try {
      final response = await _supabase
          .from('profiles')
          .select('role, clinic_id, full_name, avatar_url')
          .eq('id', userId)
          .single();

      final role = response['role'] as String?;
      final clinicId = response['clinic_id'] as String?;
      final fullName = response['full_name'] as String?;
      final avatarUrl = response['avatar_url'] as String?;

      if (role == null || clinicId == null) {
        return null; // Profile incomplete
      }

      final userModel = UserModel(
        id: userId,
        email: _supabase.auth.currentUser?.email ?? '',
        role: role,
        clinicId: clinicId,
        fullName: fullName,
        avatarUrl: avatarUrl,
      );

      // Save to cache
      await _storage.write(
        key: 'profile_$userId',
        value: jsonEncode(userModel.toJson()),
      );

      return userModel;
    } catch (e) {
      return null;
    }
  }
}

extension on Future {
  void ignore() {}
}
