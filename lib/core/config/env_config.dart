/// Application environment configuration.
///
/// Manages environment-specific settings such as base URLs,
/// logging levels, and feature flags.
enum Environment {
  development,
  staging,
  production,
}

class EnvConfig {
  final Environment environment;
  final String apiBaseUrl;
  final bool enableLogging;
  final bool enableAnalytics;

  const EnvConfig._({
    required this.environment,
    required this.apiBaseUrl,
    required this.enableLogging,
    required this.enableAnalytics,
  });

  /// Development environment configuration.
  static const EnvConfig development = EnvConfig._(
    environment: Environment.development,
    apiBaseUrl: 'http://localhost:8080',
    enableLogging: true,
    enableAnalytics: false,
  );

  /// Staging environment configuration.
  static const EnvConfig staging = EnvConfig._(
    environment: Environment.staging,
    apiBaseUrl: 'https://staging-api.watererpco.com',
    enableLogging: true,
    enableAnalytics: false,
  );

  /// Production environment configuration.
  static const EnvConfig production = EnvConfig._(
    environment: Environment.production,
    apiBaseUrl: 'https://api.watererpco.com',
    enableLogging: false,
    enableAnalytics: true,
  );

  bool get isDevelopment => environment == Environment.development;
  bool get isStaging => environment == Environment.staging;
  bool get isProduction => environment == Environment.production;

  @override
  String toString() => 'EnvConfig(environment: $environment, apiBaseUrl: $apiBaseUrl)';
}
