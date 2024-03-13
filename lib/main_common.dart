import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:veripol/components/loading.dart';
import 'package:veripol/controller/chart_controller.dart';
import 'package:veripol/controller/my_candidate_data_controller.dart';
import 'package:veripol/utils/flavors.dart';
import 'package:veripol/views/dashboard_wrapper.dart';
import 'package:veripol/views/onboarding/splash.dart';
import 'package:veripol/views/signup_dashboard.dart';
import 'package:veripol/views/splash.dart';

import 'components/themes.dart';
import 'controller/candidate_data_controller.dart';
import 'controller/data_controller.dart';
import 'controller/page_controllers.dart';
import 'controller/pagination_controllers.dart';

void startApp(Flavor flavor) {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(VeripolApp(flavor: flavor));
}

class VeripolApp extends StatefulWidget {
  const VeripolApp({required this.flavor, super.key});
  final Flavor flavor;

  @override
  State<VeripolApp> createState() => _VeripolAppState();
}

class _VeripolAppState extends State<VeripolApp> {
  late bool firstInstall;

  @override
  void initState() {
    log(widget.flavor.name);
    checkFirstInstall();
    super.initState();
  }

  void checkFirstInstall() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    firstInstall = prefs.getBool('firstInstall') ?? true;

    if (firstInstall) {
      prefs.setBool('firstInstall', false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final init = Firebase.initializeApp();
    return FutureBuilder(
      future: init,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => PageControllers(),
              ),
              ChangeNotifierProvider(
                create: (_) => DataController(),
              ),
              ChangeNotifierProvider(
                create: (_) => CandidateDataController(),
              ),
              ChangeNotifierProvider(
                create: (_) => MyCandidatesDataController(),
              ),
              ChangeNotifierProvider(
                create: (_) => PaginationController(),
              ),
              ChangeNotifierProvider(
                create: (_) => ChartController(),
              ),
            ],
            child: MaterialApp(
              title: 'Veripol',
              debugShowCheckedModeBanner: false,
              theme: veripolTheme,
              home: firstInstall ? const SplashScreen() : const VeriPolAuthWrapper(),
            ),
          );
        } else {
          return MaterialApp(
            title: 'Veripol',
            debugShowCheckedModeBanner: false,
            theme: veripolTheme,
            home: const VeripolSplash(),
          );
        }
      },
    );
  }
}

class VeriPolAuthWrapper extends StatelessWidget {
  const VeriPolAuthWrapper({Key? key}) : super(key: key);

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
