part of '{{name.snakeCase()}}_cubit.dart';

abstract class {{name.pascalCase()}}State {
  const {{name.pascalCase()}}State();
}

class {{name.pascalCase()}}StateInitial extends {{name.pascalCase()}}State {}

class {{name.pascalCase()}}StateLoading extends {{name.pascalCase()}}State {}

class {{name.pascalCase()}}StateLoaded extends {{name.pascalCase()}}State {
  final List<{{name.pascalCase()}}Entity> {{name.camelCase()}};
  const {{name.pascalCase()}}StateLoaded(this.{{name.camelCase()}});
}

class {{name.pascalCase()}}StateError extends {{name.pascalCase()}}State {
  final AppException exception;
  final String message;
  const {{name.pascalCase()}}StateError(this.message, this.exception);
}
