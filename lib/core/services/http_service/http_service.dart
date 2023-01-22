import 'response_http_service.dart';

abstract class HttpService {
  Future<ResponseHttpService> get(
    String baseUrl,
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    int? timeoutMilliseconds,
  });

  Future<ResponseHttpService> post(
    String baseUrl,
    String path, {
    dynamic body,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    int? timeoutMilliseconds,
  });

  Future<ResponseHttpService> put(
    String baseUrl,
    String path, {
    dynamic body,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    int? timeoutMilliseconds,
  });

  Future<ResponseHttpService> delete(
    String baseUrl,
    String path, {
    dynamic body,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    int? timeoutMilliseconds,
  });
}
