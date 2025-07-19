import 'package:block/core/theme/extensions.dart';
import 'package:block/features/dashboard/presentation/widgets/top_rounded_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

import '../../../shared/components/primary_button.dart';
import '../../../shared/models/action_state.dart';
import '../cubits/pin_cubit.dart';
import '../widgets/bottom_sheet_container.dart';
import '../widgets/bottom_sheet_header.dart';

class PinSetupSheet extends StatelessWidget{
  const PinSetupSheet({super.key});

  @override
  Widget build(BuildContext context) {

    final defaultPinTheme = PinTheme(
      width: 48, height: 48,
      textStyle: context.theme.textTheme.titleSmall
        .withColor(context.theme.colors.darkGrey),
      decoration: BoxDecoration(
        border: Border.all(color: context.theme.colors.midGrey),
        borderRadius: BorderRadius.circular(8),
      ),
    );

    return TopRoundedBox(child: BottomSheetContainer(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 44),
        child: Column(
          children: [
            const BottomSheetHeader(
              title: 'Set your Transaction Pin',
              icon: 'assets/icons/ic_password.svg',
              subtitle: 'Add 4-digit PIN to make your block account more secure. Use the code for fast login and withdrawals.',
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 88),
              child: Pinput(
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    border: Border.all(color: context.theme.colors.navyBlue),
                  ),
                ),
                onChanged: context.read<PinCubit>().updatePin,
              ),
            ),
            BlocConsumer<PinCubit, PinState>(
              builder: (context, state) {
                return PrimaryButton(
                  text: 'Set your Pin',
                  isLoading: state.status is Loading,
                  enabled: state.pin.length == 4,
                  onPressed: context.read<PinCubit>().setPin,
                );
              },
              listenWhen: (previous, current) => previous.status != current.status,
              listener: (context, state) {
                switch(state.status) {
                  case Error(:final message):
                    Fluttertoast.showToast(msg: message);
                    context.read<PinCubit>().resetError();
                  case Success():
                    Fluttertoast.showToast(msg: 'Pin set successfully');
                    context.read<PinCubit>().resetError();
                    context.pop();
                  default:
                }
              },
            )
          ]
        )
      )
    ));
  }

}