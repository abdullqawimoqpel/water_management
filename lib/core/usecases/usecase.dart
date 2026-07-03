import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:water_management/core/error/failures.dart';

/// Abstract use case contract.
///
/// Every use case in the application implements this interface.
/// [Type] is the return type on success.
/// [Params] is the parameter object passed to the use case.
///
/// Returns [Either<Failure, Type>] to handle errors functionally.
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

/// Use this when a use case does not require any parameters.
class NoParams extends Equatable {
  const NoParams();

  @override
  List<Object?> get props => [];
}
