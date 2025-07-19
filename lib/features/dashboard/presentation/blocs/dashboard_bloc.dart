import 'package:block/core/error/extensions.dart';
import 'package:block/core/network/response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared/models/action_state.dart';
import '../../domain/models/quote.dart';
import '../../domain/models/user.dart';
import '../../domain/repository/account_repository.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';
part 'dashboard_bloc.freezed.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {

  final AccountRepository _accountRepository;
  bool _isFirst = true;

  DashboardBloc(this._accountRepository) : super(const DashboardState.initial()) {
    on<_Started>(_started);
    on<_GetQuote>(_getQuote);
    on<_ResetError>(_resetError);
    on<_ShowBottomSheet>(_showBottomSheet);
    add(DashboardEvent.started());
    add(DashboardEvent.getQuote());
  }

  Future<void> _getQuote(_GetQuote event, Emitter<DashboardState> emit) async{
    emit(state.copyWith(status: const ActionState.loading()));
    final response = await _accountRepository.getQuote();
    response.onSuccess((quote) =>
        emit(state.copyWith(
            quote: quote,
            status: const ActionState.success()
        ))
    ).onError((error) =>
        emit(state.copyWith(status: ActionState.error(error.message())))
    );
  }

  Future<void> _started(_Started event, Emitter<DashboardState> emit){
    return emit.onEach(
        _accountRepository.getUser(),
        onData: (user){
          user.printDebug(tag: 'New user::::::::::');
          emit(state.copyWith(user: user));
          if(_isFirst){
            _isFirst = false;
            if(user.onboardingPercentage != 100){
              add(DashboardEvent.showBottomSheet(BottomSheetType.accountSetup));
              'Showing Account Setup.....'.printDebug();
            }
          }
          else{
            add(DashboardEvent.getQuote());
          }
        },
        onError: addError
    );
  }

  void _showBottomSheet(_ShowBottomSheet event, Emitter<DashboardState> emit){
    emit(state.copyWith(bottomSheetType: event.type));
  }

  void _resetError(_ResetError event, Emitter<DashboardState> emit){
    emit(state.copyWith(status: const ActionState.idle()));
  }
}
