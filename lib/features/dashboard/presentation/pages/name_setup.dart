import 'package:block/features/shared/components/input_title.dart';
import 'package:block/features/shared/components/text_field.dart';
import 'package:block/features/shared/models/action_state.dart';
import 'package:block/features/dashboard/presentation/cubits/name_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/components/primary_button.dart';
import '../widgets/bottom_sheet_container.dart';
import '../widgets/bottom_sheet_header.dart';
import '../widgets/top_rounded_box.dart';

class NameSetupSheet extends StatelessWidget{
  const NameSetupSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return TopRoundedBox(child: BottomSheetContainer(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 38, 16, 44),
          child: SingleChildScrollView(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BottomSheetHeader(
                title: 'Account Name',
                icon: 'assets/icons/ic_user.svg',
                subtitle: 'Enter a Unique username to address you as on block',
              ),
              const SizedBox(height: 8,),
              InputTitle(text: 'Username'),
              TextInputField(
                  hint: 'Enter your username',
                  onChanged: context.read<NameCubit>().updateName,
              ),
              InputTitle(text: 'First Name'),
              TextInputField(
                hint: 'Enter your first name',
                onChanged: (_){},
              ),
              InputTitle(text: 'Last Name'),
              TextInputField(
                hint: 'Enter your last name',
                onChanged: (_){},
              ),
              const SizedBox(height: 16,),
              BlocConsumer<NameCubit, NameState>(
                builder: (context, state) {
                  return PrimaryButton(
                    text: 'Save Name',
                    isLoading: state.status is Loading,
                    enabled: state.name.isNotEmpty,
                    onPressed: context.read<NameCubit>().setName,
                  );
                },
                listenWhen: (previous, current) => previous.status != current.status,
                listener: (context, state) {
                  switch(state.status) {
                    case Error(:final message):
                        Fluttertoast.showToast(msg: message);
                        context.read<NameCubit>().resetError();
                    case Success():
                        Fluttertoast.showToast(msg: 'Name set successfully');
                        context.read<NameCubit>().resetError();
                        context.pop();
                    default:
                  }
                },
              )
            ]
          ))
        )
    ));
  }

}