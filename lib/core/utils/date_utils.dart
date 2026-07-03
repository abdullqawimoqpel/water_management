import 'package:intl/intl.dart';

/// Date utility helpers for consistent date formatting across the application.
class AppDateUtils {
  AppDateUtils._();

  /// Standard date format: 2024-01-15
  static String formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  /// Standard date-time format: 2024-01-15 14:30:00
  static String formatDateTime(DateTime date) {
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(date);
  }

  /// Display-friendly date: Jan 15, 2024
  static String formatDisplayDate(DateTime date) {
    return DateFormat.yMMMd().format(date);
  }

  /// Display-friendly date-time: Jan 15, 2024 2:30 PM
  static String formatDisplayDateTime(DateTime date) {
    return DateFormat.yMMMd().add_jm().format(date);
  }

  /// Relative time: "3 minutes ago", "2 hours ago", "yesterday"
  static String timeAgo(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inSeconds < 60) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      final minutes = difference.inMinutes;
      return '$minutes ${minutes == 1 ? 'minute' : 'minutes'} ago';
    } else if (difference.inHours < 24) {
      final hours = difference.inHours;
      return '$hours ${hours == 1 ? 'hour' : 'hours'} ago';
    } else if (difference.inDays < 7) {
      final days = difference.inDays;
      return '$days ${days == 1 ? 'day' : 'days'} ago';
    } else {
      return formatDisplayDate(date);
    }
  }

  /// Parse an ISO 8601 string safely, returns null on failure.
  static DateTime? tryParseIso(String? dateString) {
    if (dateString == null || dateString.isEmpty) return null;
    return DateTime.tryParse(dateString);
  }

  /// Get the start of the current billing month.
  static DateTime startOfMonth([DateTime? date]) {
    final d = date ?? DateTime.now();
    return DateTime(d.year, d.month);
  }

  /// Get the end of the current billing month.
  static DateTime endOfMonth([DateTime? date]) {
    final d = date ?? DateTime.now();
    return DateTime(d.year, d.month + 1, 0, 23, 59, 59);
  }
}
