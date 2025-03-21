import '../error/app_exception.dart';

class Result<T> {
  final T? data;
  final AppException? error;
  final bool isSuccess;

  Result._({this.data, this.error, required this.isSuccess});

  // Método when para manejo funcional de éxito y error
  R when<R>({
    required R Function(T data) success,
    required R Function(AppException error) failure,
  }) {
    if (isSuccess) {
      return success(data as T);
    } else {
      return failure(error!);
    }
  }

  // Métodos adicionales útiles
  T getOrElse(T defaultValue) => isSuccess ? data! : defaultValue;

  Result<U> map<U>(U Function(T) transform) {
    return isSuccess ? Success<U>(transform(data as T)) : Error<U>(error!);
  }
}

class Success<T> extends Result<T> {
  Success(T data) : super._(data: data, isSuccess: true);
}

class Error<T> extends Result<T> {
  Error(AppException error) : super._(error: error, isSuccess: false);
}
