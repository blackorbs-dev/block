import 'package:block/features/dashboard/data/mapper/user_mapper.dart';

import '../../../../core/error/error.dart';
import '../../../../core/network/api_service.dart';
import '../../../../core/network/response.dart';
import '../../../../core/storage/secure_keys.dart';
import '../../../../core/storage/secure_storage.dart';
import '../../../dashboard/domain/models/user.dart';
import '../../data/mapper/auth_mapper.dart';
import '../../domain/auth_repository.dart';
import '../../domain/auth_info.dart';

class AuthRepositoryImpl extends AuthRepository{
  final ApiService _apiService;
  final SecureStorage _storage;

  AuthRepositoryImpl(this._apiService, this._storage);
  
  @override
  Future<Response<User, NetworkError>> login(AuthInfo authInfo) async{
    final response = await _apiService.login(authInfo.toRequest());
    return response.map((data) {
      _storage.write(SecureKeys.accessToken, data.accessToken);
      return data.userDto.toUser();
    });
  }

  @override
  Future<Response<User, NetworkError>> register(AuthInfo authInfo) async{
    final response = await _apiService.register(authInfo.toRequest());
    return response.map((data) {
      _storage.write(SecureKeys.accessToken, data.accessToken);
      return data.userDto.toUser();
    });
  }

}