enum EnvironmentType { development, testing, production }

class EnvironmentConfig {
  final EnvironmentType type;
  final String apiBaseUrl;
  final bool enableLogging;

  const EnvironmentConfig({
    required this.type,
    required this.apiBaseUrl,
    required this.enableLogging,
  });

  static const dev = EnvironmentConfig(
    type: EnvironmentType.development,
    apiBaseUrl: 'https://dev-api.watererp.com',
    enableLogging: true,
  );

  static const test = EnvironmentConfig(
    type: EnvironmentType.testing,
    apiBaseUrl: 'https://test-api.watererp.com',
    enableLogging: true,
  );

  static const prod = EnvironmentConfig(
    type: EnvironmentType.production,
    apiBaseUrl: 'https://api.watererp.com',
    enableLogging: false,
  );
}
