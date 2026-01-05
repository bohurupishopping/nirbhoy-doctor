import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'core/constants/supa_config.dart';
import 'routes.dart';
import 'core/services/update_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: SupabaseConfig.url,
    anonKey: SupabaseConfig.anonKey,
    authOptions: const FlutterAuthClientOptions(
      authFlowType: AuthFlowType.pkce,
      localStorage: SecureLocalStorage(),
    ),
  );

  runApp(const ProviderScope(child: NirbhoyDoctorApp()));
}

class NirbhoyDoctorApp extends ConsumerStatefulWidget {
  const NirbhoyDoctorApp({super.key});

  @override
  ConsumerState<NirbhoyDoctorApp> createState() => _NirbhoyDoctorAppState();
}

class _NirbhoyDoctorAppState extends ConsumerState<NirbhoyDoctorApp> {
  late final AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();
    // Session check is now handled in SplashPage
    _listener = AppLifecycleListener(onResume: _checkForUpdates);
  }

  @override
  void dispose() {
    _listener.dispose();
    super.dispose();
  }

  Future<void> _checkForUpdates() async {
    // Check for updates when app resumes
    final updateAvailable = await UpdateService.checkForUpdate();
    if (updateAvailable) {
      await UpdateService.performImmediateUpdate();
    }
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'Nirbhoy Doctor',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0F172A),
        ), // Slate 900
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}

// Wrapper for Secure Storage to implement LocalStorage interface
class SecureLocalStorage extends LocalStorage {
  const SecureLocalStorage(); // Secure Storage with Android Options
  static const _storage = FlutterSecureStorage();
  // We don't need to await the read here anymore as we do it in SplashPage/AuthRepo()

  @override
  Future<void> initialize() async {}

  @override
  Future<bool> hasAccessToken() async {
    return await _storage.containsKey(key: supabasePersistSessionKey);
  }

  @override
  Future<String?> accessToken() async {
    return await _storage.read(key: supabasePersistSessionKey);
  }

  @override
  Future<void> persistSession(String persistSessionString) async {
    await _storage.write(
      key: supabasePersistSessionKey,
      value: persistSessionString,
    );
  }

  @override
  Future<void> removePersistedSession() async {
    await _storage.delete(key: supabasePersistSessionKey);
  }
}
