import 'package:{{project_name}}/core/core.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}_entity.dart';

abstract class {{name.pascalCase()}}Repository {
  Future<Result<List<{{name.pascalCase()}}Entity>>> findAll();
}