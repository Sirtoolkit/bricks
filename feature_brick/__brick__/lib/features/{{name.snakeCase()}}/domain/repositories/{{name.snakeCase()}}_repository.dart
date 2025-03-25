import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}_entity.dart';
import 'package:{{project_name}}/core/utils/result.dart';

abstract class {{name.pascalCase()}}Repository {
  Future<Result<List<{{name.pascalCase()}}Entity>>> findAll();
}