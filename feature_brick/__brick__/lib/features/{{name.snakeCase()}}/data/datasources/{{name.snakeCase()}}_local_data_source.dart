import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/data.dart';

abstract class {{name.pascalCase()}}LocalDataSource {
  Future<void> cache{{name.pascalCase()}}(List<{{name.pascalCase()}}Model> {{name.snakeCase()}});
  Future<List<{{name.pascalCase()}}Model>> getCached{{name.pascalCase()}}();
}

@LazySingleton(as: {{name.pascalCase()}}LocalDataSource)
class {{name.pascalCase()}}LocalDataSourceImpl implements {{name.pascalCase()}}LocalDataSource {
  static const _boxName = '{{name.snakeCase()}}Box';

  @override
  Future<void> cache{{name.pascalCase()}}(List<{{name.pascalCase()}}Model> {{name.snakeCase()}}) async {
    final box = await Hive.openBox(_boxName);
    final data = {{name.snakeCase()}}.map((e) => e.toJson()).toList();
    await box.put('{{name.snakeCase()}}', data);
  }

  @override
  Future<List<{{name.pascalCase()}}Model>> getCached{{name.pascalCase()}}() async {
    final box = await Hive.openBox(_boxName);
    final rawList = box.get('{{name.snakeCase()}}', defaultValue: []) as List<dynamic>;
    return rawList.map((e) => {{name.pascalCase()}}Model.fromJson(Map<String, dynamic>.from(e))).toList();
  }
}
