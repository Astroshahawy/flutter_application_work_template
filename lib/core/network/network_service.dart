import '../exceptions/error_model.dart';

sealed class NetworkService<T> {
  const NetworkService();
  factory NetworkService.succeed(T data) = Success<T>;
  factory NetworkService.failure(ApiErrorModel errorModel) = Failure<T>;
}

class Success<T> extends NetworkService<T> {
  final T data;
  const Success(this.data);
}

class Failure<T> extends NetworkService<T> {
  final ApiErrorModel errorModel;
  const Failure(this.errorModel);
}
