import 'package:block/core/error/extensions.dart';
import 'package:dio/dio.dart' hide Response;
import 'package:flutter/cupertino.dart';
import 'package:retrofit/call_adapter.dart';

import '../error/error.dart';
import '../error/error_dto.dart';
import 'response.dart';

/// Generic class that map network response to Success | Error
class ResponseAdapter<T> extends CallAdapter<Future<T>, Future<Response<T, NetworkError>>> {
  @override
  Future<Response<T, NetworkError>> adapt(Future<T> Function() call) async {
    try {
      final result = await call();
      result?.printDebug();
      return Response.success(result);
    } on DioException catch (e) {
      e.printDebug(tag: 'DioException');
      return Response.error(_mapDioError(e));
    } catch (e, stackTrace) {
      e.printDebug(tag: 'error');
      stackTrace.printDebug(tag: 'StackTrace');
      return const Response.error(NetworkError.unknown());
    }
  }

  NetworkError _mapDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return const NetworkError.requestTimeout();

      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        final data = e.response?.data;

        if (statusCode == 429) {
          return const NetworkError.tooManyRequests();
        } else if (statusCode != null && statusCode >= 500) {
          return const NetworkError.server();
        }

        // handle message in error response
        final message = _extractMessage(data);
        if (message != null) {
          return NetworkError.message(message);
        }
        break;

      case DioExceptionType.unknown:
        return const NetworkError.noInternet();
      default:
    }

    return const NetworkError.unknown();
  }

  String? _extractMessage(dynamic data) {
    try {
      if (data is Map<String, dynamic>) {
        return ErrorDto.fromJson(data).message;
      }
    } catch (e) { e.printDebug(); }
    // if (data is Map<String, dynamic> && data['message'] is String) {
    //   return data['message'];
    // } else if (data is String) {
    //   return data;
    // }
    return null;
  }
}
