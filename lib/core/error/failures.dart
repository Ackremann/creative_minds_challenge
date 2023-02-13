import 'package:equatable/equatable.dart';

import '../utils/strings_manager.dart';

abstract class Failure extends Equatable {
  const Failure();
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  const ServerFailure();
}

class BadRequestFailure extends Failure {
  const BadRequestFailure();
}

class CacheFailure extends Failure {
  const CacheFailure();
}

class OfflineFailure extends Failure {
  const OfflineFailure();
  @override
  List<Object?> get props => [];
}

String mapFailureToMsg(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return AppStrings.serverFailure;
    case CacheFailure:
      return AppStrings.cacheFailure;
    case OfflineFailure:
      return AppStrings.offlineFailure;
    default:
      return AppStrings.unexpectedError;
  }
}
