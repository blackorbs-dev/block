import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../core/network/api_service.dart';
import '../core/network/token_interceptor.dart';
import '../core/storage/secure_storage.dart';
import '../core/storage/secure_storage_impl.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // Secure storage
  getIt.registerLazySingleton<SecureStorage>(() => SecureStorageImpl());

  // Dio with interceptor
  getIt.registerLazySingleton<Dio>(() {
    final dio = Dio();
    dio.interceptors.add(TokenInterceptor(getIt<SecureStorage>()));
    return dio;
  });

  // Retrofit
  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));
}
