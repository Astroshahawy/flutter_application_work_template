import '../src/app_export.dart';

sealed class NetworkService<T> {
  const NetworkService();
  factory NetworkService.succeed(T data) = Success<T>;
  factory NetworkService.failure(ErrorHandler errorHandler) = Failure<T>;
}

class Success<T> extends NetworkService<T> {
  final T data;
  const Success(this.data);
}

class Failure<T> extends NetworkService<T> {
  final ErrorHandler errorHandler;
  const Failure(this.errorHandler);
}
