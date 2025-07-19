import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared/models/action_state.dart';
import '../../domain/auth_info.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const AuthState._({
    this.actionState = const ActionState.idle(),
    this.authInfo = AuthInfo.empty,
    this.checked = false,
    this.enabled = false
  });

  // const AuthState.initial() : this._();
  const AuthState.authenticated() : this._();
  const AuthState.unauthenticated() : this._();

  @override
  final ActionState actionState;
  @override
  final AuthInfo authInfo;
  @override
  final bool checked; // checkbox state
  @override
  final bool enabled; // button state
}


