import 'package:block/core/theme/extensions.dart';
import 'package:block/features/shared/components/primary_button.dart';
import 'package:block/features/dashboard/presentation/widgets/account_item.dart';
import 'package:block/features/dashboard/presentation/widgets/bottom_sheet_header.dart';
import 'package:block/features/dashboard/presentation/widgets/top_rounded_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../blocs/dashboard_bloc.dart';
import '../widgets/bottom_sheet_container.dart';

class PersonalInfoSheet extends StatelessWidget{
  const PersonalInfoSheet({super.key});

  @override
  Widget build(BuildContext context) {

    final user = context.select((DashboardBloc bloc) => bloc.state.user);
    void handleEvent(DashboardEvent event) => context.read<DashboardBloc>().add(event);

    return TopRoundedBox(child: BottomSheetContainer(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 32, 18, 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BottomSheetHeader(
                title: 'Personal Information',
                subtitle: 'Set a unique username, create transaction pins and add your account details.'
            ),
            const SizedBox(height: 16,),
            LinearProgressIndicator(
              value: user.onboardingPercentage/100,
              borderRadius: BorderRadius.circular(8),
              minHeight: 8,
              color: context.theme.colors.navyBlue,
              backgroundColor: context.theme.colors.lightGrey,
            ),
            Text(
                '${user.onboardingPercentage}% Complete',
                style: context.theme.textTheme.labelLarge
                  .withColor(context.theme.colors.darkGrey),
            ),
            const SizedBox(height: 24),
            AccountItem(
                icon: 'assets/icons/ic_user.svg',
                title: 'Account Name',
                subtitle: 'Set a unique username and full name ',
                isDone: user.name != null,
                onTap: (){
                  handleEvent(DashboardEvent.showBottomSheet(BottomSheetType.nameSetup));
                },
            ),
            AccountItem(
                icon: 'assets/icons/ic_phone.svg',
                title: 'Phone Number',
                subtitle: 'Add your phone number',
                isDone: user.phone != null,
                onTap: (){
                  handleEvent(DashboardEvent.showBottomSheet(BottomSheetType.phoneSetup));
                },
            ),
            AccountItem(
                icon: 'assets/icons/ic_password.svg',
                title: 'Create Transaction Pin',
                subtitle: 'Add 4-digit PIN for easy and secure transaction',
                isDone: user.pinSet,
                onTap: (){
                  handleEvent(DashboardEvent.showBottomSheet(BottomSheetType.pinSetup));
                },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: PrimaryButton(
                  text: 'Finish',
                  enabled: user.onboardingPercentage == 100,
                  onPressed: context.pop
              )
            ),
            Center(child: TextButton(
                onPressed: context.pop,
                child: Text(
                  'Set up Later',
                  style: context.theme.textTheme.bodySmall
                    .withColor(context.theme.colors.mutedGrey),
                )
            ))
          ]
        )
      )
    ));
  }

}