import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:veripol/components/loading.dart';
import 'package:veripol/core/theme/app_themes.dart';
import 'package:veripol/firebase_options.dart';
import 'package:veripol/utils/flavors.dart';
import 'package:veripol/views/dashboard/dashboard_wrapper.dart';
import 'package:veripol/views/signup_dashboard.dart';
import 'package:veripol/views/splash.dart';

import 'core/routes/routing.dart';

Future<void> startApp(Flavor flavor) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(VeripolApp(flavor: flavor));
}

class VeripolApp extends StatelessWidget {
  const VeripolApp({required this.flavor, super.key});
  final Flavor flavor;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        title: 'Veripol',
        debugShowCheckedModeBanner: false,
        theme: AppThemes.lightTheme,
        routerConfig: Routing.router,
      ),
    );
  }
}

class VeriPolAuthWrapper extends StatelessWidget {
  const VeriPolAuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const VeripolSplash();
          } else if (snapshot.hasError) {
            return const LoadingScreen();
          } else if (snapshot.hasData) {
            return const DashboardWrapper();
          } else {
            return const SignupDashboard();
          }
        });
  }
}
