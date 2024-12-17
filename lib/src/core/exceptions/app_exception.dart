import 'package:dio/dio.dart';

class AppException implements Exception {
  final String message;
  final Object? error;
  final StackTrace stackTrace;

  const AppException(
    this.message, {
    required this.error,
    required this.stackTrace,
  });

  @override
  String toString() => message;

  static AppException fromError({
    required Object error,
    required StackTrace stackTrace,
    String? fallbackMessage,
  }) {
    if (error is DioException) {
      final errorMessage =
          error.response?.data['message'] ?? error.message ?? fallbackMessage;

      return AppException(
        errorMessage,
        stackTrace: stackTrace,
        error: error,
      );
    } else {
      return AppException(
        fallbackMessage ?? error.toString(),
        error: error,
        stackTrace: stackTrace,
      );
    }
  }
}
