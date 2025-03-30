import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:{{project_name}}/core/core.dart';
import 'package:{{project_name}}/shared/shared.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/domain.dart';

@lazySingleton
class {{name.pascalCase()}}Cubit extends Cubit<DataState<List<{{name.pascalCase()}}Entity>>> {
  final FindAll{{name.pascalCase()}} findAll{{name.pascalCase()}};

  {{name.pascalCase()}}Cubit({required this.findAll{{name.pascalCase()}}}) : super(DataState.initial());

  Future<void> init() async {
    if (state is DataStateSuccess) return;
    await findAll();
  }

  Future<void> findAll() async {
    emit(DataStateLoading());
    final result = await findAll{{name.pascalCase()}}(NoParams());
    result.when(
      success: (data) => emit(DataState.success(data)),
      failure: (error) => emit(DataState.error(error.message, error)),
    );
  }
}
