import 'package:block/core/error/extensions.dart';
import 'package:block/core/network/response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared/models/action_state.dart';
import '../../domain/repository/account_repository.dart';

part 'pin_state.dart';
part 'pin_cubit.freezed.dart';

class PinCubit extends Cubit<PinState> {
  final AccountRepository _accountRepository;

  PinCubit(this._accountRepository) : super(const PinState.initial());

  void updatePin(String pin){
    emit(state.copyWith(pin: pin));
  }

  Future<void> setPin() async {
    emit(state.copyWith(status: const ActionState.loading()));
    final response = await _accountRepository.setPin(state.pin);
    response.onSuccess((_) =>
        emit(state.copyWith(status: const ActionState.success()))
    ).onError((error) =>
        emit(state.copyWith(status: ActionState.error(error.message())))
    );
  }

  void resetError() => emit(state.copyWith(status: const ActionState.idle()));
}
