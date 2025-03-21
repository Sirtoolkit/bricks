// part file
part of '{{name.snakeCase()}}_cubit.dart';

abstract class {{name.pascalCase()}}State {
  const {{name.pascalCase()}}State();
}

class {{name.pascalCase()}}Initial extends {{name.pascalCase()}}State {}

class {{name.pascalCase()}}Loading extends {{name.pascalCase()}}State {}

class {{name.pascalCase()}}Loaded extends {{name.pascalCase()}}State {
  final List<{{name.pascalCase()}}Entity> {{name.camelCase()}}s;
  
  const {{name.pascalCase()}}Loaded(this.{{name.camelCase()}}s);
}

class {{name.pascalCase()}}Error extends {{name.pascalCase()}}State {
  final String message;
  
  const {{name.pascalCase()}}Error(this.message);
}