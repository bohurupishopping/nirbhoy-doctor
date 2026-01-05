import 'package:flutter/foundation.dart';
import 'package:in_app_update/in_app_update.dart';

class UpdateService {
  /// Checks if an update is available on the Play Store.
  /// Returns [true] if an update is available, [false] otherwise.
  static Future<bool> checkForUpdate() async {
    try {
      final AppUpdateInfo info = await InAppUpdate.checkForUpdate();
      return info.updateAvailability == UpdateAvailability.updateAvailable;
    } catch (e) {
      if (kDebugMode) {
        print("Error checking for update: $e");
      }
      return false;
    }
  }

  /// Performs an immediate update.
  /// This will block the user interaction until the update is downloaded and installed (or failed).
  static Future<void> performImmediateUpdate() async {
    try {
      await InAppUpdate.performImmediateUpdate();
    } catch (e) {
      if (kDebugMode) {
        print("Error performing immediate update: $e");
      }
      // Depending on requirements, we might want to rethrow or handle differently.
      // For now, logging is sufficient as the app will just stay on the current version.
    }
  }
}
