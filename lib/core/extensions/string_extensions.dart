/// Common string extensions used across the application.
extension StringExtensions on String {
  /// Capitalize the first letter of the string.
  String get capitalize {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  /// Capitalize the first letter of each word.
  String get titleCase {
    if (isEmpty) return this;
    return split(' ').map((word) => word.capitalize).join(' ');
  }

  /// Check if the string is a valid phone number (basic check).
  bool get isValidPhone {
    final phoneRegex = RegExp(r'^\+?[\d\s-]{7,15}$');
    return phoneRegex.hasMatch(this);
  }

  /// Check if the string is a valid email.
  bool get isValidEmail {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(this);
  }

  /// Remove all whitespace from the string.
  String get removeWhitespace => replaceAll(RegExp(r'\s+'), '');

  /// Truncate the string to a maximum length with ellipsis.
  String truncate(int maxLength, {String suffix = '...'}) {
    if (length <= maxLength) return this;
    return '${substring(0, maxLength - suffix.length)}$suffix';
  }
}
