// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loadable.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Loadable<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message, AppException error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message, AppException error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message, AppException error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadableInitial<T> value) initial,
    required TResult Function(LoadableLoading<T> value) loading,
    required TResult Function(LoadableSuccess<T> value) success,
    required TResult Function(LoadableError<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadableInitial<T> value)? initial,
    TResult? Function(LoadableLoading<T> value)? loading,
    TResult? Function(LoadableSuccess<T> value)? success,
    TResult? Function(LoadableError<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadableInitial<T> value)? initial,
    TResult Function(LoadableLoading<T> value)? loading,
    TResult Function(LoadableSuccess<T> value)? success,
    TResult Function(LoadableError<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadableCopyWith<T, $Res> {
  factory $LoadableCopyWith(
          Loadable<T> value, $Res Function(Loadable<T>) then) =
      _$LoadableCopyWithImpl<T, $Res, Loadable<T>>;
}

/// @nodoc
class _$LoadableCopyWithImpl<T, $Res, $Val extends Loadable<T>>
    implements $LoadableCopyWith<T, $Res> {
  _$LoadableCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Loadable
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadableInitialImplCopyWith<T, $Res> {
  factory _$$LoadableInitialImplCopyWith(_$LoadableInitialImpl<T> value,
          $Res Function(_$LoadableInitialImpl<T>) then) =
      __$$LoadableInitialImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$LoadableInitialImplCopyWithImpl<T, $Res>
    extends _$LoadableCopyWithImpl<T, $Res, _$LoadableInitialImpl<T>>
    implements _$$LoadableInitialImplCopyWith<T, $Res> {
  __$$LoadableInitialImplCopyWithImpl(_$LoadableInitialImpl<T> _value,
      $Res Function(_$LoadableInitialImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of Loadable
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadableInitialImpl<T> implements LoadableInitial<T> {
  const _$LoadableInitialImpl();

  @override
  String toString() {
    return 'Loadable<$T>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadableInitialImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message, AppException error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message, AppException error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message, AppException error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadableInitial<T> value) initial,
    required TResult Function(LoadableLoading<T> value) loading,
    required TResult Function(LoadableSuccess<T> value) success,
    required TResult Function(LoadableError<T> value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadableInitial<T> value)? initial,
    TResult? Function(LoadableLoading<T> value)? loading,
    TResult? Function(LoadableSuccess<T> value)? success,
    TResult? Function(LoadableError<T> value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadableInitial<T> value)? initial,
    TResult Function(LoadableLoading<T> value)? loading,
    TResult Function(LoadableSuccess<T> value)? success,
    TResult Function(LoadableError<T> value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class LoadableInitial<T> implements Loadable<T> {
  const factory LoadableInitial() = _$LoadableInitialImpl<T>;
}

/// @nodoc
abstract class _$$LoadableLoadingImplCopyWith<T, $Res> {
  factory _$$LoadableLoadingImplCopyWith(_$LoadableLoadingImpl<T> value,
          $Res Function(_$LoadableLoadingImpl<T>) then) =
      __$$LoadableLoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$LoadableLoadingImplCopyWithImpl<T, $Res>
    extends _$LoadableCopyWithImpl<T, $Res, _$LoadableLoadingImpl<T>>
    implements _$$LoadableLoadingImplCopyWith<T, $Res> {
  __$$LoadableLoadingImplCopyWithImpl(_$LoadableLoadingImpl<T> _value,
      $Res Function(_$LoadableLoadingImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of Loadable
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadableLoadingImpl<T> implements LoadableLoading<T> {
  const _$LoadableLoadingImpl();

  @override
  String toString() {
    return 'Loadable<$T>.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadableLoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message, AppException error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message, AppException error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message, AppException error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadableInitial<T> value) initial,
    required TResult Function(LoadableLoading<T> value) loading,
    required TResult Function(LoadableSuccess<T> value) success,
    required TResult Function(LoadableError<T> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadableInitial<T> value)? initial,
    TResult? Function(LoadableLoading<T> value)? loading,
    TResult? Function(LoadableSuccess<T> value)? success,
    TResult? Function(LoadableError<T> value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadableInitial<T> value)? initial,
    TResult Function(LoadableLoading<T> value)? loading,
    TResult Function(LoadableSuccess<T> value)? success,
    TResult Function(LoadableError<T> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadableLoading<T> implements Loadable<T> {
  const factory LoadableLoading() = _$LoadableLoadingImpl<T>;
}

/// @nodoc
abstract class _$$LoadableSuccessImplCopyWith<T, $Res> {
  factory _$$LoadableSuccessImplCopyWith(_$LoadableSuccessImpl<T> value,
          $Res Function(_$LoadableSuccessImpl<T>) then) =
      __$$LoadableSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$LoadableSuccessImplCopyWithImpl<T, $Res>
    extends _$LoadableCopyWithImpl<T, $Res, _$LoadableSuccessImpl<T>>
    implements _$$LoadableSuccessImplCopyWith<T, $Res> {
  __$$LoadableSuccessImplCopyWithImpl(_$LoadableSuccessImpl<T> _value,
      $Res Function(_$LoadableSuccessImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of Loadable
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$LoadableSuccessImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$LoadableSuccessImpl<T> implements LoadableSuccess<T> {
  const _$LoadableSuccessImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'Loadable<$T>.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadableSuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of Loadable
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadableSuccessImplCopyWith<T, _$LoadableSuccessImpl<T>> get copyWith =>
      __$$LoadableSuccessImplCopyWithImpl<T, _$LoadableSuccessImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message, AppException error) error,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message, AppException error)? error,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message, AppException error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadableInitial<T> value) initial,
    required TResult Function(LoadableLoading<T> value) loading,
    required TResult Function(LoadableSuccess<T> value) success,
    required TResult Function(LoadableError<T> value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadableInitial<T> value)? initial,
    TResult? Function(LoadableLoading<T> value)? loading,
    TResult? Function(LoadableSuccess<T> value)? success,
    TResult? Function(LoadableError<T> value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadableInitial<T> value)? initial,
    TResult Function(LoadableLoading<T> value)? loading,
    TResult Function(LoadableSuccess<T> value)? success,
    TResult Function(LoadableError<T> value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class LoadableSuccess<T> implements Loadable<T> {
  const factory LoadableSuccess(final T data) = _$LoadableSuccessImpl<T>;

  T get data;

  /// Create a copy of Loadable
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadableSuccessImplCopyWith<T, _$LoadableSuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadableErrorImplCopyWith<T, $Res> {
  factory _$$LoadableErrorImplCopyWith(_$LoadableErrorImpl<T> value,
          $Res Function(_$LoadableErrorImpl<T>) then) =
      __$$LoadableErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String message, AppException error});
}

/// @nodoc
class __$$LoadableErrorImplCopyWithImpl<T, $Res>
    extends _$LoadableCopyWithImpl<T, $Res, _$LoadableErrorImpl<T>>
    implements _$$LoadableErrorImplCopyWith<T, $Res> {
  __$$LoadableErrorImplCopyWithImpl(_$LoadableErrorImpl<T> _value,
      $Res Function(_$LoadableErrorImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of Loadable
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? error = null,
  }) {
    return _then(_$LoadableErrorImpl<T>(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppException,
    ));
  }
}

/// @nodoc

class _$LoadableErrorImpl<T> implements LoadableError<T> {
  const _$LoadableErrorImpl(this.message, this.error);

  @override
  final String message;
  @override
  final AppException error;

  @override
  String toString() {
    return 'Loadable<$T>.error(message: $message, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadableErrorImpl<T> &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, error);

  /// Create a copy of Loadable
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadableErrorImplCopyWith<T, _$LoadableErrorImpl<T>> get copyWith =>
      __$$LoadableErrorImplCopyWithImpl<T, _$LoadableErrorImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message, AppException error) error,
  }) {
    return error(message, this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message, AppException error)? error,
  }) {
    return error?.call(message, this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message, AppException error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message, this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadableInitial<T> value) initial,
    required TResult Function(LoadableLoading<T> value) loading,
    required TResult Function(LoadableSuccess<T> value) success,
    required TResult Function(LoadableError<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadableInitial<T> value)? initial,
    TResult? Function(LoadableLoading<T> value)? loading,
    TResult? Function(LoadableSuccess<T> value)? success,
    TResult? Function(LoadableError<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadableInitial<T> value)? initial,
    TResult Function(LoadableLoading<T> value)? loading,
    TResult Function(LoadableSuccess<T> value)? success,
    TResult Function(LoadableError<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class LoadableError<T> implements Loadable<T> {
  const factory LoadableError(final String message, final AppException error) =
      _$LoadableErrorImpl<T>;

  String get message;
  AppException get error;

  /// Create a copy of Loadable
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadableErrorImplCopyWith<T, _$LoadableErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
