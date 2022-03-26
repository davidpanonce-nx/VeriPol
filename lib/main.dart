import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:veripol/controller/data_controller.dart';
import 'package:veripol/controller/page_controllers.dart';
import 'package:veripol/views/dashboard_wrapper.dart';

import 'components/themes.dart';

void main() {
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
        home: const DashboardWrapper(),
      ),
    );
  }
}
