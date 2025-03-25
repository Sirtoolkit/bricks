import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/models/{{name.snakeCase()}}_model.dart';
import 'package:{{project_name}}/core/error/app_exception.dart';
import 'package:{{project_name}}/core/utils/result.dart';

final dataListMock = [
  {"id": 1, "name": "delectus aut autem"},
  {"id": 2, "name": "quis ut nam facilis et officia qui"},
  {"id": 3, "name": "fugiat veniam minus"},
];

abstract class {{name.pascalCase()}}RemoteDataSource {
  Future<Result<List<{{name.pascalCase()}}Model>>> findAll();
}

@LazySingleton(as: {{name.pascalCase()}}RemoteDataSource)
class {{name.pascalCase()}}RemoteDataSourceImpl implements {{name.pascalCase()}}RemoteDataSource {
  // Uncommented the Dio API call
  // final Dio dio;

  {{name.pascalCase()}}RemoteDataSourceImpl({required this.client});

  @override
  Future<Result<List<{{name.pascalCase()}}Model>>> findAll() async {
    try {
      // Updated the endpoint to use dynamic name based on the feature
      // final response = await dio.get('/categories');

      // Uncommented status code validation
      // if (response.statusCode != 200) {
      //   return Error(ServerException('Error: Received invalid status code ${response.statusCode}'));
      // }

      // Uncommented JSON response handling
      // final json = response.data as Map<String, dynamic>;

       // Commented out the mock delay since we're using real API
       await Future.delayed(const Duration(seconds: 3));

      // Updated to use actual API response data instead of mock data
      // final dataList = json['data'] as List;
      final data = dataListMock.map((e) => {{name.pascalCase()}}Model.fromJson(e)).toList();
      return Success(data);
    } catch (e) {
      return Error(ServerException('Dio Error: ${e.toString()}'));
    }
  }
}
