import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared/models/action_state.dart';
import '../../domain/auth_info.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const AuthState.initial({
    this.actionState = const ActionState.idle(),
    this.authInfo = AuthInfo.empty,
    this.checked = false,
    this.enabled = false,
    this.authenticated = false,
  });

  @override
  final ActionState actionState;
  @override
  final AuthInfo authInfo;
  @override
  final bool checked; // checkbox state
  @override
  final bool enabled; // button state
  @override
  final bool authenticated;
}


