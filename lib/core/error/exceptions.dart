/// Base exception for server-related errors.
///
/// Thrown by data sources when API calls fail.
class ServerException implements Exception {
  final String message;
  final int? statusCode;

  const ServerException({required this.message, this.statusCode});

  @override
  String toString() => 'ServerException(message: $message, statusCode: $statusCode)';
}

/// Exception for local cache/database errors.
///
/// Thrown by local data sources when read/write operations fail.
class CacheException implements Exception {
  final String message;

  const CacheException({required this.message});

  @override
  String toString() => 'CacheException(message: $message)';
}

/// Exception when no internet connection is available.
class NetworkException implements Exception {
  final String message;

  const NetworkException({this.message = 'No internet connection.'});

  @override
  String toString() => 'NetworkException(message: $message)';
}

/// Exception when authentication is invalid or expired.
class AuthException implements Exception {
  final String message;

  const AuthException({this.message = 'Authentication failed.'});

  @override
  String toString() => 'AuthException(message: $message)';
}
