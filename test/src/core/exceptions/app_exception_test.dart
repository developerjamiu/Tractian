import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:tractian/src/core/exceptions/app_exception.dart';

void main() {
  group('AppException', () {
    test(
        'fromError returns AppException with DioException and response message',
        () {
      final dioError = DioException(
        requestOptions: RequestOptions(path: '/test'),
        response: Response(
          requestOptions: RequestOptions(path: '/test'),
          data: {'message': 'Custom error message'},
          statusCode: 400,
        ),
      );
      final stackTrace = StackTrace.current;

      final exception = AppException.fromError(
        error: dioError,
        stackTrace: stackTrace,
        fallbackMessage: 'Fallback message',
      );

      expect(exception, isA<AppException>());
      expect(exception.message, equals('Custom error message'));
      expect(exception.error, equals(dioError));
      expect(exception.stackTrace, equals(stackTrace));
    });

    test(
        'fromError returns AppException with DioException and no response message',
        () {
      final dioError = DioException(
        requestOptions: RequestOptions(path: '/test'),
        message: 'Default Dio error message',
      );
      final stackTrace = StackTrace.current;

      final exception = AppException.fromError(
        error: dioError,
        stackTrace: stackTrace,
        fallbackMessage: 'Fallback message',
      );

      expect(exception, isA<AppException>());
      expect(exception.message, equals('Default Dio error message'));
      expect(exception.error, equals(dioError));
      expect(exception.stackTrace, equals(stackTrace));
    });

    test(
        'fromError returns AppException with non-DioException and fallbackMessage',
        () {
      final error = Exception('Generic exception');
      final stackTrace = StackTrace.current;

      final exception = AppException.fromError(
        error: error,
        stackTrace: stackTrace,
        fallbackMessage: 'Fallback message',
      );

      expect(exception, isA<AppException>());
      expect(exception.message, equals('Fallback message'));
      expect(exception.error, equals(error));
      expect(exception.stackTrace, equals(stackTrace));
    });

    test(
        'fromError returns AppException with non-DioException and no fallbackMessage',
        () {
      final error = Exception('Generic exception');
      final stackTrace = StackTrace.current;

      final exception = AppException.fromError(
        error: error,
        stackTrace: stackTrace,
      );

      expect(exception, isA<AppException>());
      expect(exception.message, equals('Exception: Generic exception'));
      expect(exception.error, equals(error));
      expect(exception.stackTrace, equals(stackTrace));
    });

    test('toString returns the correct message', () {
      final exception = AppException(
        'Test exception message',
        error: Exception('Underlying error'),
        stackTrace: StackTrace.current,
      );

      expect(exception.toString(), equals('Test exception message'));
    });
  });
}
