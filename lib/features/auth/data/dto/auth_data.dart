import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../dashboard/data/dto/user_dto.dart';

part 'auth_data.freezed.dart';
part 'auth_data.g.dart';

@freezed
abstract class AuthData with _$AuthData {
  const factory AuthData({
    @JsonKey(name: 'user') required UserDto userDto,
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'token_type') required String tokenType,
  }) = _AuthData;

  factory AuthData.fromJson(Map<String, dynamic> json) => _$AuthDataFromJson(json);
}
