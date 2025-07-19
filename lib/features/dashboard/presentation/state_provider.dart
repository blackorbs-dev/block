import 'package:block/features/dashboard/presentation/cubits/name_cubit.dart';
import 'package:block/features/dashboard/presentation/cubits/phone_cubit.dart';
import 'package:block/features/dashboard/presentation/cubits/pin_cubit.dart';
import 'package:block/features/dashboard/presentation/pages/account_setup.dart';
import 'package:block/features/dashboard/presentation/pages/name_setup.dart';
import 'package:block/features/dashboard/presentation/pages/personal_info.dart';
import 'package:block/features/dashboard/presentation/pages/phone_setup.dart';
import 'package:block/features/dashboard/presentation/pages/pin_setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/dashboard_bloc.dart';

Widget dashboardStateProvider(Widget child) =>
    MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => DashboardBloc(context.read()),
          ),
          BlocProvider(
            create: (context) =>  NameCubit(context.read()),
          ),
          BlocProvider(
            create: (context) =>  PhoneCubit(context.read()),
          ),
          BlocProvider(
            create: (context) =>  PinCubit(context.read()),
          ),
        ],
        child: BlocListener<DashboardBloc, DashboardState>(
                listener: (context, state) {
                  if(state.bottomSheetType != BottomSheetType.none){
                    showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        backgroundColor: Colors.transparent,
                        builder: (_) {
                          return Padding(
                              padding: EdgeInsets.only(
                                  bottom: MediaQuery.of(context).viewInsets.bottom),
                              child: Wrap(
                            children: [
                              Builder(
                                  builder: (_){
                                    switch(state.bottomSheetType){
                                      case BottomSheetType.none: throw UnimplementedError();
                                      case BottomSheetType.accountSetup:
                                        return BlocProvider.value(
                                            value: context.read<DashboardBloc>(),
                                            child: AccountSetupSheet()
                                        );
                                      case BottomSheetType.personalInfo:
                                        return BlocProvider.value(
                                          value: context.read<DashboardBloc>(),
                                          child: PersonalInfoSheet(),
                                        );
                                      case BottomSheetType.nameSetup:
                                        return BlocProvider.value(
                                          value: context.read<NameCubit>(),
                                          child: NameSetupSheet(),
                                        );
                                      case BottomSheetType.phoneSetup:
                                        return BlocProvider.value(
                                          value: context.read<PhoneCubit>(),
                                          child: PhoneSetupSheet(),
                                        );
                                      case BottomSheetType.pinSetup:
                                        return BlocProvider.value(
                                          value: context.read<PinCubit>(),
                                          child: PinSetupSheet(),
                                        );
                                    }
                                  }
                              )
                            ],
                          ));
                        }
                    );
                    context.read<DashboardBloc>().add(
                        const DashboardEvent.showBottomSheet(BottomSheetType.none)
                    );
                  }
                },
            child: child
        )
    );