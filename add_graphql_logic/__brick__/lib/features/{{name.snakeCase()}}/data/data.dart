export 'models/{{name.snakeCase()}}_model.dart';

export 'datasources/{{name.snakeCase()}}_rest_data_source.dart';
export 'datasources/{{name.snakeCase()}}_graphql_data_source.dart';
export 'datasources/{{name.snakeCase()}}_local_data_source.dart';

export 'repositories/{{name.snakeCase()}}_repository_rest.dart';
export 'repositories/{{name.snakeCase()}}_repository_graphql.dart';

export 'graphql/{{name.snakeCase()}}_queries.dart';
export 'graphql/{{name.snakeCase()}}_mutations.dart';
