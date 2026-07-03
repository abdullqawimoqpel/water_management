import 'package:water_management/core/config/env_config.dart';

/// Top-level application configuration.
///
/// Holds the current [EnvConfig] and provides a single point
/// of access for environment-dependent settings.
class AppConfig {
  static EnvConfig _envConfig = EnvConfig.development;

  AppConfig._();

  /// Initialize the application configuration with the given environment.
  static void init({required EnvConfig envConfig}) {
    _envConfig = envConfig;
  }

  /// The current environment configuration.
  static EnvConfig get env => _envConfig;

  /// The current API base URL.
  static String get apiBaseUrl => _envConfig.apiBaseUrl;

  /// Whether logging is enabled.
  static bool get isLoggingEnabled => _envConfig.enableLogging;

  /// Whether analytics is enabled.
  static bool get isAnalyticsEnabled => _envConfig.enableAnalytics;
}
