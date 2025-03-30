import 'package:freezed_annotation/freezed_annotation.dart';
import '../../core/error/app_exception.dart';

part 'data_state.freezed.dart';

@freezed
sealed class DataState<T> with _$DataState<T> {
  const factory DataState.initial() = DataStateInitial<T>;
  const factory DataState.loading() = DataStateLoading<T>;
  const factory DataState.success(T data) = DataStateSuccess<T>;
  const factory DataState.error(String message, AppException error) =
      DataStateError<T>;
}
