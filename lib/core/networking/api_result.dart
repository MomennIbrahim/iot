import 'package:iot_test_app/core/error/error.dart';

/// Base class for API results
abstract class ApiResult<T> {
  const ApiResult();
}

/// Success case
class Success<T> extends ApiResult<T> {
  final T data;

  const Success(this.data);
}


class Failure<T> extends ApiResult<T> {
  final RemoteServerFailure error;

  const Failure(this.error);
}
