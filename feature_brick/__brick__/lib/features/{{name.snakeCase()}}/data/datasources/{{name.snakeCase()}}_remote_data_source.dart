import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/models/{{name.snakeCase()}}_model.dart';
import 'package:{{project_name}}/core/error/app_exception.dart';

abstract class {{name.pascalCase()}}RemoteDataSource {
  Future<List<{{name.pascalCase()}}Model>> fetchAll();
  Future<{{name.pascalCase()}}Model> fetchById(String id);
  Future<{{name.pascalCase()}}Model> create({{name.pascalCase()}}Model model);
  Future<{{name.pascalCase()}}Model> update({{name.pascalCase()}}Model model);
  Future<void> delete(String id);
}

class {{name.pascalCase()}}RemoteDataSourceImpl implements {{name.pascalCase()}}RemoteDataSource {
  final http.Client client;
  
  {{name.pascalCase()}}RemoteDataSourceImpl({
    required this.client,
  });
  
  @override
  Future<List<{{name.pascalCase()}}Model>> fetchAll() async {
    final response = await client.get(
      Uri.parse('/{{name.snakeCase()}}s'),
      headers: {'Content-Type': 'application/json'},
    );
    
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => {{name.pascalCase()}}Model.fromJson(json)).toList();
    } else {
      throw ServerException('Failed to fetch data: ${response.statusCode}');
    }
  }
  
  @override
  Future<{{name.pascalCase()}}Model> fetchById(String id) async {
    final response = await client.get(
      Uri.parse('$baseUrl/{{name.snakeCase()}}s/$id'),
      headers: {'Content-Type': 'application/json'},
    );
    
    if (response.statusCode == 200) {
      return {{name.pascalCase()}}Model.fromJson(json.decode(response.body));
    } else if (response.statusCode == 404) {
      throw NotFoundException('{{name.pascalCase()}} with id $id not found');
    } else {
      throw ServerException('Failed to fetch data: ${response.statusCode}');
    }
  }
  
  @override
  Future<{{name.pascalCase()}}Model> create({{name.pascalCase()}}Model model) async {
    final response = await client.post(
      Uri.parse('$baseUrl/{{name.snakeCase()}}s'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(model.toJson()),
    );
    
    if (response.statusCode == 201) {
      return {{name.pascalCase()}}Model.fromJson(json.decode(response.body));
    } else {
      throw ServerException('Failed to create: ${response.statusCode}');
    }
  }
  
  @override
  Future<{{name.pascalCase()}}Model> update({{name.pascalCase()}}Model model) async {
    final response = await client.put(
      Uri.parse('$baseUrl/{{name.snakeCase()}}s/${model.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(model.toJson()),
    );
    
    if (response.statusCode == 200) {
      return {{name.pascalCase()}}Model.fromJson(json.decode(response.body));
    } else if (response.statusCode == 404) {
      throw NotFoundException('{{name.pascalCase()}} with id ${model.id} not found');
    } else {
      throw ServerException('Failed to update: ${response.statusCode}');
    }
  }
  
  @override
  Future<void> delete(String id) async {
    final response = await client.delete(
      Uri.parse('$baseUrl/{{name.snakeCase()}}s/$id'),
      headers: {'Content-Type': 'application/json'},
    );
    
    if (response.statusCode != 204 && response.statusCode != 200) {
      if (response.statusCode == 404) {
        throw NotFoundException('{{name.pascalCase()}} with id $id not found');
      } else {
        throw ServerException('Failed to delete: ${response.statusCode}');
      }
    }
  }
}