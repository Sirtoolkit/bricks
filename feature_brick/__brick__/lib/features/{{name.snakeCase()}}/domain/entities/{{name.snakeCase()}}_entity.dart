import 'package:freezed_annotation/freezed_annotation.dart';

part '{{name.snakeCase()}}_entity.g.dart';
part '{{name.snakeCase()}}_entity.freezed.dart';

@freezed
abstract class {{name.pascalCase()}}Entity with _${{name.pascalCase()}}Entity {
  const factory {{name.pascalCase()}}Entity({
    @Default(0) int id,
    @Default('') String name,
  }) = _{{name.pascalCase()}}Entity;
}
