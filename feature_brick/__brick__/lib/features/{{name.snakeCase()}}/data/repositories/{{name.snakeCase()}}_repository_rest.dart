import 'package:injectable/injectable.dart';

import 'package:{{project_name}}/core/core.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/data.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/domain.dart';

@LazySingleton(as: {{name.pascalCase()}}Repository)
class {{name.pascalCase()}}RepositoryRest implements {{name.pascalCase()}}Repository {
  final {{name.pascalCase()}}RestDataSource restDataSource;
  final {{name.pascalCase()}}LocalDataSource localDataSource;
  final ConnectivityService connectivityService;

  {{name.pascalCase()}}RepositoryRest({
    required this.restDataSource,
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

    final result = await restDataSource.findAll();

    return result.when(
      success: (data) async {
        await localDataSource.cache{{name.pascalCase()}}(data);
        return Success(data.map((e) => e.toEntity()).toList());
      },
      failure: (failure) => Error(failure),
    );
  }
}
