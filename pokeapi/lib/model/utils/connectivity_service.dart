
import 'package:connectivity_plus/connectivity_plus.dart';

/// A service to check network connectivity.
class ConnectivityService {
  static final ConnectivityService _instance = ConnectivityService._internal();
  final Connectivity _connectivity = Connectivity();
  
  /// Returns the singleton instance of [ConnectivityService].
  factory ConnectivityService() {
    return _instance;
  }
  
  ConnectivityService._internal();
  
  /// Checks if the device is currently connected to the internet.
  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      return result != ConnectivityResult.none;
    } catch (e) {
      print('Connectivity check error: $e');
      return true; // Assume connected if we can't check
    }
  }
  
  /// Stream of connectivity changes.
  Stream<ConnectivityResult> get connectivityStream => _connectivity.onConnectivityChanged;
}
