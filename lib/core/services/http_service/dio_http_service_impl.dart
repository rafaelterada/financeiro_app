import 'dart:collection';

import 'package:dio/dio.dart';

import 'http_service.dart';
import 'response_http_service.dart';

class DioHttpServiceImpl implements HttpService {
  Dio init(String baseUrl,
      {Map<String, String>? headers, int? timeoutMilliseconds}) {
    headers ??= HashMap<String, String>(
        equals: (a, b) => a.toUpperCase() == b.toUpperCase(),
        hashCode: (a) => a.toUpperCase().hashCode);

    if (!headers.containsKey("content-type")) {
      headers.addAll({'content-type': 'application/json'});
    }

    return Dio(BaseOptions(
        baseUrl: baseUrl,
        headers: headers,
        connectTimeout: timeoutMilliseconds));
  }

  @override
  Future<ResponseHttpService> get(
    String baseUrl,
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    int? timeoutMilliseconds,
  }) async {
    try {
      var dio = init(
        baseUrl,
        headers: headers,
        timeoutMilliseconds: timeoutMilliseconds,
      );
      var result = await dio.get(path, queryParameters: queryParameters);

      return ResponseHttpService(
          statusCode: result.statusCode,
          message: result.statusMessage,
          data: result.data);
    } on DioError catch (e) {
      if (e.response != null) {
        return ResponseHttpService(
            statusCode: e.response!.statusCode,
            message: e.response!.statusMessage,
            data: e.response!.data);
      } else {
        return ResponseHttpService(statusCode: 599, message: e.error.message);
      }
    }
  }

  @override
  Future<ResponseHttpService> post(
    String baseUrl,
    String path, {
    dynamic body,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    int? timeoutMilliseconds,
  }) async {
    try {
      var dio = init(
        baseUrl,
        headers: headers,
        timeoutMilliseconds: timeoutMilliseconds,
      );
      var result =
          await dio.post(path, data: body, queryParameters: queryParameters);

      return ResponseHttpService(
          statusCode: result.statusCode,
          message: result.statusMessage,
          data: result.data);
    } on DioError catch (e) {
      if (e.response != null) {
        return ResponseHttpService(
            statusCode: e.response!.statusCode,
            message: e.response!.statusMessage,
            data: e.response!.data);
      } else {
        return ResponseHttpService(statusCode: 599, message: e.error.message);
      }
    }
  }

  @override
  Future<ResponseHttpService> put(
    String baseUrl,
    String path, {
    dynamic body,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    int? timeoutMilliseconds,
  }) async {
    try {
      var dio = init(
        baseUrl,
        headers: headers,
        timeoutMilliseconds: timeoutMilliseconds,
      );
      var result =
          await dio.put(path, data: body, queryParameters: queryParameters);

      return ResponseHttpService(
          statusCode: result.statusCode,
          message: result.statusMessage,
          data: result.data);
    } on DioError catch (e) {
      if (e.response != null) {
        return ResponseHttpService(
            statusCode: e.response!.statusCode,
            message: e.response!.statusMessage,
            data: e.response!.data);
      } else {
        return ResponseHttpService(statusCode: 599, message: e.error.message);
      }
    }
  }

  @override
  Future<ResponseHttpService> delete(
    String baseUrl,
    String path, {
    dynamic body,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    int? timeoutMilliseconds,
  }) async {
    try {
      var dio = init(
        baseUrl,
        headers: headers,
        timeoutMilliseconds: timeoutMilliseconds,
      );
      var result =
          await dio.delete(path, data: body, queryParameters: queryParameters);

      return ResponseHttpService(
          statusCode: result.statusCode,
          message: result.statusMessage,
          data: result.data);
    } on DioError catch (e) {
      if (e.response != null) {
        return ResponseHttpService(
            statusCode: e.response!.statusCode,
            message: e.response!.statusMessage,
            data: e.response!.data);
      } else {
        return ResponseHttpService(statusCode: 599, message: e.error.message);
      }
    }
  }
}
