import 'package:flutter/material.dart';
import 'package:learning_project/modules/login/login_page.dart';
import 'package:learning_project/modules/splash/splash_page.dart';
import 'package:learning_project/shared/themes/app_colors.dart';

void main() {
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pay Flow",
      theme: ThemeData(primaryColor: AppColors.primary),
      home: LoginPage()
    );
  }
}
