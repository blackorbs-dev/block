import 'package:freezed_annotation/freezed_annotation.dart';

part 'action_state.freezed.dart';

@freezed
sealed class ActionState with _$ActionState{
  const factory ActionState.loading() = Loading;
  const factory ActionState.success() = Success;
  const factory ActionState.error(String message) = Error;
  const factory ActionState.idle() = Idle;
}