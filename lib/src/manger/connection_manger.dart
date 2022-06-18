import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:expense_tracker_app/src/data/exceptions/connection_exception.dart';

class ConnectionManger {
  final _connectivity = Connectivity();

  Future<void> checkConnection() async {
    final result = await _connectivity.checkConnectivity();
    if (result == ConnectivityResult.none) {
      throw ConnectionException();
    }
  }
}
