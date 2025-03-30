import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';

import 'package:{{project_name}}/core/core.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/data.dart';

abstract class {{name.pascalCase()}}GraphQLDataSource {
  Future<Result<List<{{name.pascalCase()}}Model>>> findAll();
  Future<Result<{{name.pascalCase()}}Model>> findById(int id);
  Future<Result<{{name.pascalCase()}}Model>> create({{name.pascalCase()}}Model model);
  Future<Result<{{name.pascalCase()}}Model>> update({{name.pascalCase()}}Model model);
  Future<Result<bool>> delete(int id);
}

@LazySingleton(as: {{name.pascalCase()}}GraphQLDataSource)
class {{name.pascalCase()}}GraphQLDataSourceImpl implements {{name.pascalCase()}}GraphQLDataSource {
  final GraphQLClient client;

  {{name.pascalCase()}}GraphQLDataSourceImpl({required this.client});

  @override
  Future<Result<List<{{name.pascalCase()}}Model>>> findAll() async {
    try {
      final result = await client.query(
        QueryOptions(
          document: gql({{name.pascalCase()}}Queries.findAll),
          fetchPolicy: FetchPolicy.networkOnly,
        ),
      );

      if (result.hasException) {
        return Error(ServerException(result.exception.toString()));
      }

      final dataList = result.data?['{{name.camelCase()}}s'] as List<dynamic>? ?? [];
      final models = dataList
          .map((item) => {{name.pascalCase()}}Model.fromJson(item as Map<String, dynamic>))
          .toList();

      return Success(models);
    } catch (e) {
      return Error(ServerException('GraphQL Error: ${e.toString()}'));
    }
  }

  @override
  Future<Result<{{name.pascalCase()}}Model>> findById(int id) async {
    try {
      final result = await client.query(
        QueryOptions(
          document: gql({{name.pascalCase()}}Queries.findById),
          variables: {'id': id},
          fetchPolicy: FetchPolicy.networkOnly,
        ),
      );

      if (result.hasException) {
        return Error(ServerException(result.exception.toString()));
      }

      final data = result.data?['{{name.camelCase()}}'] as Map<String, dynamic>?;
      
      if (data == null) {
        return Error(NotFoundException('{{name.pascalCase()}} with id $id not found'));
      }

      return Success({{name.pascalCase()}}Model.fromJson(data));
    } catch (e) {
      return Error(ServerException('GraphQL Error: ${e.toString()}'));
    }
  }

  @override
  Future<Result<{{name.pascalCase()}}Model>> create({{name.pascalCase()}}Model model) async {
    try {
      final result = await client.mutate(
        MutationOptions(
          document: gql({{name.pascalCase()}}Mutations.create),
          variables: {
            'input': model.toJson(),
          },
        ),
      );

      if (result.hasException) {
        return Error(ServerException(result.exception.toString()));
      }

      final data = result.data?['create{{name.pascalCase()}}'] as Map<String, dynamic>?;
      
      if (data == null) {
        return Error(ServerException('Failed to create {{name.camelCase()}}'));
      }
      
      return Success({{name.pascalCase()}}Model.fromJson(data));
    } catch (e) {
      return Error(ServerException('GraphQL Error: ${e.toString()}'));
    }
  }

  @override
  Future<Result<{{name.pascalCase()}}Model>> update({{name.pascalCase()}}Model model) async {
    try {
      final result = await client.mutate(
        MutationOptions(
          document: gql({{name.pascalCase()}}Mutations.update),
          variables: {
            'id': model.id,
            'input': model.toJson(),
          },
        ),
      );

      if (result.hasException) {
        return Error(ServerException(result.exception.toString()));
      }

      final data = result.data?['update{{name.pascalCase()}}'] as Map<String, dynamic>?;
      
      if (data == null) {
        return Error(ServerException('Failed to update {{name.camelCase()}}'));
      }
      
      return Success({{name.pascalCase()}}Model.fromJson(data));
    } catch (e) {
      return Error(ServerException('GraphQL Error: ${e.toString()}'));
    }
  }

  @override
  Future<Result<bool>> delete(int id) async {
    try {
      final result = await client.mutate(
        MutationOptions(
          document: gql({{name.pascalCase()}}Mutations.delete),
          variables: {'id': id},
        ),
      );

      if (result.hasException) {
        return Error(ServerException(result.exception.toString()));
      }

      final success = result.data?['delete{{name.pascalCase()}}'] as bool? ?? false;
      return Success(success);
    } catch (e) {
      return Error(ServerException('GraphQL Error: ${e.toString()}'));
    }
  }
}