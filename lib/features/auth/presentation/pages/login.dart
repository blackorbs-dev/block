import 'package:block/core/theme/extensions.dart';
import 'package:block/features/shared/models/action_state.dart';
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
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget{
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    void handleEvent(AuthEvent event) => context.read<LoginBloc>().add(event);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeaderBox(
                    title: 'Welcome back Spender! 🫡',
                    subtitle: 'Sign in to start using your Block Account'
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
                const SizedBox(height: 4),
                Row(
                  children: [
                    BlocSelector<LoginBloc, AuthState, bool>(
                        selector: (state) => state.checked,
                        builder: (context, checked) => CheckBox(
                            value: checked,
                            onChanged: (checked){
                              handleEvent(AuthEvent.setChecked(checked));
                            }
                        )
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Remember me',
                      style: context.theme.textTheme.labelLarge
                        .withColor(context.theme.colors.mutedGrey),
                    ),
                    const Spacer(),
                    TextButton(
                        onPressed: (){},
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all(EdgeInsets.zero),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          'Forget Password?',
                          style: context.theme.textTheme.titleSmall
                              .withColor(context.theme.colors.navyBlue),
                        )
                    )
                  ],
                ),
                const SizedBox(height: 28),
                BlocBuilder<LoginBloc, AuthState>(
                  builder: (context, state) => PrimaryButton(
                      text: 'Sign In',
                      isLoading: state.actionState is Loading,
                      enabled: state.enabled,
                      onPressed: (){
                        handleEvent(const AuthEvent.login());
                      }
                  ),
                ),
                const Spacer(),
                BottomText(
                    text: 'Don’t have an account? ',
                    actionText: 'Join Block',
                    onAction: () => context.pushReplacement(Route.signup)
                )
              ],
            ),
        )
      ),
    );
  }

}