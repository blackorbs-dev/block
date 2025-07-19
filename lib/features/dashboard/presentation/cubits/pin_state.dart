part of 'pin_cubit.dart';

@freezed
class PinState with _$PinState {
  const PinState.initial({
    this.pin = '',
    this.status = const ActionState.idle()
  });

  @override
  final String pin;
  @override
  final ActionState status;
}
