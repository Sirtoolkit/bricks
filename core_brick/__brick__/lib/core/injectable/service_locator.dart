import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';
import 'service_locator.config.dart';

final locator = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void configureDependencies() => init(locator);
