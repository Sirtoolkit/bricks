import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/models/{{name.snakeCase()}}_model.dart';
import 'package:{{project_name}}/core/error/app_exception.dart';
import 'package:{{project_name}}/core/utils/result.dart';

abstract class {{name.pascalCase()}}RemoteDataSource {
  Future<Result<List<{{name.pascalCase()}}Model>>> findAll();
}

@LazySingleton(as: {{name.pascalCase()}}RemoteDataSource)
class {{name.pascalCase()}}RemoteDataSourceImpl implements {{name.pascalCase()}}RemoteDataSource {
   final http.Client client;

  {{name.pascalCase()}}RemoteDataSourceImpl({required this.client});

  @override
  Future<Result<List<{{name.pascalCase()}}Model>>> findAll() async {
    try {
      final response = await client.get(
        Uri.parse('/{{name.snakeCase()}}'),
        headers: {'Content-Type': 'application/json'},
    );

      if (response.statusCode != 200) {
        return Error(
          ServerException(
            'Error: Received invalid status code ${response.statusCode}',
          ),
        );
      }

      final json = response.data as Map<String, dynamic>;

      final dataList = json['data'] as List;
      final data = dataList.map((e) => {{name.pascalCase()}}Model.fromJson(e)).toList();
      return Success(data);
    } catch (e) {
      return Error(ServerException('Dio Error: ${e.message}'));
    }
  }
}
