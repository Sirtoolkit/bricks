import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}_entity.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/repositories/{{name.snakeCase()}}_repository.dart';
import 'package:{{project_name}}/core/utils/result.dart';
import 'package:{{project_name}}/core/usecases/usecase.dart';

class GetAll{{name.pascalCase()}} implements UseCase<List<{{name.pascalCase()}}Entity>, NoParams> {
  final {{name.pascalCase()}}Repository repository;
  
  GetAll{{name.pascalCase()}}(this.repository);
  
  @override
  Future<Result<List<{{name.pascalCase()}}Entity>>> call(NoParams params) async {
    return repository.getAll();
  }
}