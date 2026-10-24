
import 'package:dio/dio.dart';
import 'package:ecommerce_app_huma_volve/core/failure/failure.dart';


class ErrorHandler {
  static FailureApp getErrorMessage(Exception error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return FailureApp(
            failureMessage: 'Connection timeout',
          );

        case DioExceptionType.sendTimeout:
          return FailureApp(
            failureMessage: 'Send timeout',
          );

        case DioExceptionType.receiveTimeout:
          return FailureApp(
            failureMessage: 'Receive timeout',
          );

        case DioExceptionType.badResponse:
          return FailureApp(
            failureMessage: _handleStatusCode(
              error.response?.statusCode,
            ),
          );

        case DioExceptionType.cancel:
          return FailureApp(
            failureMessage: 'Request cancelled',
          );

        case DioExceptionType.connectionError:
          return FailureApp(
            failureMessage: 'No internet connection',
          );

        default:
          return FailureApp(
            failureMessage: 'Something went wrong',
          );
      }
    }

    return FailureApp(
      failureMessage: 'Unexpected error',
    );
  }

  static String _handleStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad request';

      case 401:
        return 'Unauthorized';

      case 403:
        return 'Forbidden';

      case 404:
        return 'Not found';

      case 500:
        return 'Internal server error';

      default:
        return 'Something went wrong';
    }
  }
}
