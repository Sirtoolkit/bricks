import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:{{project_name}}/core/error/app_exception.dart';
import 'package:{{project_name}}/core/usecases/use_case.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/domain.dart';
import 'package:{{project_name}}/core/state/loadable.dart';

@lazySingleton
class {{name.pascalCase()}}Cubit extends Cubit<Loadable<List<{{name.pascalCase()}}Entity>>> {
  final FindAll{{name.pascalCase()}} findAll{{name.pascalCase()}};

  {{name.pascalCase()}}Cubit({required this.findAll{{name.pascalCase()}}}) : super(Loadable.initial());

  Future<void> init() async {
    if (state is LoadableSuccess) return;
    await findAll();
  }

  Future<void> findAll() async {
    emit(LoadableLoading());
    final result = await findAll{{name.pascalCase()}}(NoParams());
    result.when(
      success: (data) => emit(Loadable.success(data)),
      failure: (error) => emit(Loadable.error(error.message, error)),
    );
  }
}
