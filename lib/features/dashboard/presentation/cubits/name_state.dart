part of 'name_cubit.dart';

@freezed
class NameState with _$NameState {
  const NameState.initial({
    this.name = '',
    this.status = const ActionState.idle()
  });

  @override
  final String name;
  @override
  final ActionState status;
}
