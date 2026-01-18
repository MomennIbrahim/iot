import 'package:dio/dio.dart';

abstract class AppFailure {
  final String message;
  final int? statusCode;
  final dynamic errors;

  const AppFailure(this.message, [this.statusCode, this.errors]);

  /// Get all errors formatted nicely
  String getAllError() {
    if (errors != null && errors is Map && errors.isNotEmpty) {
      return (errors as Map).entries.map((entry) {
        final field = entry.key;
        final messages = entry.value as List;
        return "$field: ${messages.join(", ")}";
      }).join("\n");
    }
    return message;
  }
}

class RemoteServerFailure extends AppFailure {
  const RemoteServerFailure(super.message, [super.statusCode, super.errors]);

  factory RemoteServerFailure.fromDioError(DioException dioException) {
    if (dioException.type == DioExceptionType.connectionTimeout ||
        dioException.type == DioExceptionType.sendTimeout ||
        dioException.type == DioExceptionType.receiveTimeout) {
      return const RemoteServerFailure(
          'Timeout occurred, please try again later', 408);
    } else if (dioException.type == DioExceptionType.connectionError ||
        dioException.type == DioExceptionType.unknown) {
      return const RemoteServerFailure(
          'No internet connection, please check your network', 0);
    } else if (dioException.response != null) {
      return RemoteServerFailure.fromResponse(
        dioException.response!.statusCode,
        dioException.response!.data,
      );
    } else {
      return const RemoteServerFailure('Unexpected error occurred', 0);
    }
  }

  factory RemoteServerFailure.fromResponse(int? statusCode, dynamic response) {
    String defaultMessage = 'An error occurred with status code $statusCode';
    String extractedMessage = defaultMessage;
    dynamic extractedErrors;

    if (response != null && response is Map<String, dynamic>) {
      if (response.containsKey('message')) {
        extractedMessage = response['message'];
      }
      if (response.containsKey('errors')) {
        extractedErrors = response['errors'];
      }
    }

    switch (statusCode) {
      case 400:
      case 401:
      case 403:
      case 404:
        return RemoteServerFailure(
            extractedMessage, statusCode, extractedErrors);
      case 500:
        return const RemoteServerFailure(
            'Internal Server Error, please try again later', 500);
      default:
        return RemoteServerFailure(
            extractedMessage, statusCode, extractedErrors);
    }
  }
}
