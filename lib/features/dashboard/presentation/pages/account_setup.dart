import 'package:block/core/theme/extensions.dart';
import 'package:block/features/shared/components/primary_button.dart';
import 'package:block/features/dashboard/presentation/blocs/dashboard_bloc.dart';
import 'package:block/features/dashboard/presentation/widgets/bottom_sheet_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class AccountSetupSheet extends StatelessWidget{
  const AccountSetupSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 22),
      decoration: BoxDecoration(
        color: context.theme.colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: BottomSheetContainer(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(18, 38, 16, 42),
              child: Column(
                children: [
                  SvgPicture.asset(
                    'assets/images/logo.svg',
                    colorFilter: ColorFilter.mode(context.theme.colors.black, BlendMode.srcIn),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Before you start trading we need few things from you. Set up your Username, Create Transaction Pin, Phone number, Bank Account and. Base currency for all your transactions on block.',
                    style: context.theme.textTheme.bodySmall
                        .withColor(context.theme.colors.mutedGrey),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16, top: 46),
                    child: PrimaryButton(
                        text: 'Set up Account',
                        onPressed: (){
                          context.pop();
                          context.read<DashboardBloc>().add(
                              DashboardEvent.showBottomSheet(BottomSheetType.personalInfo)
                          );
                        }
                    ),
                  ),
                  RichText(text: TextSpan(
                      children: [
                        TextSpan(
                            text: 'Set up Later ',
                            style: context.theme.textTheme.bodySmall
                                .withColor(context.theme.colors.mutedGrey)
                        ),
                        TextSpan(
                            text: 'Go to Dashboard',
                            style: context.theme.textTheme.titleSmall
                                .withColor(context.theme.colors.darkGrey),
                            recognizer: TapGestureRecognizer()..onTap = context.pop
                        )
                      ]
                  ))
                ],
              )
          )
      ),
    );
  }

}