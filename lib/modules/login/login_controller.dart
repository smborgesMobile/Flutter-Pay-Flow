import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:learning_project/shared/auth/auth_controller.dart';

class LoginController {
  Future<void> googleSignIn(BuildContext context) async {
    GoogleSignIn googleSignIn = GoogleSignIn(scopes: ["email"]);
    final AuthController authController = AuthController();

    try {
      final response = await googleSignIn.signIn();
      authController.setUser(context, response);
    } catch (error) {
      authController.setUser(context, null);
    }
  }
}
