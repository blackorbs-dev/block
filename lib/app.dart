import 'package:block/di/injection.dart';
import 'package:block/features/auth/data/repository/auth_repository_impl.dart';
import 'package:block/features/dashboard/domain/repository/account_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/theme/colors.dart';
import 'core/theme/type.dart';
import 'features/auth/domain/auth_repository.dart';
import 'features/dashboard/data/repository/account_repository_impl.dart';
import 'navigation/router.dart';

class App extends StatelessWidget{
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<AuthRepository>(
            create: (_) => AuthRepositoryImpl(getIt(), getIt()),
          ),
          RepositoryProvider<AccountRepository>(
            create: (_) => AccountRepositoryImpl(getIt()),
            dispose: (repository) => repository.dispose(),
          )
        ],
        child: const AppView()
    );
  }

}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: 'Block',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: 'Rubik',
            useMaterial3: true,
            textTheme: textTheme,
            extensions: [ AppColors() ],
            scaffoldBackgroundColor: Colors.white,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white)
        ),
        routerConfig: router
    );
  }
}