import 'package:block/core/theme/extensions.dart';
import 'package:block/features/auth/presentation/bloc/signup_bloc.dart';
import 'package:block/features/auth/presentation/widget/bottom_text.dart';
import 'package:block/features/auth/presentation/widget/check_box.dart';
import 'package:block/features/auth/presentation/widget/header.dart';
import 'package:block/features/shared/components/input_title.dart';
import 'package:block/features/shared/components/primary_button.dart';
import 'package:block/features/shared/components/text_field.dart';
import 'package:flutter/material.dart' hide Route;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../navigation/routes.dart';
import '../../../shared/models/action_state.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';

class SignupScreen extends StatelessWidget{
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {

    void handleEvent(AuthEvent event) => context.read<SignupBloc>().add(event);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeaderBox(
                    title: 'Hello there boss!🫡',
                    subtitle: 'Create an account to start trading with us.'
                ),
                const InputTitle(text: 'Email'),
                TextInputField(
                    hint: 'Enter your email address',
                    inputType: TextInputType.emailAddress,
                    onChanged: (text){
                      handleEvent(AuthEvent.updateEmail(text));
                    }
                ),
                const InputTitle(text: 'Password'),
                TextInputField(
                    hint: 'Enter your password',
                    inputType: TextInputType.visiblePassword,
                    onChanged: (text){
                      handleEvent(AuthEvent.updatePassword(text));
                    }
                ),
                const InputTitle(text: 'Referral Code (Optional)'),
                TextInputField(
                    hint: 'Enter referral code',
                    onChanged: (_){}
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    BlocSelector<SignupBloc, AuthState, bool>(
                        selector: (state) => state.checked,
                        builder: (context, checked) => CheckBox(
                            value: checked,
                            onChanged: (checked){
                              handleEvent(AuthEvent.setChecked(checked));
                            }
                        )
                    ),
                    SizedBox(width: 6),
                    RichText(
                      text: TextSpan(
                          style: context.theme.textTheme.labelLarge,
                          children: [
                            TextSpan(
                                text: 'I agree to block ',
                                style: TextStyle(color: context.theme.colors.mutedGrey)
                            ),
                            TextSpan(
                                text: 'Terms of use',
                                style: TextStyle(color: context.theme.colors.darkGrey)
                            ),
                            TextSpan(
                                text: ' and ',
                                style: TextStyle(color: context.theme.colors.mutedGrey)
                            ),
                            TextSpan(
                                text: 'Privacy',
                                style: TextStyle(color: context.theme.colors.darkGrey)
                            ),
                          ]
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 34),
                BlocBuilder<SignupBloc, AuthState>(
                  builder: (context, state) => PrimaryButton(
                      text: 'Join Block',
                      isLoading: state.actionState is Loading,
                      enabled: state.enabled,
                      onPressed: (){
                        handleEvent(const AuthEvent.register());
                      }
                  ),
                ),
                Spacer(),
                BottomText(
                    text: 'Already have an account? ',
                    actionText: 'Sign In',
                    onAction: () => context.pushReplacement(Route.login)
                )
              ],
            ),
          )
      ),
    );
  }

}