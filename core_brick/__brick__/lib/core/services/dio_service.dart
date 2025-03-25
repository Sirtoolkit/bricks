import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../error/app_exception.dart';

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

class _LoggerInterceptor extends Interceptor {}

class _ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw TimeoutException(err.message ?? '');
      case DioExceptionType.badResponse:
        switch (err.response?.statusCode) {
          case 400:
            throw BadRequestException(err.message ?? '');
          case 401:
            throw UnauthorizedException(err.message ?? '');
          case 404:
            throw NotFoundException(err.message ?? '');
          case 500:
            throw ServerException(err.message ?? '');
        }
      case DioExceptionType.unknown:
        throw NetworkException(err.message ?? '');
      default:
        throw DioFailure(err.message ?? '');
    }
  }
}
