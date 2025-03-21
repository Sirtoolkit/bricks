import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}_entity.dart';
import 'package:{{project_name}}/core/utils/result.dart';

abstract class {{name.pascalCase()}}Repository {
  Future<Result<List<{{name.pascalCase()}}Entity>>> getAll();
  Future<Result<{{name.pascalCase()}}Entity>> getById(String id);
  Future<Result<{{name.pascalCase()}}Entity>> create({{name.pascalCase()}}Entity entity);
  Future<Result<{{name.pascalCase()}}Entity>> update({{name.pascalCase()}}Entity entity);
  Future<Result<bool>> delete(String id);
}