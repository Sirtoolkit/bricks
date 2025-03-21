import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}_entity.dart';

class {{name.pascalCase()}}Model {
  final String id;
  final String name;
  // Añade otros campos según necesites
  
  {{name.pascalCase()}}Model({
    required this.id,
    required this.name,
  });
  
  factory {{name.pascalCase()}}Model.fromJson(Map<String, dynamic> json) {
    return {{name.pascalCase()}}Model(
      id: json['id'].toString(),
      name: json['name'] as String,
    );
  }
  
  factory {{name.pascalCase()}}Model.fromEntity({{name.pascalCase()}}Entity entity) {
    return {{name.pascalCase()}}Model(
      id: entity.id,
      name: entity.name,
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
  
  {{name.pascalCase()}}Entity toEntity() {
    return {{name.pascalCase()}}Entity(
      id: id,
      name: name,
    );
  }
}