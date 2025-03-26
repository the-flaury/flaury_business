import 'package:dio/dio.dart';
import 'package:flaury_business/util/api_routes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dioServiceProvider = Provider<DioService>(
  (ref) => DioService.instance,
);

class DioService {
  DioService._();

  static final instance = DioService._();

  final Dio _dio = Dio(BaseOptions(
    baseUrl: ApiRoutes.baseUrl,
    connectTimeout: const Duration(seconds: 90),
    receiveTimeout: const Duration(seconds: 90),
    sendTimeout: const Duration(seconds: 90),
    responseType: ResponseType.json,
    headers: {"Content-Type": "application/json; charset=UTF-8"},
  ));

  static Options headers(String? sessionToken) =>
      Options(headers: {"Authorization": '$sessionToken'});

  Future<Map<String, dynamic>> _handleResponse(Response response) async {
    final statusCode = response.statusCode;
    final data = response.data;

    if (statusCode == null) {
      throw CustomException('No status code in response');
    }

    if (statusCode >= 200 && statusCode < 300) {
      if (data is Map<String, dynamic> || data is List<dynamic>) {
        return data;
      }
      throw CustomException('Invalid response format');
    }

    // Handle specific error cases
    switch (statusCode) {
      case 400:
        throw CustomException('Bad Request');
      case 401:
        throw CustomException('Invalid or expired token');
      case 403:
        throw CustomException('Forbidden');
      case 404:
        throw CustomException('Resource not found');
      case 429:
        throw CustomException('Too many requests. Please try again later.');
      case 500:
        throw CustomException('Internal Server Error');
      default:
        final errorMessage = data is Map<String, dynamic>
            ? data['message']?.toString()
            : 'Request failed with status $statusCode';
        throw CustomException(errorMessage ?? 'Unknown error occurred');
    }
  }

  //get operations
  Future<Map<String, dynamic>> get(String path,
      {Map<String, dynamic>? queryParameters,
      Object? data,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress,
      Options? options,
      String? sessionToken}) async {
    try {
      final response = await _dio.get(path,
          queryParameters: queryParameters,
          data: data,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
          options: options ?? headers(sessionToken));
      return await _handleResponse(response);
    } on DioException catch (e) {
      throw CustomException(e.message ?? 'Network error occurred');
    } catch (e) {
      throw CustomException('An unexpected error occurred');
    }
  }

  Future<Map<String, dynamic>> post(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress,
      Options? options,
      String? sessionToken}) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
        options: options ?? headers(sessionToken),
      );
      return await _handleResponse(response);
    } on DioException catch (e) {
      throw CustomException(e.message ?? 'Network error occurred');
    } catch (e) {
      throw CustomException('An unexpected error occurred');
    }
  }

  //put operations
  Future<Map<String, dynamic>> put(String path,
      {Map<String, dynamic>? queryParameters,
      Object? data,
      Map<String, dynamic>? payload,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress,
      String? sessionToken,
      Options? option}) async {
    try {
      final Response response = await _dio.put(
        path,
        data: payload ?? data,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        options: option ?? headers(sessionToken),
      );
      return await _handleResponse(response);
    } on DioException catch (e) {
      throw CustomException(e.message ?? 'Network error occurred');
    } catch (e) {
      throw CustomException('An unexpected error occurred');
    }
  }

  //delete operations
  Future<Map<String, dynamic>> delete(String path,
      {Map<String, dynamic>? queryParameters,
      Object? data,
      Map<String, dynamic>? payload,
      CancelToken? cancelToken,
      String? sessionToken,
      Options? option}) async {
    try {
      final Response response = await _dio.delete(
        path,
        data: payload ?? data,
        cancelToken: cancelToken,
        options: option ?? headers(sessionToken),
      );
      return await _handleResponse(response);
    } on DioException catch (e) {
      throw CustomException(e.message ?? 'Network error occurred');
    } catch (e) {
      throw CustomException('An unexpected error occurred');
    }
  }
}

class CustomException implements Exception {
  final String message;

  CustomException(this.message);

  @override
  String toString() => "CustomException: $message";
}
