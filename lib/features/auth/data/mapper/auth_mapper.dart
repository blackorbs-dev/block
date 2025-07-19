import '../../domain/auth_info.dart';
import '../dto/auth_request.dart';

extension X on AuthInfo{
  AuthRequest toRequest() =>
      AuthRequest(email: email, password: password);
}