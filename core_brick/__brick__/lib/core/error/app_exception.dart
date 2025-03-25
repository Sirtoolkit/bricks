class AppException implements Exception {
  final String message;

  AppException(this.message);

  @override
  String toString() => message;
}

class NetworkException extends AppException {
  NetworkException([super.message = 'No internet connection']);
}

class ServerException extends AppException {
  ServerException([super.message = 'Server error occurred']);
}

class NotFoundException extends AppException {
  NotFoundException([super.message = 'Resource not found']);
}

class ValidationException extends AppException {
  ValidationException([super.message = 'Validation error']);
}

class UnauthorizedException extends AppException {
  UnauthorizedException([super.message = 'Unauthorized access']);
}

class DioFailure extends AppException {
  DioFailure([super.message = 'Dio error occurred']);
}

class TimeoutException extends AppException {
  TimeoutException([super.message = 'Connection timeout']);
}

class BadRequestException extends AppException {
  BadRequestException([super.message = 'Bad request']);
}
