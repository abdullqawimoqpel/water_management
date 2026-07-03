/// API endpoint constants.
///
/// Centralized location for all API routes.
/// All endpoints are relative to the base URL defined in [EnvConfig].
class ApiConstants {
  ApiConstants._();

  // ── Base path ─────────────────────────────────────────────────────
  static const String apiVersion = 'v1';
  static const String basePath = '/api/$apiVersion';

  // ── Auth ──────────────────────────────────────────────────────────
  static const String login = '$basePath/auth/login';
  static const String logout = '$basePath/auth/logout';
  static const String refreshToken = '$basePath/auth/refresh';

  // ── Customers ─────────────────────────────────────────────────────
  static const String customers = '$basePath/customers';
  static String customerById(String id) => '$customers/$id';
  static String customerTimeline(String id) => '$customers/$id/timeline';

  // ── Meters ────────────────────────────────────────────────────────
  static const String meters = '$basePath/meters';
  static String meterById(String id) => '$meters/$id';

  // ── Readings ──────────────────────────────────────────────────────
  static const String readings = '$basePath/readings';
  static String readingById(String id) => '$readings/$id';

  // ── Invoices ──────────────────────────────────────────────────────
  static const String invoices = '$basePath/invoices';
  static String invoiceById(String id) => '$invoices/$id';

  // ── Payments ──────────────────────────────────────────────────────
  static const String payments = '$basePath/payments';
  static String paymentById(String id) => '$payments/$id';

  // ── Sync ──────────────────────────────────────────────────────────
  static const String sync = '$basePath/sync';
  static const String syncUpload = '$basePath/sync/upload';
  static const String syncDownload = '$basePath/sync/download';
}
