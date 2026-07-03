abstract class RestClient {
  Future<dynamic> get(String path, {Map<String, dynamic>? queryParameters});
  Future<dynamic> post(String path, {dynamic data, Map<String, dynamic>? queryParameters});
  Future<dynamic> put(String path, {dynamic data, Map<String, dynamic>? queryParameters});
  Future<dynamic> delete(String path, {dynamic data, Map<String, dynamic>? queryParameters});
}

abstract class ApiInterceptor {
  void onRequest(dynamic options, dynamic handler);
  void onResponse(dynamic response, dynamic handler);
  void onError(dynamic error, dynamic handler);
}

class RetryPolicy {
  final int maxRetries;
  final Duration retryDelay;

  const RetryPolicy({this.maxRetries = 3, this.retryDelay = const Duration(seconds: 2)});
}
