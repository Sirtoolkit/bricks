import 'package:injectable/injectable.dart';

import 'package:{{project_name}}/core/core.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/datasources/graphql/{{name.snakeCase()}}_graphql_data_source.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/datasources/{{name.snakeCase()}}_local_data_source.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/models/{{name.snakeCase()}}_model.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}_entity.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/repositories/{{name.snakeCase()}}_repository.dart';

@LazySingleton(as: {{name.pascalCase()}}Repository)
class {{name.pascalCase()}}RepositoryGraphQL implements {{name.pascalCase()}}Repository {
  final {{name.pascalCase()}}GraphQLDataSource graphQLDataSource;
  final {{name.pascalCase()}}LocalDataSource localDataSource;
  final ConnectivityService connectivityService;

  {{name.pascalCase()}}RepositoryGraphQL({
    required this.graphQLDataSource,
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

    final result = await graphQLDataSource.findAll();

    return result.when(
      success: (data) async {
        await localDataSource.cache{{name.pascalCase()}}(data);
        return Success(data.map((e) => e.toEntity()).toList());
      },
      failure: (failure) => Error(failure),
    );
  }
  
  @override
  Future<Result<{{name.pascalCase()}}Entity>> findById(int id) async {
    final isConnected = await connectivityService.isConnected();
    
    if (!isConnected) {
      return Error(NetworkException('No internet connection'));
    }
    
    final result = await graphQLDataSource.findById(id);
    
    return result.when(
      success: (data) => Success(data.toEntity()),
      failure: (failure) => Error(failure),
    );
  }
  
  @override
  Future<Result<{{name.pascalCase()}}Entity>> create({{name.pascalCase()}}Entity entity) async {
    final isConnected = await connectivityService.isConnected();
    
    if (!isConnected) {
      return Error(NetworkException('No internet connection'));
    }
    
    final model = {{name.pascalCase()}}Model(
      id: entity.id,
      name: entity.name,
      // Add other fields as needed
    );
    
    final result = await graphQLDataSource.create(model);
    
    return result.when(
      success: (data) async {
        // Update local cache with latest data
        final allData = await localDataSource.getCached{{name.pascalCase()}}();
        allData.add(data);
        await localDataSource.cache{{name.pascalCase()}}(allData);
        
        return Success(data.toEntity());
      },
      failure: (failure) => Error(failure),
    );
  }
  
  @override
  Future<Result<{{name.pascalCase()}}Entity>> update({{name.pascalCase()}}Entity entity) async {
    final isConnected = await connectivityService.isConnected();
    
    if (!isConnected) {
      return Error(NetworkException('No internet connection'));
    }
    
    final model = {{name.pascalCase()}}Model(
      id: entity.id,
      name: entity.name,
      // Add other fields as needed
    );
    
    final result = await graphQLDataSource.update(model);
    
    return result.when(
      success: (data) async {
        // Update local cache with latest data
        final allData = await localDataSource.getCached{{name.pascalCase()}}();
        final index = allData.indexWhere((item) => item.id == data.id);
        
        if (index != -1) {
          allData[index] = data;
        } else {
          allData.add(data);
        }
        
        await localDataSource.cache{{name.pascalCase()}}(allData);
        
        return Success(data.toEntity());
      },
      failure: (failure) => Error(failure),
    );
  }
  
  @override
  Future<Result<bool>> delete(int id) async {
    final isConnected = await connectivityService.isConnected();
    
    if (!isConnected) {
      return Error(NetworkException('No internet connection'));
    }
    
    final result = await graphQLDataSource.delete(id);
    
    return result.when(
      success: (success) async {
        if (success) {
          // Update local cache to remove the deleted item
          final allData = await localDataSource.getCached{{name.pascalCase()}}();
          allData.removeWhere((item) => item.id == id);
          await localDataSource.cache{{name.pascalCase()}}(allData);
        }
        
        return Success(success);
      },
      failure: (failure) => Error(failure),
    );
  }
}