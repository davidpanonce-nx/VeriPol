import 'package:go_router/go_router.dart';
import 'package:veripol/core/routes/routes.dart';
import 'package:veripol/core/routes/routing_transitions.dart';
import 'package:veripol/views/authentication/sign_in.dart';
import 'package:veripol/views/authentication/sign_up1.dart';
import 'package:veripol/views/onboarding/onboarding_1.dart';
import 'package:veripol/views/signup_dashboard.dart';
import 'package:veripol/views/splash/splash.dart';

class Routing {
  static final router = GoRouter(
    initialLocation: Routes.splash,
    routes: [
      GoRoute(
        path: Routes.splash,
        pageBuilder: (context, state) => RouterTransitionFactory.getTransitionPage(
          key: state.pageKey,
          context: context,
          state: state,
          child: const VeripolSplash(),
        ),
      ),
      GoRoute(
        path: Routes.onboarding,
        builder: (context, state) => const OnBoarding(),
      ),
      GoRoute(
        path: Routes.authHome,
        pageBuilder: (context, state) => RouterTransitionFactory.getTransitionPage(
          key: state.pageKey,
          context: context,
          state: state,
          type: RoutingType.fade,
          child: const SignupDashboard(),
        ),
        routes: [
          GoRoute(
              name: Routes.signIn,
              path: Routes.signIn,
              pageBuilder: (context, state) {
                final type = state.extra as RoutingType?;
                return RouterTransitionFactory.getTransitionPage(
                  key: state.pageKey,
                  context: context,
                  state: state,
                  type: type,
                  duration: 400,
                  child: const SignIn(),
                );
              }),
          GoRoute(
              name: Routes.signUp,
              path: Routes.signUp,
              pageBuilder: (context, state) {
                final type = state.extra as RoutingType?;
                return RouterTransitionFactory.getTransitionPage(
                  key: state.pageKey,
                  context: context,
                  state: state,
                  duration: 400,
                  type: type,
                  child: const SignUp1(),
                );
              }),
        ],
      ),
    ],
  );
}
