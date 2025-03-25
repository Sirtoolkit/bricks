import 'package:injectable/injectable.dart';

abstract class ConnectivityService {
  Future<bool> isConnected();
}

// Una implementación básica que podrías usar o adaptar
@LazySingleton(as: ConnectivityService)
class ConnectivityServiceImpl implements ConnectivityService {
  @override
  Future<bool> isConnected() async {
    // Implementación dependiendo de la librería que uses
    // Por ejemplo, usando package:connectivity_plus:
    // final result = await Connectivity().checkConnectivity();
    // return result.contains(ConnectivityResult.wifi) ||
    //     result.contains(ConnectivityResult.mobile);
    return true;
  }
}
