import 'package:go_router/go_router.dart';
import 'package:veripol/core/routes.dart';
import 'package:veripol/views/authentication/sign_in.dart';
import 'package:veripol/views/authentication/sign_up1.dart';
import 'package:veripol/views/onboarding/onboarding_1.dart';
import 'package:veripol/views/onboarding/splash.dart';
import 'package:veripol/views/signup_dashboard.dart';
import 'package:veripol/views/splash.dart';

class Routing {
  static final router = GoRouter(
    initialLocation: Routes.splash,
    routes: [
      GoRoute(path: Routes.splash, builder: (context, state) => const VeripolSplash()),
      GoRoute(path: Routes.splashScreen, builder: (context, state) => const SplashScreen()),
      GoRoute(path: Routes.onboarding, builder: (context, state) => const OnBoarding()),
      GoRoute(
        path: Routes.authHome,
        builder: (context, state) => const SignupDashboard(),
        routes: [
          GoRoute(path: Routes.signIn, builder: (context, state) => const SignIn()),
          GoRoute(path: Routes.signUp, builder: (context, state) => const SignUp1()),
        ],
      ),
    ],
  );
}
