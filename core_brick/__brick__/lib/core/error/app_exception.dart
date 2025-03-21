class AppException implements Exception {
  final String message;

  AppException(this.message);

  @override
  String toString() => message;
}

class NetworkException extends AppException {
  NetworkException([String message = 'No internet connection'])
    : super(message);
}

class ServerException extends AppException {
  ServerException([String message = 'Server error occurred']) : super(message);
}

class NotFoundException extends AppException {
  NotFoundException([String message = 'Resource not found']) : super(message);
}

class ValidationException extends AppException {
  ValidationException([String message = 'Validation error']) : super(message);
}

class UnauthorizedException extends AppException {
  UnauthorizedException([String message = 'Unauthorized access'])
    : super(message);
}
