import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:water_management/core/network/network_info.dart';

/// Global dependency injection container.
///
/// Registers all application-level dependencies using GetX.
/// Feature-specific dependencies are registered in their own bindings.
class InjectionContainer {
  InjectionContainer._();

  /// Initialize all global dependencies.
  ///
  /// Must be called before [runApp] in [main.dart].
  static Future<void> init() async {
    // ── Core ──────────────────────────────────────────────────────────
    // Network info
    Get.lazyPut<Connectivity>(() => Connectivity(), fenix: true);
    Get.lazyPut<NetworkInfo>(
      () => NetworkInfoImpl(Get.find<Connectivity>()),
      fenix: true,
    );

    // ── Feature bindings are registered in their GetPage bindings ────
    // This keeps feature dependencies lazy-loaded and scoped.
  }
}
