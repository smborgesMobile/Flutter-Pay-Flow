import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_project/modules/barcode_scanner/barcode_scanner_page.dart';
import 'package:learning_project/modules/home/home_page.dart';
import 'package:learning_project/modules/login/login_page.dart';
import 'package:learning_project/modules/splash/splash_page.dart';
import 'package:learning_project/shared/themes/app_colors.dart';

class AppWidget extends StatelessWidget {
  AppWidget({super.key}) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pay Flow",
      theme: ThemeData(primaryColor: AppColors.primary),
      initialRoute: "/splash",
      routes: {
        "/home": (context) => HomePage(),
        "/splash": (context) => SplashPage(),
        "/login": (context) => LoginPage(),
        "/barcode_scanner": (context) => BarcodeScannerPage(),
      },
    );
  }
}
