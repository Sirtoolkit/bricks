import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:salonista_app/injectable/service_locator.config.dart';

final locator = GetIt.I;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies() async => locator.init();
