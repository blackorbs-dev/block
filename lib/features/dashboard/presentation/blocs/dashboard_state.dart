part of 'dashboard_bloc.dart';

@freezed
class DashboardState with _$DashboardState {
  const DashboardState.initial({
    this.user = User.empty,
    this.quote = Quote.empty,
    this.bottomSheetType = BottomSheetType.none,
    this.status = const ActionState.idle(),
  });

  @override
  final User user;
  @override
  final Quote quote;
  @override
  final ActionState status;
  @override
  final BottomSheetType bottomSheetType;
}