import 'package:freezed_annotation/freezed_annotation.dart';
import '../error/app_exception.dart';

part 'loadable.freezed.dart';

@freezed
sealed class Loadable<T> with _$Loadable<T> {
  const factory Loadable.initial() = LoadableInitial<T>;
  const factory Loadable.loading() = LoadableLoading<T>;
  const factory Loadable.success(T data) = LoadableSuccess<T>;
  const factory Loadable.error(String message, AppException error) =
      LoadableError<T>;
}
