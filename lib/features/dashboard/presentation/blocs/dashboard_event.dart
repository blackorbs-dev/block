part of 'dashboard_bloc.dart';

@freezed
class DashboardEvent with _$DashboardEvent {
  const factory DashboardEvent.started() = _Started;
  const factory DashboardEvent.getQuote() = _GetQuote;
  const factory DashboardEvent.resetError() = _ResetError;
  const factory DashboardEvent.showBottomSheet(BottomSheetType type) = _ShowBottomSheet;
}

enum BottomSheetType{
  none, accountSetup, personalInfo, nameSetup, phoneSetup, pinSetup
}
