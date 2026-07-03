import 'package:equatable/equatable.dart';

/// Base failure class for the application.
///
/// All domain-layer failures extend this class.
/// Failures represent expected error states that the UI can handle gracefully.
sealed class Failure extends Equatable {
  final String message;
  final int? code;

  const Failure({required this.message, this.code});

  @override
  List<Object?> get props => [message, code];
}

/// Failure originating from a remote server/API call.
class ServerFailure extends Failure {
  const ServerFailure({required super.message, super.code});
}

/// Failure originating from local cache/database operations.
class CacheFailure extends Failure {
  const CacheFailure({required super.message, super.code});
}

/// Failure due to network connectivity issues.
class NetworkFailure extends Failure {
  const NetworkFailure({
    super.message = 'No internet connection available.',
    super.code,
  });
}

/// Failure due to input validation errors.
class ValidationFailure extends Failure {
  final Map<String, String> fieldErrors;

  const ValidationFailure({
    required super.message,
    this.fieldErrors = const {},
    super.code,
  });

  @override
  List<Object?> get props => [message, code, fieldErrors];
}

/// Failure due to unauthorized access.
class AuthFailure extends Failure {
  const AuthFailure({
    super.message = 'Authentication required.',
    super.code,
  });
}

/// Failure due to insufficient permissions.
class PermissionFailure extends Failure {
  const PermissionFailure({
    super.message = 'You do not have permission to perform this action.',
    super.code,
  });
}
