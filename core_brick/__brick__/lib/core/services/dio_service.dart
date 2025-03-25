import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DioService {
  late final Dio _dio;

  DioService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'YOUR_BASE_URL',
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 3),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    )..interceptors.addAll([_LoggerInterceptor(), _ErrorInterceptor()]);
  }

  Dio get client => _dio;
}

class _LoggerInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('REQUEST[${options.method}] => PATH: ${options.path}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
    );
    return super.onError(err, handler);
  }
}

class _ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw TimeoutException(err.message);
      case DioExceptionType.badResponse:
        switch (err.response?.statusCode) {
          case 400:
            throw BadRequestException(err.message);
          case 401:
            throw UnauthorizedException(err.message);
          case 404:
            throw NotFoundException(err.message);
          case 500:
            throw ServerException(err.message);
        }
      case DioExceptionType.unknown:
        throw NetworkException(err.message);
      default:
        throw DioFailure(err.message);
    }
  }
}

class TimeoutException extends DioFailure {
  TimeoutException([String message = 'Connection timeout']) : super(message);
}

class BadRequestException extends DioFailure {
  BadRequestException([String message = 'Bad request']) : super(message);
}
