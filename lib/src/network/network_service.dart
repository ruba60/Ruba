import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hospital_mang2/src/utils/app_constants.dart';
import '../constants/services_urls.dart';
import '../../generated/l10n.dart';

abstract class NetworkService<T> {
  Future<T> get(String url,
      {dynamic data, Map<String, dynamic>? queryParameters});
  Future<T> post(String url, dynamic data,
      [Map<String, dynamic>? queryParameters]);
  Future<T> put(String url, dynamic data,
      [Map<String, dynamic>? queryParameters]);

  Future<T> delete(String url,
      {dynamic data, Map<String, dynamic>? queryParameters});
}

Dio gettingDio(String languageCode, String? token) {
  final Dio dio = Dio(BaseOptions(
    baseUrl: ServicesUrls.baseUrl,
    receiveTimeout: AppConstants.timeOutduration,
    connectTimeout: AppConstants.timeOutduration,
    sendTimeout: AppConstants.timeOutduration,
  ));

  dio.interceptors
      .addAll({DioAppInterceptors(token: token, languageCode: languageCode)});
  if (kDebugMode) {
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }
  return dio;
}

class DioNetworkService implements NetworkService<Response> {
  final Dio _dio;

  DioNetworkService(String languageCode, String? token)
      : _dio = gettingDio(languageCode, token);

  @override
  Future<Response> get(String endpoint,
          {dynamic data, Map<String, dynamic>? queryParameters}) =>
      _dio.get(endpoint, data: data, queryParameters: queryParameters);

  @override
  Future<Response> post(String endpoint, dynamic data,
          [Map<String, dynamic>? queryParameters]) =>
      _dio.post(endpoint, data: data, queryParameters: queryParameters);

  @override
  Future<Response> put(String endpoint, dynamic data,
          [Map<String, dynamic>? queryParameters]) =>
      _dio.put(endpoint, data: data, queryParameters: queryParameters);

  @override
  Future<Response> delete(String endpoint,
          {dynamic data, Map<String, dynamic>? queryParameters}) =>
      _dio.delete(endpoint, data: data, queryParameters: queryParameters);
}

class DioAppInterceptors extends Interceptor {
  final String languageCode;
  final String? token;
  DioAppInterceptors({
    required this.languageCode,
    required this.token,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (token != null) {
      options.headers['Authorization'] = 'token $token';
    }
    options.headers['Accept-Language'] = languageCode;
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response != null) {
      debugPrint(err.response!.data.toString());
    }
    final String? message = err.response?.data['message'];
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw DeadlineExceededException(err.requestOptions, message);
      case DioExceptionType.badResponse:
        switch (err.response?.statusCode) {
          case 400:
            throw BadRequestException(err.requestOptions, message);
          case 401:
            throw UnauthorizedException(err.requestOptions, message);
          case 403:
            throw AccessForbiddenException(err.requestOptions, message);
          case 404:
            throw NotFoundException(err.requestOptions, message);
          case 409:
            throw ConflictException(err.requestOptions, message);
          case 422:
            throw UnprocessableEntityException(err.requestOptions, message);
          case 500:
            throw InternalServerErrorException(err.requestOptions, message);
          default:
            throw BadResponseException(err.requestOptions, message);
        }
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.unknown:
        throw NoInternetConnectionException(err.requestOptions, message);
      case DioExceptionType.badCertificate:
        throw BadCertificateException(err.requestOptions, message);
      case DioExceptionType.connectionError:
        throw ConnectionErrorException(err.requestOptions, message);
    }
    return handler.next(err);
  }
}

class ApiException extends DioException {
  ApiException(RequestOptions requestOptions, [this.customMessage])
      : super(requestOptions: requestOptions, error: customMessage);

  final String? customMessage;

  String get defaultErrorString => S.current.requestError;

  @override
  String toString() {
    return customMessage ?? defaultErrorString;
  }
}

class BadRequestException extends ApiException {
  BadRequestException(super.requestOptions, [super.message]);

  @override
  String get defaultErrorString => S.current.badRequest;
}

class UnprocessableEntityException extends ApiException {
  UnprocessableEntityException(super.requestOptions, [super.message]);

  @override
  String get defaultErrorString => S.current.unprocessableEntity;
}

class InternalServerErrorException extends ApiException {
  InternalServerErrorException(super.requestOptions, [super.message]);

  @override
  String get defaultErrorString => S.current.internalServerError;
}

class ConflictException extends ApiException {
  ConflictException(super.requestOptions, [super.message]);

  @override
  String get defaultErrorString => S.current.conflictConnection;
}

class UnauthorizedException extends ApiException {
  UnauthorizedException(super.requestOptions, [super.message]);

  @override
  String get defaultErrorString => S.current.unauthorized;
}

class NotFoundException extends ApiException {
  NotFoundException(super.requestOptions, [super.message]);

  @override
  String get defaultErrorString => S.current.notFound;
}

class NoInternetConnectionException extends ApiException {
  NoInternetConnectionException(super.requestOptions, [super.message]);

  @override
  String get defaultErrorString => S.current.noInternetConnection;
}

class DeadlineExceededException extends ApiException {
  DeadlineExceededException(super.requestOptions, [super.message]);

  @override
  String get defaultErrorString => S.current.deadlineExceeded;
}

class AccessForbiddenException extends ApiException {
  AccessForbiddenException(super.requestOptions, [super.message]);

  @override
  String get defaultErrorString => S.current.accessForbidden;
}

class BadCertificateException extends ApiException {
  BadCertificateException(super.requestOptions, [super.message]);
  @override
  String get defaultErrorString => S.current.badCertificate;
}

class ConnectionErrorException extends ApiException {
  ConnectionErrorException(super.requestOptions, [super.message]);
  @override
  String get defaultErrorString => S.current.connectionError;
}

class BadResponseException extends ApiException {
  BadResponseException(super.requestOptions, [super.message]);
  @override
  String get defaultErrorString => S.current.badResponse;
}

class AppException implements Exception {
  final dynamic message;

  AppException([this.message]);

  @override
  String toString() {
    return message == null ? '' : message.toString();
  }
}
