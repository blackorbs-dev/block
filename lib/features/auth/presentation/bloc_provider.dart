import 'package:flutter/cupertino.dart' hide Route;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

import '../../../navigation/routes.dart';
import '../../shared/models/action_state.dart';
import 'bloc/auth_event.dart';
import 'bloc/auth_state.dart';
import 'bloc/login_bloc.dart';
import 'bloc/signup_bloc.dart';

Widget authBlocProvider(Widget child){
  return MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => LoginBloc(
          authRepository: context.read(),
          accountRepository: context.read(),
        ),
      ),
      BlocProvider(
        create: (context) => SignupBloc(
          authRepository: context.read(),
          accountRepository: context.read(),
        ),
      ),
    ],
    child: MultiBlocListener(
      listeners: [
        BlocListener<LoginBloc, AuthState>(
          listener: (context, state) {
            if(state.actionState case Error(:final message)){
              Fluttertoast.showToast(msg: message);
              context.read<LoginBloc>().add(const AuthEvent.resetError());
            }
            if(state.authenticated){
              Fluttertoast.showToast(msg: 'Login successful');
              context.pushReplacement(Route.dashboard);
            }
          },
        ),
        BlocListener<SignupBloc, AuthState>(
          listener: (context, state) {
            if(state.actionState case Error(:final message)){
              Fluttertoast.showToast(msg: message);
              context.read<SignupBloc>().add(const AuthEvent.resetError());
            }
            if(state.authenticated){
              Fluttertoast.showToast(msg: 'Registration successful');
              context.pushReplacement(Route.dashboard);
            }
          },
        )
      ],
      child: child,
    ),
  );
}