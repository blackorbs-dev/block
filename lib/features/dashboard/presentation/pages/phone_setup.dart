import 'package:block/features/dashboard/presentation/widgets/country_dropdown.dart';
import 'package:block/features/dashboard/presentation/widgets/top_rounded_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/components/input_title.dart';
import '../../../shared/components/primary_button.dart';
import '../../../shared/components/text_field.dart';
import '../../../shared/models/action_state.dart';
import '../cubits/phone_cubit.dart';
import '../widgets/bottom_sheet_container.dart';
import '../widgets/bottom_sheet_header.dart';

class PhoneSetupSheet extends StatelessWidget{
  const PhoneSetupSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return TopRoundedBox(child: BottomSheetContainer(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 44),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BottomSheetHeader(
              title: 'Phone Number',
              icon: 'assets/icons/ic_phone.svg',
              subtitle: 'Add your phone number to your block account',
            ),
            const SizedBox(height: 6,),
            const InputTitle(text: 'Phone Number'),
            TextInputField(
              hint: 'Enter your phone number',
              prefix: const CountryDropDown(),
              onChanged: context.read<PhoneCubit>().updateNumber,
            ),
            const SizedBox(height: 96),
            BlocConsumer<PhoneCubit, PhoneState>(
              builder: (context, state) {
                return PrimaryButton(
                  text: 'Save Phone Number',
                  isLoading: state.status is Loading,
                  enabled: state.number.isNotEmpty,
                  onPressed: context.read<PhoneCubit>().setPhone,
                );
              },
              listenWhen: (previous, current) => previous.status != current.status,
              listener: (context, state) {
                switch(state.status) {
                  case Error(:final message):
                    Fluttertoast.showToast(msg: message);
                    context.read<PhoneCubit>().resetError();
                  case Success():
                    Fluttertoast.showToast(msg: 'Phone number set successfully');
                    context.read<PhoneCubit>().resetError();
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