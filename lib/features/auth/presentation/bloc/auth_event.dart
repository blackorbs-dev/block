import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.updateEmail(String email) = UpdateEmail;
  const factory AuthEvent.updatePassword(String password) = UpdatePassword;
  const factory AuthEvent.setChecked(bool? checked) = SetChecked;
  const factory AuthEvent.resetError() = ResetError;
  const factory AuthEvent.login() = Login;
  const factory AuthEvent.register() = Register;
}
