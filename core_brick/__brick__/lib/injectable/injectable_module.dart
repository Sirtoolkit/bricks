import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import '../core/services/dio_service.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  DioService get dioService => DioService();

  @lazySingleton
  Dio get dio => dioService.client;
}
