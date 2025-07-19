import 'package:block/core/error/extensions.dart';
import 'package:block/core/network/response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared/models/action_state.dart';
import '../../domain/repository/account_repository.dart';

part 'phone_state.dart';
part 'phone_cubit.freezed.dart';

class PhoneCubit extends Cubit<PhoneState> {
  final AccountRepository _accountRepository;

  PhoneCubit(this._accountRepository) : super(const PhoneState.initial()){
    'Initialising Phone Cubit.....'.printDebug();
  }

  void updateCountry(String country){
    emit(state.copyWith(
        country: country,
        enabled: country.isNotEmpty && state.number.isNotEmpty
    ));
  }

  void updateNumber(String number){
    number.printDebug(tag: 'Update Number');
    emit(state.copyWith(
        number: number,
        enabled: number.isNotEmpty && state.country.isNotEmpty
    ));
  }

  Future<void> setPhone() async{
    emit(state.copyWith(status: const ActionState.loading()));
    final response = await _accountRepository.setPhone(state.number, state.country);
    response.onSuccess((_) =>
        emit(state.copyWith(status: const ActionState.success()))
    ).onError((error) =>
        emit(state.copyWith(status: ActionState.error(error.message())))
    );
  }

  void resetError() => emit(state.copyWith(status: const ActionState.idle()));
}
