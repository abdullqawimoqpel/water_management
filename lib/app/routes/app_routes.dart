/// Route name constants for the application.
///
/// All route names are defined here as static constants
/// to prevent typos and enable easy refactoring.
class AppRoutes {
  AppRoutes._();

  // ── Root ───────────────────────────────────────────────────────────
  static const String splash = '/splash';
  static const String home = '/home';

  // ── Auth ───────────────────────────────────────────────────────────
  static const String login = '/login';

  // ── Customers ─────────────────────────────────────────────────────
  static const String customers = '/customers';
  static const String customerDetail = '/customers/detail';
  static const String customerCreate = '/customers/create';
  static const String customerTimeline = '/customers/timeline';

  // ── Readings ──────────────────────────────────────────────────────
  static const String readings = '/readings';
  static const String readingCreate = '/readings/create';

  // ── Invoices ──────────────────────────────────────────────────────
  static const String invoices = '/invoices';
  static const String invoiceDetail = '/invoices/detail';

  // ── Payments ──────────────────────────────────────────────────────
  static const String payments = '/payments';
  static const String paymentCreate = '/payments/create';

  // ── Reports ───────────────────────────────────────────────────────
  static const String reports = '/reports';

  // ── Settings ──────────────────────────────────────────────────────
  static const String settings = '/settings';
}
