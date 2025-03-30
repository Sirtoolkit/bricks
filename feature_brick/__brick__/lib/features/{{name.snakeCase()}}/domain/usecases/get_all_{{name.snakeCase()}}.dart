import 'package:injectable/injectable.dart';

import 'package:{{project_name}}/core/core.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}_entity.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/repositories/{{name.snakeCase()}}_repository.dart';

@injectable
class FindAll{{name.pascalCase()}} implements UseCase<List<{{name.pascalCase()}}Entity>, NoParams> {
  final {{name.pascalCase()}}Repository repository;

  FindAll{{name.pascalCase()}}(this.repository);

  @override
  Future<Result<List<{{name.pascalCase()}}Entity>>> call(NoParams params) {
    return repository.findAll();
  }
}
