import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}_entity.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/usecases/get_all_{{name.snakeCase()}}.dart';
import 'package:{{project_name}}/core/usecases/usecase.dart';

part '{{name.snakeCase()}}_state.dart';

class {{name.pascalCase()}}Cubit extends Cubit<{{name.pascalCase()}}State> {
  final GetAll{{name.pascalCase()}} getAllUseCase;
  
  {{name.pascalCase()}}Cubit({
    required this.getAllUseCase,
  }) : super({{name.pascalCase()}}Initial());

  Future<void> fetchAll{{name.pascalCase()}}() async {
    emit({{name.pascalCase()}}Loading());
    
    final result = await getAllUseCase(const NoParams());
    
    result.when(
      success: (data) => emit({{name.pascalCase()}}Loaded(data)),
      failure: (error) => emit({{name.pascalCase()}}Error(error.message)),
    );
  }
}