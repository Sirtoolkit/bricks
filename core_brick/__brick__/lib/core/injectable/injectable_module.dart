import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import '../services/dio_service.dart';

@module
abstract class InjectableModule {
  @singleton
  Dio dio(DioService dioService) => dioService.client;
}
