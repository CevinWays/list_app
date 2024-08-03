import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:list_app/src/app/network/internet_checker.dart';

///
/// [NetworkInfo] is used for network connectivity utilities
///
abstract class NetworkInfo {
  Future<bool> isConnected();
  Future<ConnectivityResult> get connectivityResult;
  Stream<ConnectivityResult> get onConnectivityChanged;
}

///
/// [isConnected] to check your application is connected to WiFi/mobile
/// [connectivityResult] to get specific information about connectivity
/// [onConnectivityChanged] to listen connectivity state changed
class NetworkInfoImpl implements NetworkInfo {
  late final Connectivity connectivity;
  late final InternetChecker internetChecker;

  NetworkInfoImpl() {
    connectivity = Connectivity();
    internetChecker = InternetChecker();
  }

  @override
  Future<bool> isConnected() async {
    final result = await connectivityResult;
    final hasConnection = await internetChecker.hasConnection();
    if (result != ConnectivityResult.none && hasConnection) {
      return true;
    }
    return false;
  }
  
  @override
  Future<ConnectivityResult> get connectivityResult => throw UnimplementedError();
  
  @override
  Stream<ConnectivityResult> get onConnectivityChanged => throw UnimplementedError();
}
