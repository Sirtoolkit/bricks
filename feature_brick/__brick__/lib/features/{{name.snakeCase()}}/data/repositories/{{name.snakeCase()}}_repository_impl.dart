import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}_entity.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/repositories/{{name.snakeCase()}}_repository.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/datasources/{{name.snakeCase()}}_remote_data_source.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/models/{{name.snakeCase()}}_model.dart';
import 'package:{{project_name}}/core/utils/result.dart';
import 'package:{{project_name}}/core/error/app_exception.dart';
import 'package:{{project_name}}/core/services/connectivity_service.dart';

class {{name.pascalCase()}}RepositoryImpl implements {{name.pascalCase()}}Repository {
  final {{name.pascalCase()}}RemoteDataSource remoteDataSource;
  final ConnectivityService connectivityService;
  
  {{name.pascalCase()}}RepositoryImpl({
    required this.remoteDataSource,
    required this.connectivityService,
  });

  @override
  Future<Result<List<{{name.pascalCase()}}Entity>>> getAll() async {
    if (await connectivityService.isConnected()) {
      try {
        final models = await remoteDataSource.fetchAll();
        return Success(models.map((model) => model.toEntity()).toList());
      } on ServerException catch (e) {
        return Error(e);
      } on NotFoundException catch (e) {
        return Error(e);
      } catch (e) {
        return Error(AppException('Failed to fetch data: ${e.toString()}'));
      }
    } else {
      return Error(NetworkException());
    }
  }

  @override
  Future<Result<{{name.pascalCase()}}Entity>> getById(String id) async {
    if (await connectivityService.isConnected()) {
      try {
        final model = await remoteDataSource.fetchById(id);
        return Success(model.toEntity());
      } on ServerException catch (e) {
        return Error(e);
      } on NotFoundException catch (e) {
        return Error(e);
      } catch (e) {
        return Error(AppException('Failed to fetch data: ${e.toString()}'));
      }
    } else {
      return Error(NetworkException());
    }
  }

  @override
  Future<Result<{{name.pascalCase()}}Entity>> create({{name.pascalCase()}}Entity entity) async {
    if (await connectivityService.isConnected()) {
      try {
        final model = {{name.pascalCase()}}Model.fromEntity(entity);
        final createdModel = await remoteDataSource.create(model);
        return Success(createdModel.toEntity());
      } on ServerException catch (e) {
        return Error(e);
      } on ValidationException catch (e) {
        return Error(e);
      } catch (e) {
        return Error(AppException('Failed to create: ${e.toString()}'));
      }
    } else {
      return Error(NetworkException());
    }
  }

  @override
  Future<Result<{{name.pascalCase()}}Entity>> update({{name.pascalCase()}}Entity entity) async {
    if (await connectivityService.isConnected()) {
      try {
        final model = {{name.pascalCase()}}Model.fromEntity(entity);
        final updatedModel = await remoteDataSource.update(model);
        return Success(updatedModel.toEntity());
      } on ServerException catch (e) {
        return Error(e);
      } on NotFoundException catch (e) {
        return Error(e);
      } on ValidationException catch (e) {
        return Error(e);
      } catch (e) {
        return Error(AppException('Failed to update: ${e.toString()}'));
      }
    } else {
      return Error(NetworkException());
    }
  }

  @override
  Future<Result<bool>> delete(String id) async {
    if (await connectivityService.isConnected()) {
      try {
        await remoteDataSource.delete(id);
        return Success(true);
      } on ServerException catch (e) {
        return Error(e);
      } on NotFoundException catch (e) {
        return Error(e);
      } catch (e) {
        return Error(AppException('Failed to delete: ${e.toString()}'));
      }
    } else {
      return Error(NetworkException());
    }
  }
}