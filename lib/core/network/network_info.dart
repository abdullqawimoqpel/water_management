import 'package:connectivity_plus/connectivity_plus.dart';

/// Abstract interface for checking network connectivity.
///
/// Used by repositories to determine whether to fetch from
/// remote or local data sources.
abstract class NetworkInfo {
  /// Returns `true` if the device has an active internet connection.
  Future<bool> get isConnected;

  /// Stream of connectivity changes.
  Stream<bool> get onConnectivityChanged;
}

/// Implementation of [NetworkInfo] using the connectivity_plus package.
class NetworkInfoImpl implements NetworkInfo {
  final Connectivity _connectivity;

  NetworkInfoImpl(this._connectivity);

  @override
  Future<bool> get isConnected async {
    final results = await _connectivity.checkConnectivity();
    return _hasConnection(results);
  }

  @override
  Stream<bool> get onConnectivityChanged {
    return _connectivity.onConnectivityChanged.map(_hasConnection);
  }

  bool _hasConnection(List<ConnectivityResult> results) {
    return results.any(
      (result) =>
          result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi ||
          result == ConnectivityResult.ethernet,
    );
  }
}
