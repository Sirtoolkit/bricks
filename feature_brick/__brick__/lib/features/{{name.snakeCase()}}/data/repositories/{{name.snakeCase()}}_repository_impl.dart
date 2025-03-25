import 'package:injectable/injectable.dart';
import 'package:{{project_name}}/core/utils/result.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/datasources/{{name.snakeCase()}}_remote_data_source.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/models/{{name.snakeCase()}}_model.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}_entity.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/repositories/{{name.snakeCase()}}_repository.dart';

@LazySingleton(as: {{name.pascalCase()}}Repository)
class {{name.pascalCase()}}RepositoryImpl implements {{name.pascalCase()}}Repository {
  final {{name.pascalCase()}}RemoteDataSource remoteDataSource;

  {{name.pascalCase()}}RepositoryImpl({required this.remoteDataSource});

  @override
  Future<Result<List<{{name.pascalCase()}}Entity>>> findAll() async {
    final result = await remoteDataSource.findAll();
    return result.when(
      success: (data) => Success(data.map((e) => e.toEntity()).toList()),
      failure: (failure) => Error(failure),
    );
  }
}
