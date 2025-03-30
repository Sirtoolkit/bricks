import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:{{project_name}}/core/core.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/data.dart';

final dataListMock = [
  {"id": 1, "name": "delectus aut autem"},
  {"id": 2, "name": "quis ut nam facilis et officia qui"},
  {"id": 3, "name": "fugiat veniam minus"},
];

abstract class {{name.pascalCase()}}RestDataSource {
  Future<Result<List<{{name.pascalCase()}}Model>>> findAll();
}

@LazySingleton(as: {{name.pascalCase()}}RestDataSource)
class {{name.pascalCase()}}RemoteDataSourceImpl implements {{name.pascalCase()}}RestDataSource {
  final Dio dio;

  {{name.pascalCase()}}RemoteDataSourceImpl({required this.dio});

  @override
  Future<Result<List<{{name.pascalCase()}}Model>>> findAll() async {
    try {
      // Uncomment the following lines to use the actual API
      // final response = await dio.get('/{{name.snakeCase()}}');
      // if (response.statusCode != 200) {
      //   return Error(ServerException('Error: Received invalid status code ${response.statusCode}'));
      // }
      // final json = response.data as Map<String, dynamic>;
      // final dataList = json['data'] as List;
      // final data = dataList.map((e) => {{name.pascalCase()}}Model.fromJson(e)).toList();

      // Mocking the response for demonstration purposes
      final data = dataListMock.map((e) => {{name.pascalCase()}}Model.fromJson(e)).toList();
      // Simulating a delay to mimic network call
      await Future.delayed(const Duration(seconds: 1));
      
      return Success(data);
    } catch (e) {
      return Error(ServerException('Dio Error: ${e.toString()}'));
    }
  }
}
