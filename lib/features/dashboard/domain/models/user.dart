import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
abstract class User with _$User {
  const factory User({
    required int id,
    required String email,
    String? name,
    String? phone,
    required bool pinSet,
    required int onboardingPercentage
  }) = _User;

  static const empty = User(
      id: -1,
      email: '',
      pinSet: false,
      onboardingPercentage: 0
  );
}
