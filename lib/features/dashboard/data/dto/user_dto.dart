import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
abstract class UserDto with _$UserDto {
  const factory UserDto({
    required int id,
    required String email,
    required String? name,
    @JsonKey(name: 'phone_number') required String? phone,
    @JsonKey(name: 'pin_set') required bool pinSet,
    @JsonKey(name: 'onboarding_percentage') required int onboardingPercentage,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);
}
