import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}_entity.dart';

part '{{name.snakeCase()}}_model.freezed.dart';
part '{{name.snakeCase()}}_model.g.dart';

@freezed
abstract class {{name.pascalCase()}}Model with _${{name.pascalCase()}}Model {
  const factory {{name.pascalCase()}}Model({
    required int id,
    required String name,
  }) = _{{name.pascalCase()}}Model;

  factory {{name.pascalCase()}}Model.fromJson(Map<String, dynamic> json) => _${{name.pascalCase()}}ModelFromJson(json);
}

extension {{name.pascalCase()}}ModelX on {{name.pascalCase()}}Model {
  {{name.pascalCase()}}Entity toEntity() => {{name.pascalCase()}}Entity(id: id, name: name);
}
