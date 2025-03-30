import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../services/dio_service.dart';
import '../services/graphql_service.dart';

@module
abstract class InjectableModule {
  @singleton
  Dio dio(DioService dioService) => dioService.client;

  @singleton
  GraphQLClient graphQLClient(GraphQLService graphQLService) =>
      graphQLService.client;
}
