import 'package:logger/logger.dart';

/// Centralized application logger.
///
/// Wraps the `logger` package to provide a consistent logging interface
/// throughout the application. All modules should use [AppLogger] instead
/// of `print()` or direct `Logger` instances.
class AppLogger {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
    ),
  );

  /// Log a debug message (development-only information).
  static void debug(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.d(message, error: error, stackTrace: stackTrace);
  }

  /// Log an informational message.
  static void info(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.i(message, error: error, stackTrace: stackTrace);
  }

  /// Log a warning message.
  static void warning(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.w(message, error: error, stackTrace: stackTrace);
  }

  /// Log an error message.
  static void error(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }

  /// Log a fatal/critical message.
  static void fatal(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.f(message, error: error, stackTrace: stackTrace);
  }

  /// Log a trace message (very verbose, typically disabled in production).
  static void trace(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.t(message, error: error, stackTrace: stackTrace);
  }
}
