import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:{{project_name}}/core/error/app_exception.dart';
import 'package:{{project_name}}/core/usecases/use_case.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/domain.dart';

part '{{name.snakeCase()}}_state.dart';

@lazySingleton
class {{name.pascalCase()}}Cubit extends Cubit<{{name.pascalCase()}}State> {
  final FindAll{{name.pascalCase()}} findAll{{name.pascalCase()}};

  {{name.pascalCase()}}Cubit({required this.findAll{{name.pascalCase()}}}) : super({{name.pascalCase()}}StateInitial());

  Future<void> init() async {
    if (state is {{name.pascalCase()}}StateLoaded) return;
    await findAll();
  }

  Future<void> findAll() async {
    final result = await findAll{{name.pascalCase()}}(NoParams());
    result.when(
      success: (data) => emit({{name.pascalCase()}}StateLoaded(data)),
      failure: (error) => emit({{name.pascalCase()}}StateError(_mapFailureToMessage(error))),
    );
  }
}

String _mapFailureToMessage(AppException failure) {
  if (failure is ServerException) return 'Server Error: ${failure.message}';
  return 'Unknown error occurred.';
}