import 'package:block/core/error/extensions.dart';
import 'package:dio/dio.dart';
import '../storage/secure_storage.dart';
import '../storage/secure_keys.dart';

class TokenInterceptor extends Interceptor {
  final SecureStorage storage;

  TokenInterceptor(this.storage);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await storage.read(SecureKeys.accessToken);
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    'Request: ${options.uri} \n ${options.data}'.printDebug();
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      // Optional: handle refresh logic here
    }
    err.response?.printDebug(tag: 'ErrorResponse');
    handler.next(err);
  }
}
