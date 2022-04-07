import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:veripol/components/loading.dart';
import 'package:veripol/views/authentication/sign_up_selection.dart';
import 'package:veripol/views/dashboard_wrapper.dart';
import 'package:veripol/views/splash.dart';

import 'components/themes.dart';
import 'controller/candidate_data_controller.dart';
import 'controller/data_controller.dart';
import 'controller/page_controllers.dart';
import 'controller/pagination_controllers.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const VeripolApp());
}

class VeripolApp extends StatelessWidget {
  const VeripolApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _init = Firebase.initializeApp();
    return FutureBuilder(
      future: _init,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
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
                  create: (_) => PaginationController(),
                ),
              ],
              child: MaterialApp(
                title: 'Veripol',
                debugShowCheckedModeBanner: false,
                theme: veripolTheme,
                home: const VeriPolAuthWrapper(),
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
            return const SignUpSelection();
          }
        });
  }
}
