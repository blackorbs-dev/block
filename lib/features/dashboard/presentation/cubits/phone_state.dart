part of 'phone_cubit.dart';

@freezed
class PhoneState with _$PhoneState {
  const PhoneState.initial({
    this.country = 'NG',
    this.number = '',
    this.enabled = false,
    this.status = const ActionState.idle()
  });

  @override
  final String country;
  @override
  final String number;
  @override
  final bool enabled;
  @override
  final ActionState status;
}
