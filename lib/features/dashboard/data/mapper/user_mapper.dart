import '../../domain/models/user.dart';
import '../dto/user_dto.dart';

extension X on UserDto{
  User toUser() => User(
      id: id,
      email: email,
      name: name,
      phone: phone,
      pinSet: pinSet,
      onboardingPercentage: onboardingPercentage
  );
}