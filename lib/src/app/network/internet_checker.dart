import 'dart:async';
import 'dart:io';

/// A simple internet checker from https://github.com/RounakTadvi/internet_connection_checker
class InternetChecker {
  List<String> hosts = <String>[
    '1.1.1.1',
    '1.0.0.1',
    '8.8.8.8',
    '8.8.4.4',
    '208.67.222.222',
    '208.67.220.220',
  ];

  int port = 53;

  int timeout = 10;

  /// return `true` if at least there is one reachable host
  Future<bool> hasConnection() async {
    bool result = false;

    for (String host in hosts) {
      result = await isHostReachable(host);
      if (result) {
        break;
      }
    }

    return result;
  }

  Future<bool> isHostReachable(String host) async {
    Socket? sock;
    try {
      sock = await Socket.connect(
        host,
        port,
        timeout: Duration(seconds: timeout),
      )
        ..destroy();
      return true;
    } catch (e) {
      sock?.destroy();
      return false;
    }
  }
}
