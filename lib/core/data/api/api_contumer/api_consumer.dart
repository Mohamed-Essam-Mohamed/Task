import 'package:dio/dio.dart';
import 'package:tasky/core/data/api/keys/keys_api.dart';

// Dio helper class
abstract class ApiConsumer {
  Future<dynamic> get(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  });
  Future<dynamic> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  });
  Future<dynamic> patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  });
  Future<dynamic> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  });
}

class DioConsumer implements ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = KeysApi.baseUrl;
    // dio.interceptors.add(ApiInterceptor());
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    )); // print status api in consol
  }
  @override
  Future get(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.get(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future post(
    String path, {
    dynamic? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.post(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future patch(
    String path, {
    dynamic? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.patch(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future delete(
    String path, {
    dynamic? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.delete(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }
}

void handleDioExceptions(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw ServerException(ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.sendTimeout:
      throw ServerException(ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.receiveTimeout:
      throw ServerException(ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.badCertificate:
      throw ServerException(ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.cancel:
      throw ServerException(ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.connectionError:
      throw ServerException(ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.unknown:
      throw ServerException(ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400: // Bad request
          throw ServerException(ErrorModel.fromJson(e.response!.data));
        case 401: //unauthorized
          throw ServerException(ErrorModel.fromJson(e.response!.data));
        case 403: //forbidden
          throw ServerException(ErrorModel.fromJson(e.response!.data));
        case 404: //not found
          throw ServerException(ErrorModel.fromJson(e.response!.data));
        case 409: //cofficient
          throw ServerException(ErrorModel.fromJson(e.response!.data));
        case 422: //  Unprocessable Entity
          throw ServerException(ErrorModel.fromJson(e.response!.data));
        case 504: // Server exception
          throw ServerException(ErrorModel.fromJson(e.response!.data));
      }
  }
}

// class ApiInterceptor extends Interceptor {
//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     options.headers['Accept-Language'] = 'en';
//     super.onRequest(options, handler);
//   }
// }

// server exception
class ServerException implements Exception {
  final ErrorModel errorModel;
  ServerException(this.errorModel);
}

class ErrorModel {
  String? message;
  String? error;
  int? statusCode;

  ErrorModel({this.message, this.error, this.statusCode});

  ErrorModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    error = json['error'];
    statusCode = json['statusCode'];
  }
}
