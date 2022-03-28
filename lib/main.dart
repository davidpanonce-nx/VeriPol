import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:veripol/controller/data_controller.dart';
import 'package:veripol/controller/page_controllers.dart';
import 'package:veripol/views/dashboard_wrapper.dart';

import 'components/themes.dart';
import 'views/authentication/sign_up_selection.dart';
import 'views/courses/testmodule_MCQitem.dart';
import 'views/courses/testmodule_overview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const VeripolApp());
}

class VeripolApp extends StatelessWidget {
  const VeripolApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PageControllers(),
        ),
        ChangeNotifierProvider(
          create: (_) => DataController(),
        ),
      ],
      child: MaterialApp(
        title: 'Veripol',
        debugShowCheckedModeBanner: false,
        theme: veripolTheme,
        home: const SignUpSelection(),
      ),
    );
  }
}
