import 'package:block/features/dashboard/domain/models/user.dart';

import '../../../core/error/error.dart';
import '../../../core/network/response.dart';
import 'auth_info.dart';

abstract class AuthRepository{
  Future<Response<User, NetworkError>> login(AuthInfo authInfo);
  Future<Response<User, NetworkError>> register(AuthInfo authInfo);
}