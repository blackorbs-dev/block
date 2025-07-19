import 'package:block/core/storage/secure_keys.dart';
import 'package:block/core/storage/secure_storage.dart';
import 'package:block/di/injection.dart';
import 'package:block/features/auth/presentation/bloc_provider.dart';
import 'package:block/features/auth/presentation/pages/login.dart';
import 'package:block/features/auth/presentation/pages/signup.dart';
import 'package:block/features/dashboard/presentation/pages/dashboard.dart';
import 'package:block/features/dashboard/presentation/state_provider.dart';
import 'package:block/features/get_started/screen.dart';
import 'package:block/navigation/transition_builders.dart';
import 'package:go_router/go_router.dart';

import '../features/onboarding/screen.dart';
import 'routes.dart';

final router = GoRouter(
  initialLocation: Route.onboarding,
  routes: [
    GoRoute(
      path: Route.onboarding,
      pageBuilder: (context, state) => fadeTransition(
        key: state.pageKey,
        child: const OnboardingScreen(),
      ),
      redirect: (context, state) async{
        final storage = getIt<SecureStorage>();
        if (await storage.read(SecureKeys.accessToken) != null) {
          return Route.login;
        }
        return null;
      },
    ),
    GoRoute(
        path: Route.getStarted,
        pageBuilder: (context, state) => fadeTransition(
          key: state.pageKey,
          child: const GetStartedScreen(),
        )
    ),
    GoRoute(
      path: Route.dashboard,
      pageBuilder: (context, state) => fadeTransition(
        key: state.pageKey,
        child: dashboardStateProvider(const DashboardScreen()),
      ),
    ),
    ShellRoute(
      pageBuilder: (context, state, child) =>
          slideTransition(
              key: state.pageKey,
              child: authBlocProvider(child)
          ),
      routes: [
        GoRoute(
            path: Route.login,
            pageBuilder: (context, state) => flipTransition(
                key: state.pageKey,
                child: const LoginScreen()
            )
        ),
        GoRoute(
            path: Route.signup,
            pageBuilder: (context, state) => flipTransition(
                key: state.pageKey,
                child: const SignupScreen()
            )
        ),
      ],
    ),
  ],
);
