/// Application-wide constants.
///
/// Centralized location for magic values, default settings,
/// and configuration constants used across the application.
class AppConstants {
  AppConstants._();

  // ── Application Info ──────────────────────────────────────────────
  static const String appName = 'Water Management';
  static const String appVersion = '0.1.0';

  // ── Pagination ────────────────────────────────────────────────────
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;

  // ── Timeouts ──────────────────────────────────────────────────────
  static const Duration connectionTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const Duration syncInterval = Duration(minutes: 5);

  // ── Search ────────────────────────────────────────────────────────
  static const int minSearchLength = 2;
  static const Duration searchDebounce = Duration(milliseconds: 400);

  // ── Billing ───────────────────────────────────────────────────────
  static const int billingDayOfMonth = 1;
  static const String defaultCurrency = 'YER'; // Yemeni Rial

  // ── Local Storage Keys ────────────────────────────────────────────
  static const String tokenKey = 'auth_token';
  static const String refreshTokenKey = 'refresh_token';
  static const String userKey = 'current_user';
  static const String localeKey = 'app_locale';
  static const String themeKey = 'app_theme';
  static const String lastSyncKey = 'last_sync_timestamp';
}
