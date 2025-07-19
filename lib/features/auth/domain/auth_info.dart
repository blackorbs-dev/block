import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_info.freezed.dart';

@freezed
abstract class AuthInfo with _$AuthInfo {
  const factory AuthInfo({
    required String email,
    required String password,
  }) = _AuthInfo;

  static const empty = AuthInfo(email: '', password: '');
}