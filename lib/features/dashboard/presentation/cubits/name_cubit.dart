import 'package:block/core/error/extensions.dart';
import 'package:block/core/network/response.dart';
import 'package:block/features/shared/models/action_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/repository/account_repository.dart';

part 'name_state.dart';
part 'name_cubit.freezed.dart';

class NameCubit extends Cubit<NameState> {
  final AccountRepository _accountRepository;

  NameCubit(this._accountRepository) : super(const NameState.initial());

  void updateName(String name){
    emit(state.copyWith(name: name));
  }

  Future<void> setName() async {
    emit(state.copyWith(status: const ActionState.loading()));
    final response = await _accountRepository.setName(state.name);
    response.onSuccess((_) =>
        emit(state.copyWith(status: const ActionState.success()))
    ).onError((error) =>
        emit(state.copyWith(status: ActionState.error(error.message())))
    );
  }

  void resetError() => emit(state.copyWith(status: const ActionState.idle()));
}
