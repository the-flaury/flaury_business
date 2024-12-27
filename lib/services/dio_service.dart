import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dioServiceProvider = Provider<DioService>(
  (ref) => DioService.instance,
);

class DioService {
  DioService._();

  static final instance = DioService._();

  final Dio _dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 90),
    receiveTimeout: const Duration(seconds: 90),
    sendTimeout: const Duration(seconds: 90),
    responseType: ResponseType.json,
  ));

  //this is created in the case where we need to access the token stored in local storage to attempt to validate user entry into the application
  Options headers(String? sessionToken) =>
      Options(headers: {"Authorization": '$sessionToken'});

  //get operations
  Future<Map<String, dynamic>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
    Map<String, dynamic>? payload,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        path,
        queryParameters: queryParameters,
        data: payload ?? data,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      if (response.statusCode == 200 || response.data['success']) {
        return response.data;
      }

      throw Exception("Something went wrong: ${response.data.toString()}");
    } catch (error) {
      throw Exception("Failed to fetch data: ${error.toString()}");
    }
  }

//post operations
  Future<Map<String, dynamic>> post(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
    Map<String, dynamic>? payload,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        path,
        data: payload ?? data,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      if (response.statusCode == 200 || response.data['success']) {
        return response.data;
      }

      throw Exception("Failed to fetch data: ${response.data.toString()}");
    } catch (error) {
      throw Exception("Failed to fetch data: ${error.toString()}");
    }
  }

  //put operations
  Future<Map<String, dynamic>> put(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
    Map<String, dynamic>? payload,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.put(
        path,
        data: payload ?? data,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      if (response.statusCode == 200 || response.data['success']) {
        return response.data;
      }

      throw Exception("Failed to fetch data: ${response.data.toString()}");
    } catch (error) {
      throw Exception("Failed to fetch data: ${error.toString()}");
    }
  }

  //delete operations
  Future<Map<String, dynamic>> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
    Map<String, dynamic>? payload,
    CancelToken? cancelToken,
  }) async {
    try {
      final Response response = await _dio.delete(
        path,
        data: payload ?? data,
        cancelToken: cancelToken,
      );
      if (response.statusCode == 200 || response.data['success']) {
        return response.data;
      }

      throw Exception("Failed to fetch data: ${response.data.toString()}");
    } catch (error) {
      throw Exception("Failed to fetch data: ${error.toString()}");
    }
  }
}
