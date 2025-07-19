import 'package:block/core/error/extensions.dart';
import 'package:block/core/network/response.dart';
import 'package:block/features/dashboard/domain/repository/account_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/models/action_state.dart';
import '../../domain/auth_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class LoginBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  final AccountRepository _accountRepository;

  LoginBloc({
    required AuthRepository authRepository,
    required AccountRepository accountRepository
  }) : _authRepository = authRepository, _accountRepository = accountRepository,
        super(const AuthState.unauthenticated()) {
    on<Login>(_login);
    on<ResetError>(_onResetError);
    on<UpdateEmail>(_onUpdateEmail);
    on<UpdatePassword>(_onUpdatePassword);
    on<SetChecked>(_onSetChecked);
  }

  Future<void> _login(Login event, Emitter<AuthState> emit) async{
    emit(state.copyWith(actionState: const ActionState.loading()));
    final response = await _authRepository.login(state.authInfo);
    response.onSuccess((user) async{
      emit(AuthState.authenticated());
      _accountRepository.addUser(user);
    }).onError((error) async{
      emit(state.copyWith(actionState: ActionState.error(error.message())));
    });
  }

  void _onResetError(ResetError event, Emitter<AuthState> emit) {
    emit(state.copyWith(actionState: const ActionState.idle()));
  }

  void _onUpdateEmail(UpdateEmail event, Emitter<AuthState> emit) {
    final email = event.email;
    emit(
      state.copyWith(
        authInfo: state.authInfo.copyWith(email: email),
        enabled: email.isNotEmpty && state.authInfo.password.isNotEmpty,
      ),
    );
  }

  void _onUpdatePassword(UpdatePassword event, Emitter<AuthState> emit) {
    final password = event.password;
    emit(
      state.copyWith(
        authInfo: state.authInfo.copyWith(password: password),
        enabled: state.authInfo.email.isNotEmpty && password.isNotEmpty,
      ),
    );
  }

  void _onSetChecked(SetChecked event, Emitter<AuthState> emit) {
    final checked = event.checked;
    if (checked != null) {
      emit(state.copyWith(checked: checked));
    }
  }

}
