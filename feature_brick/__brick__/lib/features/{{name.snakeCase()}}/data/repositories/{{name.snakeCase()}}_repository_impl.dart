import 'package:{{project_name}}/core/core.dart';
import 'package:injectable/injectable.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/datasources/{{name.snakeCase()}}_remote_data_source.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/datasources/{{name.snakeCase()}}_local_data_source.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/models/{{name.snakeCase()}}_model.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}_entity.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/repositories/{{name.snakeCase()}}_repository.dart';

@LazySingleton(as: {{name.pascalCase()}}Repository)
class {{name.pascalCase()}}RepositoryImpl implements {{name.pascalCase()}}Repository {
  final {{name.pascalCase()}}RemoteDataSource remoteDataSource;
  final {{name.pascalCase()}}LocalDataSource localDataSource;
  final ConnectivityService connectivityService;

  {{name.pascalCase()}}RepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.connectivityService,
  });

  @override
  Future<Result<List<{{name.pascalCase()}}Entity>>> findAll() async {
    final cached = await localDataSource.getCached{{name.pascalCase()}}();
    final isConnected = await connectivityService.isConnected();

    if (cached.isNotEmpty && !isConnected) {
      return Success(cached.map((e) => e.toEntity()).toList());
    }

    final result = await remoteDataSource.findAll();

    return result.when(
      success: (data) async {
        await localDataSource.cache{{name.pascalCase()}}(data);
        return Success(data.map((e) => e.toEntity()).toList());
      },
      failure: (failure) => Error(failure),
    );
  }
}
